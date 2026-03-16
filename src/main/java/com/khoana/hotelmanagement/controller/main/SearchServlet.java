package com.khoana.hotelmanagement.controller.main;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.khoana.hotelmanagement.dal.RoomDAO;
import com.khoana.hotelmanagement.model.Room;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Nhận thông số từ giao diện 
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        String priceMin = request.getParameter("priceMin");
        String priceMax = request.getParameter("priceMax");
        String sort = request.getParameter("sort");

        // ĐOẠN QUAN TRỌNG ĐỂ LỌC PHÒNG ĐƠN/ĐÔI: Lấy mảng các Checkbox "Loại phòng"
        String[] roomTypes = request.getParameterValues("roomType");

        // 2. Gọi DAO chui xuống DB lấy phòng
        RoomDAO roomDAO = new RoomDAO();

        // ĐÃ FIX: Truyền đủ 6 tham số (kèm mảng roomTypes) xuống cho DAO
        List<Room> roomList = roomDAO.searchAdvancedRooms(checkin, checkout, priceMin, priceMax, sort, roomTypes);

        // 3. Đóng gói dữ liệu gửi sang JSP
        request.setAttribute("rooms", roomList);
        request.setAttribute("checkin", checkin);
        request.setAttribute("checkout", checkout);
        request.setAttribute("priceMin", priceMin);
        request.setAttribute("priceMax", priceMax);
        request.setAttribute("sort", sort);

        // 4. LƯU LẠI TRẠNG THÁI CHECKBOX: Để khi load lại trang, các ô khách vừa tích không bị mất dấu check
        if (roomTypes != null) {
            for (String type : roomTypes) {
                // Nó sẽ tạo ra các biến check_single, check_double, check_suite
                request.setAttribute("check_" + type, "checked");
            }
        }

        // 5. Chuyển hướng
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
