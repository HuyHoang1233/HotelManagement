<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctx = request.getContextPath();%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Phòng Yêu Thích - DANA Hotel</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                background-color: #f4f6f9;
            }
            .wishlist-card {
                border-radius: 15px;
                border: none;
                transition: transform 0.3s ease;
            }
            .wishlist-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
            }
            .btn-book {
                border-radius: 8px;
            }
        </style>
    </head>
    <body class="bg-light">
        <jsp:include page="includes/header.jsp" />

        <div class="container my-5" style="min-height: 70vh;">
            <div class="d-flex align-items-center mb-4">
                <h2 class="fw-bold mb-0 text-dark"><i class="fas fa-heart text-danger me-2"></i>Danh Sách Ưng Ý</h2>
                <span class="badge bg-secondary ms-3">${wishlist.size()} phòng</span>
            </div>

            <div class="row g-4">
                <c:if test="${empty wishlist}">
                    <div class="col-12 text-center py-5 bg-white rounded-4 shadow-sm">
                        <div class="mb-4">
                            <i class="far fa-heart fa-5x text-muted opacity-25"></i>
                        </div>
                        <h4 class="text-muted fw-bold">Chưa có phòng nào được lưu</h4>
                        <p class="text-secondary">Hãy quay lại danh sách phòng để chọn cho mình không gian ưng ý nhất nhé!</p>
                        <a href="<%=ctx%>/search" class="btn btn-primary mt-3 fw-bold px-5 py-2">Khám phá ngay</a>
                    </div>
                </c:if>

                <c:forEach var="room" items="${wishlist}">
                    <div class="col-lg-4 col-md-6">
                        <div class="card wishlist-card h-100 shadow-sm overflow-hidden">
                            <div class="position-relative">
                                <img src="${not empty room.image ? room.image : 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&h=400&fit=crop'}" 
                                     class="card-img-top" style="height: 220px; object-fit: cover;" alt="Room image">
                                <a href="<%=ctx%>/wishlist?action=toggle&roomId=${room.roomID}" 
                                   class="btn btn-danger btn-sm position-absolute top-0 end-0 m-3 shadow" 
                                   title="Bỏ khỏi danh sách">
                                    <i class="fas fa-times"></i>
                                </a>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <div class="mb-2">
                                    <span class="badge bg-info text-dark fw-normal">${room.typeName}</span>
                                </div>
                                <h5 class="card-title fw-bold mb-3">Phòng ${room.roomNumber}</h5>
                                <div class="mt-auto">
                                    <div class="d-flex justify-content-between align-items-end mb-3">
                                        <span class="text-muted small">Giá mỗi đêm:</span>
                                        <h4 class="text-danger fw-bold mb-0">
                                            <fmt:formatNumber value="${room.price}" pattern="#,##0"/> đ
                                        </h4>
                                    </div>
                                    <div class="d-grid gap-2">
                                        <a href="<%=ctx%>/booking?roomId=${room.roomID}" class="btn btn-primary btn-book fw-bold">Đặt Ngay</a>
                                        <a href="<%=ctx%>/detail?roomId=${room.roomID}" class="btn btn-outline-secondary btn-sm fw-bold border-0">Xem Chi Tiết</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <jsp:include page="includes/footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>