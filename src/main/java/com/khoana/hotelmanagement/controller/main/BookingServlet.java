package com.khoana.hotelmanagement.controller.main;

import com.khoana.hotelmanagement.dal.BookingDAO;
import com.khoana.hotelmanagement.dal.RoomDAO;
import com.khoana.hotelmanagement.model.Booking;
import com.khoana.hotelmanagement.model.Room;
import com.khoana.hotelmanagement.model.User;
import com.khoana.hotelmanagement.util.Config;
import com.khoana.hotelmanagement.util.EmailUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;

@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomIdStr = request.getParameter("roomId");
        if (roomIdStr != null && !roomIdStr.isEmpty()) {
            try {
                RoomDAO roomDAO = new RoomDAO();
                Room room = roomDAO.getRoomByID(Integer.parseInt(roomIdStr));
                if (room != null) {
                    request.setAttribute("room", room);
                    request.getRequestDispatcher("/booking.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/search");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/search");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/search");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("account");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            int roomID = Integer.parseInt(request.getParameter("roomId"));
            String checkInStr = request.getParameter("checkin");
            String checkoutStr = request.getParameter("checkout");

            LocalDate checkInDate = LocalDate.parse(checkInStr);
            LocalDate checkOutDate = LocalDate.parse(checkoutStr);
            LocalDate today = LocalDate.now();

            // FIX: Chặn đặt phòng trong quá khứ
            if (checkInDate.isBefore(today)) {
                response.sendRedirect(request.getContextPath() + "/detail?roomId=" + roomID + "&error=past_date");
                return;
            }

            long daysBetween = ChronoUnit.DAYS.between(checkInDate, checkOutDate);
            if (daysBetween <= 0) {
                response.sendRedirect(request.getContextPath() + "/detail?roomId=" + roomID + "&error=invalid_date");
                return;
            }

            RoomDAO roomDAO = new RoomDAO();
            Room room = roomDAO.getRoomByID(roomID);
            double totalPrice = daysBetween * room.getPrice();

            Booking newBooking = new Booking();
            newBooking.setUserID(currentUser.getId());
            newBooking.setRoomID(roomID);
            newBooking.setCheckInDate(Date.valueOf(checkInDate));
            newBooking.setCheckOutDate(Date.valueOf(checkOutDate));
            newBooking.setTotalPrice(totalPrice);
            newBooking.setStatus("Pending");

            BookingDAO bookingDAO = new BookingDAO();
            boolean isSuccess = bookingDAO.insertBooking(newBooking);

            if (isSuccess) {
                // 1. Gửi Email thông báo (Chạy ngầm hoặc bọc try-catch để không làm treo thanh toán)
                try {
                    EmailUtils.sendBookingConfirmEmail(currentUser.getEmail(), currentUser.getFullName(),
                            "Phòng " + room.getRoomNumber(), checkInStr, checkoutStr, totalPrice);
                } catch (Exception e) {
                    System.err.println("Email service error: " + e.getMessage());
                }

                // 2. VNPay Payment Integration
                int latestBookingID = bookingDAO.getLatestBookingID(currentUser.getId());
                long amount = (long) (totalPrice * 100);
                String vnp_TxnRef = Config.getRandomNumber(8);

                Map<String, String> vnp_Params = new HashMap<>();
                vnp_Params.put("vnp_Version", "2.1.0");
                vnp_Params.put("vnp_Command", "pay");
                vnp_Params.put("vnp_TmnCode", Config.vnp_TmnCode);
                vnp_Params.put("vnp_Amount", String.valueOf(amount));
                vnp_Params.put("vnp_CurrCode", "VND");
                vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + latestBookingID);
                vnp_Params.put("vnp_OrderType", "other");
                vnp_Params.put("vnp_Locale", "vn");
                vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
                vnp_Params.put("vnp_IpAddr", Config.getIpAddress(request));

                Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                vnp_Params.put("vnp_CreateDate", formatter.format(cld.getTime()));

                cld.add(Calendar.MINUTE, 15);
                vnp_Params.put("vnp_ExpireDate", formatter.format(cld.getTime()));

                // FIX: Ép kiểu List tường minh để tránh lỗi compile
                List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
                Collections.sort(fieldNames);

                StringBuilder hashData = new StringBuilder();
                StringBuilder query = new StringBuilder();
                for (String fieldName : fieldNames) {
                    String fieldValue = vnp_Params.get(fieldName);
                    if ((fieldValue != null) && (fieldValue.length() > 0)) {
                        hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString())).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                        if (!fieldName.equals(fieldNames.get(fieldNames.size() - 1))) {
                            query.append('&');
                            hashData.append('&');
                        }
                    }
                }

                String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
                String paymentUrl = Config.vnp_PayUrl + "?" + query.toString() + "&vnp_SecureHash=" + vnp_SecureHash;

                response.sendRedirect(paymentUrl);

            } else {
                response.sendRedirect(request.getContextPath() + "/search?error=booking_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/search?error=invalid_data");
        }
    }
}
