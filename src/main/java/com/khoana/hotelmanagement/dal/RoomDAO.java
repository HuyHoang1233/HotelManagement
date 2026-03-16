package com.khoana.hotelmanagement.dal;

import com.khoana.hotelmanagement.model.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO extends DBContext {

    public List<Room> getAllRooms() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT r.roomID, r.roomNumber, r.typeID, r.price, r.status, r.imageURL, "
                + "t.typeName, t.description "
                + "FROM Rooms r "
                + "JOIN RoomTypes t ON r.typeID = t.typeID";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getInt("roomID"));
                room.setRoomNumber(rs.getString("roomNumber"));
                room.setTypeID(rs.getInt("typeID"));
                room.setTypeName(rs.getString("typeName"));
                room.setPrice(rs.getDouble("price"));
                room.setStatus(rs.getString("status"));
                room.setDescription(rs.getString("description"));
                room.setImage(rs.getString("imageURL"));
                list.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Room getRoomByID(int id) {
        String sql = "SELECT r.roomID, r.roomNumber, r.typeID, r.price, r.status, r.imageURL, "
                + "t.typeName, t.description "
                + "FROM Rooms r "
                + "JOIN RoomTypes t ON r.typeID = t.typeID "
                + "WHERE r.roomID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getInt("roomID"));
                room.setRoomNumber(rs.getString("roomNumber"));
                room.setTypeID(rs.getInt("typeID"));
                room.setTypeName(rs.getString("typeName"));
                room.setPrice(rs.getDouble("price"));
                room.setStatus(rs.getString("status"));
                room.setDescription(rs.getString("description"));
                room.setImage(rs.getString("imageURL"));
                return room;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addRoom(Room r) {
        String sql = "INSERT INTO Rooms (roomNumber, typeID, price, status, imageURL) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, r.getRoomNumber());
            ps.setInt(2, r.getTypeID());
            ps.setDouble(3, r.getPrice());
            ps.setString(4, r.getStatus());
            ps.setString(5, r.getImage());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateRoom(Room r) {
        String sql = "UPDATE Rooms SET roomNumber=?, typeID=?, price=?, status=?, imageURL=? WHERE roomID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, r.getRoomNumber());
            ps.setInt(2, r.getTypeID());
            ps.setDouble(3, r.getPrice());
            ps.setString(4, r.getStatus());
            ps.setString(5, r.getImage());
            ps.setInt(6, r.getRoomID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteRoom(int id) {
        String sql = "DELETE FROM Rooms WHERE roomID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ĐÃ FIX: Truyền thêm tham số null thứ 5 cho biến sort
    public List<Room> searchAvailableRoom(String checkIn, String checkOut) {
        return searchAdvancedRooms(checkIn, checkOut, null, null, null);
    }

    // =========================================================
    // HÀM LỌC PHÒNG NÂNG CAO CÓ KÈM SẮP XẾP (Chuẩn 100%)
    // =========================================================
    // ĐÃ FIX: Thêm tham số String sort vào hàm
    public List<Room> searchAdvancedRooms(String checkIn, String checkOut, String priceMin, String priceMax, String sort) {
        List<Room> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT r.roomID, r.roomNumber, r.typeID, r.price, r.status, r.imageURL, t.typeName, t.description "
                + "FROM Rooms r JOIN RoomTypes t ON r.typeID = t.typeID "
                + "WHERE r.status = 'Available' "
        );

        boolean hasDate = (checkIn != null && checkOut != null && !checkIn.trim().isEmpty() && !checkOut.trim().isEmpty());
        if (hasDate) {
            sql.append("AND r.roomID NOT IN (SELECT roomID FROM Bookings WHERE checkInDate < ? AND checkOutDate > ? AND status != 'Cancelled') ");
        }

        boolean hasMinPrice = (priceMin != null && !priceMin.trim().isEmpty());
        boolean hasMaxPrice = (priceMax != null && !priceMax.trim().isEmpty());

        if (hasMinPrice) {
            sql.append("AND r.price >= ? ");
        }
        if (hasMaxPrice) {
            sql.append("AND r.price <= ? ");
        }

        // ==========================================
        // ĐOẠN ĐƯỢC THÊM VÀO ĐỂ XỬ LÝ SẮP XẾP GIÁ
        // ==========================================
        if (sort != null && !sort.isEmpty()) {
            if (sort.equals("price_asc")) {
                sql.append("ORDER BY r.price ASC "); // ASC: Tăng dần (Từ thấp đến cao)
            } else if (sort.equals("price_desc")) {
                sql.append("ORDER BY r.price DESC "); // DESC: Giảm dần (Từ cao đến thấp)
            }
        }
        // ==========================================

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            int paramIndex = 1;

            if (hasDate) {
                st.setString(paramIndex++, checkOut);
                st.setString(paramIndex++, checkIn);
            }
            if (hasMinPrice) {
                st.setDouble(paramIndex++, Double.parseDouble(priceMin));
            }
            if (hasMaxPrice) {
                st.setDouble(paramIndex++, Double.parseDouble(priceMax));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getInt("roomID"));
                room.setRoomNumber(rs.getString("roomNumber"));
                room.setTypeID(rs.getInt("typeID"));
                room.setTypeName(rs.getString("typeName"));
                room.setPrice(rs.getDouble("price"));
                room.setStatus(rs.getString("status"));
                room.setImage(rs.getString("imageURL"));
                room.setDescription(rs.getString("description"));
                list.add(room);
            }
        } catch (Exception e) {
            System.out.println("=== LỖI KẾT NỐI DATABASE ===: " + e.getMessage());
        }
        return list;
    }
}
