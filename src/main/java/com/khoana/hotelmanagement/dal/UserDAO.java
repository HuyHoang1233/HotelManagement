package com.khoana.hotelmanagement.dal;

import com.khoana.hotelmanagement.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    // Hàm bổ trợ để tạo đối tượng User tránh viết lặp code nhiều lần
    private User mapUser(ResultSet rs) throws SQLException {
        User u = new User();
        u.setId(rs.getInt("userID"));
        u.setFullName(rs.getNString("fullName"));
        u.setEmail(rs.getString("email"));
        u.setPassword(rs.getString("password"));
        u.setRoleID(rs.getInt("roleID"));
        try {
            u.setStatus(rs.getString("status"));
        } catch (Exception ignored) {
        }
        try {
            u.setPhone(rs.getString("phone"));
        } catch (Exception ignored) {
        }
        return u;
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM Users WHERE email = ?";
        try {
            if (connection == null) {
                return null;
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return mapUser(rs);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi getUserByEmail: " + e.getMessage());
        }
        return null;
    }

    public User checkLogin(String email, String password) {
        String sql = "SELECT * FROM Users WHERE email = ? AND password = ?";
        try {
            if (connection == null) {
                return null;
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return mapUser(rs);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi checkLogin: " + e.getMessage());
        }
        return null;
    }

    public boolean checkEmailExist(String email) {
        String sql = "SELECT userID FROM Users WHERE email = ?";
        try {
            if (connection == null) {
                return false;
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean register(String fullName, String email, String password) {
        String sql = "INSERT INTO Users (fullName, email, password, roleID, status) VALUES (?, ?, ?, 2, 'Active')";
        try {
            if (connection == null) {
                return false;
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, fullName);
            st.setString(2, email);
            st.setString(3, password);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Lỗi register: " + e.getMessage());
        }
        return false;
    }

    public void updatePassword(String email, String newPassword) {
        String sql = "UPDATE Users SET password = ? WHERE email = ?";
        try {
            if (connection == null) {
                return;
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi updatePassword: " + e.getMessage());
        }
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try {
            if (connection == null) {
                return list;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapUser(rs));
            }
        } catch (SQLException e) {
            System.out.println("Lỗi getAllUsers: " + e.getMessage());
        }
        return list;
    }

    public void deleteUser(int id) {
        String sql = "DELETE FROM Users WHERE userID = ?";
        try {
            if (connection == null) {
                return;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi deleteUser: " + e.getMessage());
        }
    }

    public void changeUserRole(int id, int newRoleID) {
        String sql = "UPDATE Users SET roleID = ? WHERE userID = ?";
        try {
            if (connection == null) {
                return;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newRoleID);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi changeUserRole: " + e.getMessage());
        }
    }

    public User getUserByID(int id) {
        String sql = "SELECT * FROM Users WHERE userID = ?";
        try {
            if (connection == null) {
                return null;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapUser(rs);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi getUserByID: " + e.getMessage());
        }
        return null;
    }

    public boolean insertUserAdmin(User user) {
        String sql = "INSERT INTO Users (fullName, email, password, roleID, status) VALUES (?, ?, ?, ?, 'Active')";
        try {
            if (connection == null) {
                return false;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setInt(4, user.getRoleID());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Lỗi insertUserAdmin: " + e.getMessage());
        }
        return false;
    }

    public boolean updateUserProfile(User user) {
        String sql = "UPDATE Users SET fullName = ?, phone = ? WHERE userID = ?";
        try {
            if (connection == null) {
                return false;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, user.getFullName());
            ps.setString(2, user.getPhone());
            ps.setInt(3, user.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Lỗi updateUserProfile: " + e.getMessage());
        }
        return false;
    }

    public List<User> getAllCustomers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE roleID != 1";
        try {
            if (connection == null) {
                return list;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapUser(rs));
            }
        } catch (Exception e) {
            System.out.println("Lỗi getAllCustomers: " + e.getMessage());
        }
        return list;
    }

    public boolean updateUserStatus(int userId, String newStatus) {
        String sql = "UPDATE Users SET status = ? WHERE userID = ?";
        try {
            if (connection == null) {
                return false;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Lỗi updateUserStatus: " + e.getMessage());
        }
        return false;
    }
    
    public void registerGoogleUser(String fullName, String email) {
        String sql = "INSERT INTO Users (fullName, email, password, roleID, status) VALUES (?, ?, '', 2, 'Active')";
        try {
            if (connection == null) return;
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, fullName);
            st.setString(2, email);
            st.executeUpdate();
            System.out.println("Đã đăng ký thành công Google user: " + email);
        } catch (SQLException e) {
            System.out.println("Lỗi registerGoogleUser: " + e.getMessage());
        }
    }
}
