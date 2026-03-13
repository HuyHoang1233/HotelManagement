package com.khoana.hotelmanagement.controller.main;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.khoana.hotelmanagement.dal.RoomDAO;
import com.khoana.hotelmanagement.model.Room;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Nhận thông số từ giao diện (Bao gồm cả tham số sắp xếp)
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        String priceMin = request.getParameter("priceMin");
        String priceMax = request.getParameter("priceMax");

        // ĐÃ FIX: Lấy thêm tham số sắp xếp từ Dropdown
        String sort = request.getParameter("sort");

        // 2. Gọi DAO chui xuống DB lấy phòng
        RoomDAO roomDAO = new RoomDAO();

        // ĐÃ FIX: Truyền đủ 5 tham số (kèm biến sort) xuống cho DAO
        List<Room> roomList = roomDAO.searchAdvancedRooms(checkin, checkout, priceMin, priceMax, sort);

        // 3. Đóng gói dữ liệu gửi sang JSP
        request.setAttribute("rooms", roomList);
        request.setAttribute("checkin", checkin);
        request.setAttribute("checkout", checkout);
        request.setAttribute("priceMin", priceMin);
        request.setAttribute("priceMax", priceMax);

        // ĐÃ FIX: Trả biến sort về JSP để giữ nguyên trạng thái Dropdown hiển thị
        request.setAttribute("sort", sort);

        // 4. Chuyển hướng
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
