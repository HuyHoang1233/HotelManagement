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

// Đổi đường dẫn cho khớp với Menu Sidebar (và trỏ thêm '/admin/rooms' của file jsps)
@WebServlet(name = "RoomManagerServlet", urlPatterns = {"/admin/room-manager", "/admin/rooms"})
public class RoomManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RoomDAO dao = new RoomDAO();
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                request.getRequestDispatcher("/admin/room-form.jsp").forward(request, response);
                break;
            case "edit":
                try {
                    // Lấy ID phòng (file list có thể dùng id hoặc roomID, phòng hờ cả hai)
                    String idParam = request.getParameter("id");
                    if (idParam == null) {
                        idParam = request.getParameter("roomID");
                    }
                    
                    int id = Integer.parseInt(idParam);
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
                    request.getSession().setAttribute("error", "Đã xảy ra lỗi hệ thống!");
                    response.sendRedirect(request.getContextPath() + "/admin/rooms");
                }
                break;
            case "delete":
                // Tình huống form xóa gửi bằng GET
                try {
                    String idParam = request.getParameter("id");
                    if (idParam == null) idParam = request.getParameter("roomID");
                    int id = Integer.parseInt(idParam);
                    dao.deleteRoom(id);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                response.sendRedirect(request.getContextPath() + "/admin/rooms");
                break;
            default:
                List<Room> roomList = dao.getAllRooms();
                request.setAttribute("roomList", roomList);
                
                int totalRooms = roomList.size();
                int availableRooms = 0;
                int bookedRooms = 0;
                int maintenanceRooms = 0;
                
                for (Room r : roomList) {
                    if ("Available".equalsIgnoreCase(r.getStatus())) {
                        availableRooms++;
                    } else if ("Occupied".equalsIgnoreCase(r.getStatus()) || "Booked".equalsIgnoreCase(r.getStatus())) {
                        bookedRooms++;
                    } else {
                        maintenanceRooms++;
                    }
                }
                
                request.setAttribute("totalRooms", totalRooms);
                request.setAttribute("availableRooms", availableRooms);
                request.setAttribute("bookedRooms", bookedRooms);
                request.setAttribute("maintenanceRooms", maintenanceRooms);

                request.getRequestDispatcher("/admin/admin_room_form.jsp").forward(request, response);
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
            // Trường hợp form xử lý xóa phòng (method=POST trong room-list.jsp)
            if ("delete".equals(action)) {
                String idParam = request.getParameter("id");
                if (idParam == null) idParam = request.getParameter("roomID");
                dao.deleteRoom(Integer.parseInt(idParam));
                response.sendRedirect(request.getContextPath() + "/admin/rooms");
                return;
            }

            // Lấy các tham số từ form nhập liệu
            String roomNumber = request.getParameter("roomNumber");
            double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");
            String description = request.getParameter("description");
            String image = request.getParameter("image");

            // Chuyển loại phòng từ Text sang ID
            String roomType = request.getParameter("roomType");
            int typeID = 1; // Mặc định
            if ("Double".equals(roomType) || "Superior".equals(roomType)) {
                typeID = 2;
            } else if ("VIP".equals(roomType) || "Deluxe".equals(roomType)) {
                typeID = 3;
            } else if ("Suite".equals(roomType)) {
                typeID = 4;
            }

            // Xử lý THÊM MỚI (form ở room-form.jsp dùng action="insert")
            if ("insert".equals(action) || "add".equals(action)) {
                Room newRoom = new Room(0, roomNumber, typeID, roomType, price, status, description, image);
                dao.addRoom(newRoom);
            } 
            // Xử lý CẬP NHẬT
            else if ("update".equals(action)) {
                String idParam = request.getParameter("id");
                if (idParam == null) idParam = request.getParameter("roomID");
                int roomID = Integer.parseInt(idParam);
                Room room = new Room(roomID, roomNumber, typeID, roomType, price, status, description, image);
                dao.updateRoom(room);
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Dữ liệu nhập vào không hợp lệ (lỗi định dạng số)!");
            System.out.println("Lỗi parse số: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Đã xảy ra lỗi hệ thống khi xử lý!");
        }

        // Hoàn tất thì load lại danh sách
        response.sendRedirect(request.getContextPath() + "/admin/rooms");
    }
}
