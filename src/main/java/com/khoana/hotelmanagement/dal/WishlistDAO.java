package com.khoana.hotelmanagement.dal;

import com.khoana.hotelmanagement.model.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WishlistDAO extends DBContext {

    public void toggleWishlist(int userId, int roomId) {
        try {
            String checkSql = "SELECT * FROM Wishlists WHERE userID = ? AND roomID = ?";
            PreparedStatement psCheck = connection.prepareStatement(checkSql);
            psCheck.setInt(1, userId);
            psCheck.setInt(2, roomId);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                String delSql = "DELETE FROM Wishlists WHERE userID = ? AND roomID = ?";
                PreparedStatement psDel = connection.prepareStatement(delSql);
                psDel.setInt(1, userId);
                psDel.setInt(2, roomId);
                psDel.executeUpdate();
            } else {
                String addSql = "INSERT INTO Wishlists(userID, roomID) VALUES(?, ?)";
                PreparedStatement psAdd = connection.prepareStatement(addSql);
                psAdd.setInt(1, userId);
                psAdd.setInt(2, roomId);
                psAdd.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Room> getWishlistByUser(int userId) {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT r.roomID, r.roomNumber, r.price, r.imageURL, t.typeName "
                + "FROM Rooms r "
                + "JOIN RoomTypes t ON r.typeID = t.typeID "
                + "JOIN Wishlists w ON r.roomID = w.roomID "
                + "WHERE w.userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getInt("roomID"));
                room.setRoomNumber(rs.getString("roomNumber"));
                room.setPrice(rs.getDouble("price"));
                room.setImage(rs.getString("imageURL"));
                room.setTypeName(rs.getString("typeName"));
                list.add(room);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
