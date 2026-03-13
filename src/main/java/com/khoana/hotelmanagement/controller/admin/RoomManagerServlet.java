package com.khoana.hotelmanagement.controller.admin;

import com.khoana.hotelmanagement.dal.RoomDAO;
import com.khoana.hotelmanagement.model.Room;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RoomManagerServlet", urlPatterns = {"/admin/rooms"})
public class RoomManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        RoomDAO dao = new RoomDAO();

        switch (action) {
            case "new":
                request.getRequestDispatcher("/admin/room-form.jsp").forward(request, response);
                break;
            case "edit":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Room existingRoom = dao.getRoomByID(id);
                    if (existingRoom == null) {
                        request.getSession().setAttribute("error", "Không tìm thấy phòng với ID này!");
                        response.sendRedirect(request.getContextPath() + "/admin/rooms");
                        return;
                    }
                    request.setAttribute("room", existingRoom);
                    request.getRequestDispatcher("/admin/room-form.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    request.getSession().setAttribute("error", "ID phòng không hợp lệ!");
                    response.sendRedirect(request.getContextPath() + "/admin/rooms");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.getSession().setAttribute("error", "Đã xảy ra hệ thống!");
                    response.sendRedirect(request.getContextPath() + "/admin/rooms");
                }
                break;
            default:
                List<Room> listRooms = dao.getAllRooms();
                request.setAttribute("listRooms", listRooms);
                request.getRequestDispatcher("/admin/room-list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        RoomDAO dao = new RoomDAO();

        try {
            if ("insert".equals(action)) {
                // Ép kiểu typeID từ chuỗi sang số nguyên
                int typeID = Integer.parseInt(request.getParameter("typeID"));
                
                Room newRoom = new Room(
                        0, // roomID tự tăng nên để 0
                        request.getParameter("roomNumber"),
                        typeID,
                        "", // typeName không cần khi insert, để rỗng
                        Double.parseDouble(request.getParameter("price")),
                        request.getParameter("status"),
                        request.getParameter("description"),
                        request.getParameter("image")
                );
                dao.addRoom(newRoom);

            } else if ("update".equals(action)) {
                // Ép kiểu typeID từ chuỗi sang số nguyên
                int typeID = Integer.parseInt(request.getParameter("typeID"));
                
                Room room = new Room(
                        Integer.parseInt(request.getParameter("id")),
                        request.getParameter("roomNumber"),
                        typeID,
                        "", // typeName không cần khi update, để rỗng
                        Double.parseDouble(request.getParameter("price")),
                        request.getParameter("status"),
                        request.getParameter("description"),
                        request.getParameter("image")
                );
                dao.updateRoom(room);
            } else if ("delete".equals(action)) {
                dao.deleteRoom(Integer.parseInt(request.getParameter("id")));
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Dữ liệu nhập vào không hợp lệ (lỗi định dạng số)!");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Đã xảy ra lỗi hệ thống khi xử lý!");
        }
 
        response.sendRedirect(request.getContextPath() + "/admin/rooms");
    }
}