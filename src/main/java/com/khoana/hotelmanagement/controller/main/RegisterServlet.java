package com.khoana.hotelmanagement.controller.main;

import com.khoana.hotelmanagement.dal.UserDAO;
import com.khoana.hotelmanagement.model.User;
import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // Để nhận tên tiếng Việt

        String fullName = request.getParameter("fullName"); // Tên input bên jsp
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String confirmPass = request.getParameter("confirmPassword");

        // 1. Validate cơ bản
        if (!pass.equals(confirmPass)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();

        // 2. Kiểm tra email tồn tại chưa
        if (dao.checkEmailExist(email)) {
            request.setAttribute("error", "Email này đã được sử dụng!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            // 3. Đăng ký vào DB
            dao.register(fullName, email, pass);

            // --- BƯỚC QUAN TRỌNG: TỰ ĐỘNG ĐĂNG NHẬP & NHỚ MK ---
            // a. Lấy User vừa tạo ra từ DB
            User user = dao.getUserByEmail(email);

            // b. Tạo Session (Đăng nhập luôn)
            HttpSession session = request.getSession();
            session.setAttribute("account", user);
            session.setMaxInactiveInterval(1800);

            // c. Tạo Cookie (Lưu mật khẩu luôn)
            String encodedEmail = URLEncoder.encode(email, "UTF-8");
            String encodedPass = URLEncoder.encode(pass, "UTF-8");

            Cookie c_user = new Cookie("uName", encodedEmail);
            Cookie c_pass = new Cookie("uPass", encodedPass);
            // Tự động bật chế độ Remember (set value là "on")
            Cookie c_rem = new Cookie("uRem", "on");

            // Set thời gian 7 ngày
            c_user.setMaxAge(60 * 60 * 24 * 7);
            c_pass.setMaxAge(60 * 60 * 24 * 7);
            c_rem.setMaxAge(60 * 60 * 24 * 7);

            // Set đường dẫn toàn trang
            c_user.setPath("/");
            c_pass.setPath("/");
            c_rem.setPath("/");

            // Gửi cookie về trình duyệt
            response.addCookie(c_user);
            response.addCookie(c_pass);
            response.addCookie(c_rem);
            // ---------------------------------------------------

            // 4. Chuyển thẳng về trang chủ (Bỏ qua bước Login)
            response.sendRedirect("home");
        }
    }
}
