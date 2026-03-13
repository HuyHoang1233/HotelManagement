package com.khoana.hotelmanagement.controller.main;

import com.khoana.hotelmanagement.dal.RoomDAO;
import com.khoana.hotelmanagement.model.Room;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DetailServlet", urlPatterns = {"/detail"})
public class DetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Lấy ID của phòng từ URL (ví dụ: ?roomId=1)
        String roomIdStr = request.getParameter("roomId");

        if (roomIdStr != null && !roomIdStr.isEmpty()) {
            try {
                int roomId = Integer.parseInt(roomIdStr);
                RoomDAO dao = new RoomDAO();

                // 2. Chui xuống Database lấy thông tin chi tiết của phòng đó
                Room room = dao.getRoomByID(roomId);

                // 3. Nếu tìm thấy phòng, gửi dữ liệu sang trang detail.jsp
                if (room != null) {
                    request.setAttribute("room", room);
                    request.getRequestDispatcher("/detail.jsp").forward(request, response);
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 4. Nếu có lỗi (nhập bậy ID trên URL) hoặc không tìm thấy phòng, đá về trang chủ
        response.sendRedirect(request.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    
    }
}
