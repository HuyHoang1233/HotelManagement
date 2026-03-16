<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctx = request.getContextPath();%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi Tiết Phòng ${room.roomNumber} - Hotel Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="<%=ctx%>/assets/css/style.css">
        <style>
            .room-img {
                max-height: 450px;
                object-fit: cover;
                width: 100%;
                border-radius: 12px;
            }
            .price-tag {
                color: #dc3545;
                font-size: 2.5rem;
                font-weight: bold;
                margin-bottom: 0;
            }
        </style>
    </head>
    <body class="bg-light">
        <jsp:include page="includes/header.jsp" />

        <div class="container my-5">
            <div class="detail-container bg-white p-4 p-md-5 rounded-4 shadow-sm">

                <c:if test="${empty room}">
                    <div class="alert alert-danger text-center fs-4">Phòng không tồn tại hoặc đã bị vô hiệu hóa!</div>
                    <div class="text-center">
                        <button onclick="history.back()" class="btn btn-primary mt-3">Quay lại</button>
                    </div>
                </c:if>

                <c:if test="${not empty room}">
                    <div class="row g-5">
                        <div class="col-lg-7">
                            <div class="room-images">
                                <img src="${not empty room.image ? room.image : 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop'}" 
                                     alt="Phòng ${room.roomNumber}" class="room-img shadow-sm">
                            </div>
                        </div>

                        <div class="col-lg-5 d-flex flex-column">
                            <div class="room-info">
                                <span class="badge bg-primary fs-6 mb-3">${room.typeName}</span>
                                <h1 class="fw-bold text-dark mb-2">Phòng ${room.roomNumber}</h1>

                                <div class="rating mb-4 text-warning fs-5">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i> 
                                    <span class="text-muted fs-6 ms-2">(12 đánh giá)</span>
                                </div>

                                <p class="text-secondary fs-5 mb-4">${room.description}</p>

                                <h5 class="fw-bold text-dark mb-3">Tiện nghi nổi bật:</h5>
                                <ul class="amenities text-muted fs-5 mb-4 list-unstyled">
                                    <li class="mb-2"><i class="fas fa-wifi text-primary me-2"></i> WiFi tốc độ cao</li>
                                    <li class="mb-2"><i class="fas fa-snowflake text-primary me-2"></i> Điều hòa 2 chiều</li>
                                    <li class="mb-2"><i class="fas fa-tv text-primary me-2"></i> Smart TV 55 inch</li>
                                </ul>

                                <hr class="my-4">

                                <div class="mt-auto">
                                    <p class="price-tag">
                                    <fmt:formatNumber value="${room.price}" type="number" pattern="#,##0"/> đ <span class="fs-5 text-muted fw-normal">/ đêm</span>
                                    </p>

                                    <div class="d-grid mt-4">
                                        <a href="<%=ctx%>/booking?roomId=${room.roomID}" class="btn btn-primary btn-lg fw-bold py-3 shadow-sm">
                                            Tiến Hành Đặt Phòng
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="reviews mt-5 pt-4 border-top">
                        <h3 class="fw-bold mb-4">Đánh giá & Bình luận</h3>
                        <div class="alert alert-secondary text-center py-4">
                            <i class="fas fa-comments fs-2 text-muted mb-2"></i>
                            <p class="mb-0 text-muted">Hệ thống đánh giá đang được bảo trì. Vui lòng quay lại sau!</p>
                        </div>
                    </div>
                </c:if>

            </div>
        </div>

        <jsp:include page="includes/footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>