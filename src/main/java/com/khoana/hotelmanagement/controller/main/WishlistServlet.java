package com.khoana.hotelmanagement.controller.main;

import com.khoana.hotelmanagement.dal.WishlistDAO;
import com.khoana.hotelmanagement.dal.ReviewDAO;
import com.khoana.hotelmanagement.model.Room;
import com.khoana.hotelmanagement.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "WishlistServlet", urlPatterns = {"/wishlist", "/review"})
public class WishlistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        WishlistDAO dao = new WishlistDAO();

        if ("toggle".equals(action)) {
            try {
                int roomId = Integer.parseInt(request.getParameter("roomId"));
                dao.toggleWishlist(account.getId(), roomId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer != null ? referer : request.getContextPath() + "/search");
            return;
        }

        List<Room> wishlist = dao.getWishlistByUser(account.getId());
        request.setAttribute("wishlist", wishlist);
        request.getRequestDispatcher("/wishlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String servletPath = request.getServletPath();

        if ("/review".equals(servletPath)) {
            try {
                int roomId = Integer.parseInt(request.getParameter("roomId"));
                int rating = Integer.parseInt(request.getParameter("rating"));
                String comment = request.getParameter("comment");

                ReviewDAO rDao = new ReviewDAO();
                rDao.addReview(account.getId(), roomId, rating, comment);

                response.sendRedirect(request.getContextPath() + "/detail?roomId=" + roomId);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/home");
            }
        }
    }
}
