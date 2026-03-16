<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctx = request.getContextPath();%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt Phòng - Marriott Hotel</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="<%=ctx%>/assets/css/style.css">
    </head>
    <body class="bg-light">

        <jsp:include page="includes/header.jsp" />

        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="card shadow-lg border-0 rounded-4 p-4 p-md-5">

                        <h2 class="fw-bold text-center mb-4 text-primary"><i class="fas fa-calendar-check me-2"></i>Xác Nhận Đặt Phòng</h2>

                        <c:if test="${not empty message}">
                            <div class="alert alert-success fs-5 text-center fw-bold py-3"><i class="fas fa-check-circle me-2"></i>${message}</div>
                            <div class="text-center mt-3"><a href="<%=ctx%>/home" class="btn btn-outline-primary fw-bold px-4">Về Trang Chủ</a></div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger fs-5 text-center fw-bold"><i class="fas fa-times-circle me-2"></i>${error}</div>
                        </c:if>

                        <c:if test="${empty message}">

                            <c:if test="${not empty room}">
                                <div class="alert alert-info text-center fs-5 mb-4">
                                    Phòng: <strong>${room.roomNumber}</strong> | 
                                    Loại: <strong>${room.typeName}</strong> | 
                                    Giá: <strong class="text-danger"><fmt:formatNumber value="${room.price}" type="number" pattern="#,##0"/> đ</strong> / đêm
                                </div>
                            </c:if>

                            <form action="<%=ctx%>/booking" method="post">
                                <input type="hidden" name="roomId" value="${room.roomID}">

                                <div class="form-floating mb-3">
                                    <input type="text" id="fullname" class="form-control bg-light" value="${sessionScope.account.fullName}" placeholder="Họ và tên" readonly>
                                    <label for="fullname">Họ và tên người đặt</label>
                                </div>

                                <div class="form-floating mb-4">
                                    <input type="email" id="email" class="form-control bg-light" value="${sessionScope.account.email}" placeholder="Email" readonly>
                                    <label for="email">Email liên hệ (Để nhận thông báo)</label>
                                </div>

                                <h5 class="fw-bold mb-3 text-secondary">Thông tin lưu trú:</h5>
                                <div class="row g-3 mb-4">
                                    <div class="col-md-6">
                                        <div class="form-floating border-primary">
                                            <input type="date" id="checkin" name="checkin" class="form-control border-primary" placeholder="Ngày nhận phòng" required>
                                            <label for="checkin" class="text-primary fw-bold">Ngày nhận phòng</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating border-danger">
                                            <input type="date" id="checkout" name="checkout" class="form-control border-danger" placeholder="Ngày trả phòng" required>
                                            <label for="checkout" class="text-danger fw-bold">Ngày trả phòng</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-grid gap-2 mt-4">
                                    <button type="submit" class="btn btn-primary btn-lg fw-bold py-3 shadow-sm">Tiến Hành Thanh Toán</button>
                                    <button type="button" onclick="history.back()" class="btn btn-outline-secondary fw-bold py-2 mt-2">Hủy, Quay lại</button>
                                </div>
                            </form>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="includes/footer.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            let today = new Date().toISOString().split('T')[0];
                                            document.getElementById('checkin').setAttribute('min', today);

                                            document.getElementById('checkin').addEventListener('change', function () {
                                                document.getElementById('checkout').setAttribute('min', this.value);
                                            });
                                        });
        </script>
    </body>
</html>