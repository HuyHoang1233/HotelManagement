<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctx = request.getContextPath();%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi Tiết Phòng ${room.roomNumber} - DANA Hotel</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                background-color: #f4f6f9;
            }
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
            .review-item {
                border-bottom: 1px solid #eee;
                padding-bottom: 1.5rem;
                margin-bottom: 1.5rem;
            }
            .review-item:last-child {
                border-bottom: none;
            }
            .avatar-circle {
                width: 45px;
                height: 45px;
                background: #007bff;
                color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="includes/header.jsp" />

        <div class="container my-5">
            <div class="detail-container bg-white p-4 p-md-5 rounded-4 shadow-sm">

                <c:if test="${empty room}">
                    <div class="alert alert-danger text-center fs-4">Phòng không tồn tại hoặc đã bị vô hiệu hóa!</div>
                    <div class="text-center">
                        <button onclick="location.href = '<%=ctx%>/search'" class="btn btn-primary mt-3">Quay lại tìm kiếm</button>
                    </div>
                </c:if>

                <c:if test="${not empty room}">
                    <div class="row g-5">
                        <div class="col-lg-7">
                            <img src="${not empty room.image ? room.image : 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop'}" 
                                 alt="Phòng ${room.roomNumber}" class="room-img shadow-sm">
                        </div>

                        <div class="col-lg-5 d-flex flex-column">
                            <div class="room-info">
                                <span class="badge bg-primary fs-6 mb-3">${room.typeName}</span>
                                <h1 class="fw-bold text-dark mb-2">Phòng ${room.roomNumber}</h1>

                                <div class="rating mb-4 text-warning fs-5">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i> 
                                    <span class="text-muted fs-6 ms-2">(${not empty reviews ? reviews.size() : '0'} đánh giá)</span>
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

                                    <div class="d-grid gap-2 mt-4">
                                        <a href="<%=ctx%>/booking?roomId=${room.roomID}" class="btn btn-primary btn-lg fw-bold py-3 shadow-sm">Tiến Hành Đặt Phòng</a>
                                        <a href="<%=ctx%>/wishlist?action=toggle&roomId=${room.roomID}" class="btn btn-outline-danger fw-bold"><i class="far fa-heart me-2"></i>Lưu Yêu Thích</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="reviews mt-5 pt-5 border-top">
                        <h3 class="fw-bold mb-4">Đánh giá từ khách hàng</h3>

                        <c:if test="${not empty sessionScope.account}">
                            <div class="card border-0 bg-light p-4 rounded-4 mb-5">
                                <h5 class="fw-bold mb-3">Để lại bình luận của bạn</h5>
                                <form action="<%=ctx%>/review" method="post">
                                    <input type="hidden" name="roomId" value="${room.roomID}">
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <label class="form-label small fw-bold">Số sao đánh giá:</label>
                                            <select name="rating" class="form-select">
                                                <option value="5">⭐⭐⭐⭐⭐ Tuyệt vời</option>
                                                <option value="4">⭐⭐⭐⭐ Rất tốt</option>
                                                <option value="3">⭐⭐⭐ Bình thường</option>
                                                <option value="2">⭐⭐ Tệ</option>
                                                <option value="1">⭐ Rất tệ</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <textarea name="comment" class="form-control" rows="3" placeholder="Phòng sạch sẽ, phục vụ tốt..." required></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-dark px-4 fw-bold">Gửi đánh giá</button>
                                </form>
                            </div>
                        </c:if>

                        <c:if test="${empty sessionScope.account}">
                            <div class="alert alert-info rounded-4">Vui lòng <a href="<%=ctx%>/login.jsp" class="fw-bold">đăng nhập</a> để gửi đánh giá cho phòng này.</div>
                        </c:if>

                        <div class="review-list">
                            <c:if test="${empty reviews}">
                                <div class="text-center py-4">
                                    <p class="text-muted italic">Chưa có bình luận nào. Hãy là người đầu tiên đánh giá!</p>
                                </div>
                            </c:if>

                            <c:forEach var="rev" items="${reviews}">
                                <div class="review-item d-flex">
                                    <div class="flex-shrink-0">
                                        <div class="avatar-circle">${rev.userName.substring(0,1).toUpperCase()}</div>
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0">${rev.userName}</h6>
                                            <small class="text-muted"><fmt:formatDate value="${rev.reviewDate}" pattern="dd/MM/yyyy"/></small>
                                        </div>
                                        <div class="text-warning mb-2 small">
                                            <c:forEach begin="1" end="${rev.rating}"><i class="fas fa-star"></i></c:forEach>
                                        </div>
                                        <p class="text-secondary mb-0">${rev.comment}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>

        <jsp:include page="includes/footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>