package com.khoana.hotelmanagement.resources.filter;

import com.khoana.hotelmanagement.model.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Filter này sẽ bảo vệ tất cả các file trong thư mục admin và các servlet có đường dẫn bắt đầu bằng /admin
@WebFilter(urlPatterns = {"/admin/*", "/BookingManagerServlet", "/RoomManagerServlet", "/UserManagerServlet"})
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        // Lấy account từ session
        User user = (User) session.getAttribute("account");

        // KIỂM TRA PHÂN QUYỀN
        if (user != null && user.getRoleID() == 1) {
            // Nếu là Admin (roleID = 1) -> Cho phép đi tiếp
            chain.doFilter(request, response);
        } else {
            // Nếu không phải Admin -> Đá về trang home hoặc trang báo lỗi kèm thông báo
            res.sendRedirect(req.getContextPath() + "/home?error=access-denied");
        }
    }

    @Override
    public void destroy() {
    }
}
