
package com.khoana.hotelmanagement.dal;

import com.khoana.hotelmanagement.model.Booking;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.List;

public class BookingDAO extends DBContext {

    // =====================================================================
    // HÀM BỔ SUNG: Dùng cho BookingServlet mình gửi hôm trước
    // =====================================================================
    public boolean insertBooking(int userId, int roomId, String checkIn, String checkOut, double totalPrice) {
        String sql = "INSERT INTO Bookings (userID, roomID, checkInDate, checkOutDate, totalPrice, status) "
                + "VALUES (?, ?, ?, ?, ?, 'Pending')";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, roomId);
            ps.setString(3, checkIn);
            ps.setString(4, checkOut);
            ps.setDouble(5, totalPrice);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Lỗi Insert Booking (Tham số rời): " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    // 1. Hàm lưu đơn đặt phòng mới vào Database (Của bạn)
    public boolean insertBooking(Booking booking) {
        String sql = "INSERT INTO Bookings (userID, roomID, checkInDate, checkOutDate, totalPrice, status) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            if (connection == null) {
                return false;
            }

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, booking.getUserID());
            ps.setInt(2, booking.getRoomID());
            ps.setDate(3, booking.getCheckInDate());
            ps.setDate(4, booking.getCheckOutDate());
            ps.setDouble(5, booking.getTotalPrice());
            ps.setString(6, booking.getStatus());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            System.out.println("Lỗi tại insertBooking (Object): " + e.getMessage());
        }
        return false;
    }

    // 2. Hàm lấy dsach lịch sử book phòng của 1 User cụ thể
    public List<Booking> getBookingsByUserID(int userID) {
        List<Booking> list = new ArrayList<>();

        // ĐÃ FIX LỖI "BÓNG MA": Thay bookingDate thành bookingID để không bị lỗi SQL
        String sql = "SELECT b.*, r.roomNumber, t.typeName "
                + "FROM Bookings b "
                + "JOIN Rooms r ON b.roomID = r.roomID "
                + "JOIN RoomTypes t ON r.typeID = t.typeID "
                + "WHERE b.userID = ? "
                + "ORDER BY b.bookingID DESC";

        try {
            if (connection == null) {
                return list;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("bookingID"));
                b.setUserID(rs.getInt("userID"));
                b.setRoomID(rs.getInt("roomID"));
                b.setCheckInDate(rs.getDate("checkInDate"));
                b.setCheckOutDate(rs.getDate("checkOutDate"));
                b.setTotalPrice(rs.getDouble("totalPrice"));
                b.setStatus(rs.getString("status"));
                b.setRoomNumber(rs.getString("roomNumber"));
                b.setTypeName(rs.getString("typeName"));

                // ĐÃ FIX: Cho vào try-catch để nếu CSDL không có cột bookingDate web vẫn không sập
                try {
                    b.setBookingDate(rs.getTimestamp("bookingDate"));
                } catch (Exception ignored) {
                }

                list.add(b);
            }
        } catch (Exception e) {
            System.out.println("Lỗi tại getBookingsByUserID: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    // 3. Lấy ID của đơn đặt phòng vừa mới tạo xong (Để gửi VNPay)
    public int getLatestBookingID(int userID) {
        String sql = "SELECT TOP 1 bookingID FROM Bookings WHERE userID = ? ORDER BY bookingID DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("bookingID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // =====================================================================
    // CÁC HÀM MỚI THÊM CHO KHU VỰC ADMIN
    // =====================================================================
    // 4. Lấy tất cả danh sách đơn hàng trong hệ thống (Cho Admin)
    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM Bookings ORDER BY bookingID DESC";

        try {
            if (connection == null) {
                return list;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("bookingID"));
                b.setUserID(rs.getInt("userID"));
                b.setRoomID(rs.getInt("roomID"));
                b.setCheckInDate(rs.getDate("checkInDate"));
                b.setCheckOutDate(rs.getDate("checkOutDate"));
                b.setTotalPrice(rs.getDouble("totalPrice"));
                b.setStatus(rs.getString("status"));

                try {
                    b.setBookingDate(rs.getTimestamp("bookingDate"));
                } catch (Exception ignored) {
                }

                list.add(b);
            }
        } catch (Exception e) {
            System.out.println("Lỗi tại getAllBookings: " + e.getMessage());
        }
        return list;
    }

    // 5. Cập nhật trạng thái duyệt/hủy đơn hàng
    public void updateStatus(int bookingID, String status) {
        String sql = "UPDATE Bookings SET status = ? WHERE bookingID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, bookingID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Lỗi tại updateStatus: " + e.getMessage());
        }
    }
    // 6. Lấy thông tin đơn hàng theo ID
    public Booking getBookingByID(int bookingID) {
        String sql = "SELECT * FROM Bookings WHERE bookingID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bookingID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("bookingID"));
                b.setUserID(rs.getInt("userID"));
                b.setRoomID(rs.getInt("roomID"));
                b.setCheckInDate(rs.getDate("checkInDate"));
                b.setCheckOutDate(rs.getDate("checkOutDate"));
                b.setTotalPrice(rs.getDouble("totalPrice"));
                b.setStatus(rs.getString("status"));
                return b;
            }
        } catch (Exception e) {
            System.out.println("Lỗi tại getBookingByID: " + e.getMessage());
        }
        return null;
    }
}
