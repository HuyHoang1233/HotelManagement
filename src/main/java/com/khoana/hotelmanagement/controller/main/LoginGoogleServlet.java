package com.khoana.hotelmanagement.controller.main;

import com.khoana.hotelmanagement.dal.UserDAO;
import com.khoana.hotelmanagement.model.GoogleUser;
import com.khoana.hotelmanagement.model.User;
import com.khoana.hotelmanagement.util.GoogleUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/login-google"})
public class LoginGoogleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("DEBUG: --- BẮT ĐẦU LOGIN GOOGLE ---");

        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            System.out.println("DEBUG: Không nhận được Code từ Google.");
            response.sendRedirect("login.jsp?error=AccessDenied");
            return;
        }

        try {
    
            System.out.println("DEBUG: Đang lấy Access Token...");
            String accessToken = GoogleUtils.getToken(code);
       

   
            System.out.println("DEBUG: Đang lấy thông tin User...");
            GoogleUser googleUser = GoogleUtils.getUserInfo(accessToken);
            System.out.println("DEBUG: Email Google: " + googleUser.getEmail());

            if (googleUser != null) {
                String email = googleUser.getEmail();
                UserDAO dao = new UserDAO();


                System.out.println("DEBUG: Kiểm tra email trong DB...");
                if (!dao.checkEmailExist(email)) {
                    System.out.println("DEBUG: Email chưa tồn tại -> Đang ĐĂNG KÝ...");
                    dao.register(googleUser.getName(), email, "GoogleLogin@123");
                    System.out.println("DEBUG: Đã chạy lệnh register xong.");
                }


                User user = dao.getUserByEmail(email);


                if (user == null) {
                    System.out.println("DEBUG: getUserByEmail trả về null -> Thử checkLogin...");
                    user = dao.checkLogin(email, "GoogleLogin@123");
                }

                if (user != null) {
      
                    System.out.println("DEBUG: Đăng nhập THÀNH CÔNG! Email: " + user.getEmail());

                    HttpSession session = request.getSession();
                    session.setAttribute("account", user);
                    response.sendRedirect("home");
                } else {
                    System.out.println("DEBUG: LỖI NGHIÊM TRỌNG - Không tìm thấy User trong DB sau khi đăng ký.");
                    System.out.println("DEBUG: Khả năng cao là hàm register() bị lỗi SQL (ví dụ: thiếu cột bắt buộc).");
                    response.sendRedirect("login.jsp?error=RegisterFailed");
                }
            }
        } catch (Exception e) {
            System.out.println("DEBUG: GẶP LỖI EXCEPTION:");
            e.printStackTrace(); // In lỗi đỏ lòm ra Output
            response.sendRedirect("login.jsp?error=Exception");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
