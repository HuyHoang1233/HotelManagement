package com.khoana.hotelmanagement.controller.main;

import com.khoana.hotelmanagement.dal.UserDAO;
import com.khoana.hotelmanagement.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/history");
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

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");

        // BACKEND VALIDATION: Chống bypass bằng tool hoặc disable JavaScript
        if (phone != null && !phone.isEmpty()) {
            if (!phone.matches("^0[0-9]{9}$")) {
                response.sendRedirect(request.getContextPath() + "/history?error=invalid_phone");
                return;
            }
        }

        UserDAO dao = new UserDAO();
        // Không cập nhật trực tiếp vào currentUser trong session để tránh hiện thông báo lỗi nhưng dữ liệu vẫn "nhảy"
        User tempUser = new User();
        tempUser.setId(currentUser.getId());
        tempUser.setFullName(fullName);
        tempUser.setPhone(phone);
        
        boolean success = dao.updateUserProfile(tempUser);

        if (success) {
            // Chỉ khi DB thành công mới cập nhật Session
            currentUser.setFullName(fullName);
            currentUser.setPhone(phone);
            session.setAttribute("account", currentUser);
            response.sendRedirect(request.getContextPath() + "/history?message=update_success");
        } else {
            response.sendRedirect(request.getContextPath() + "/history?error=update_failed");
        }
    }
}
