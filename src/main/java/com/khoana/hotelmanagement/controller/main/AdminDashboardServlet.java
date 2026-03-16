package com.khoana.hotelmanagement.controller.admin;

import com.khoana.hotelmanagement.dal.AdminDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();

        int year = LocalDate.now().getYear();
        if (request.getParameter("year") != null) {
            try {
                year = Integer.parseInt(request.getParameter("year"));
            } catch (Exception e) {
            }
        }

        int availableRooms = dao.getAvailableRoomsCount();
        int newBookings = dao.getNewBookingsCount();
        double[] monthlyRevenues = dao.getRevenueByYear(year);

        double totalYearRevenue = 0;
        for (double r : monthlyRevenues) {
            totalYearRevenue += r;
        }

        request.setAttribute("availableRooms", availableRooms);
        request.setAttribute("newBookings", newBookings);
        request.setAttribute("revenueData", Arrays.toString(monthlyRevenues));
        request.setAttribute("totalYearRevenue", totalYearRevenue);
        request.setAttribute("selectedYear", year);

        request.getRequestDispatcher("/admin/admin_dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
