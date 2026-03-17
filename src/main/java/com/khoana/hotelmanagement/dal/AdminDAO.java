package com.khoana.hotelmanagement.dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO extends DBContext {

    public int getAvailableRoomsCount() {
        try {
            String sql = "SELECT COUNT(*) FROM Rooms WHERE status = 'Available'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getNewBookingsCount() {
        try {
            String sql = "SELECT COUNT(*) FROM Bookings WHERE status = 'Pending'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double[] getRevenueByYear(int year) {
        double[] revenues = new double[12];
        String sql = "SELECT MONTH(checkOutDate) as month, SUM(totalPrice) as total "
                + "FROM Bookings WHERE YEAR(checkOutDate) = ? AND status != 'Cancelled' "
                + "GROUP BY MONTH(checkOutDate)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                revenues[rs.getInt("month") - 1] = rs.getDouble("total");
            }
        } catch (Exception e) {
        }
        return revenues;
    }
}
