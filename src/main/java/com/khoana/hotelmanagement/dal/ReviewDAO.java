package com.khoana.hotelmanagement.dal;

import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class ReviewDAO extends DBContext {

    public void addReview(int userId, int roomId, int rating, String comment) {
        String sql = "INSERT INTO Reviews (userID, roomID, rating, comment, reviewDate) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, roomId);
            ps.setInt(3, rating);
            ps.setString(4, comment);
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
