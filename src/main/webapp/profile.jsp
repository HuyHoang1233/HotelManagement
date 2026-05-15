<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <% String ctx=request.getContextPath();%>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Tài khoản của tôi - Marriott Hotel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <style>
                        body {
                            background: #f4f6f9;
                            font-family: "Segoe UI", Arial;
                        }

                        .container {
                            max-width: 1100px;
                            margin: 40px auto;
                        }

                        /* Profile Card */
                        .profile-card {
                            background: white;
                            border-radius: 12px;
                            padding: 30px;
                            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
                            margin-bottom: 30px;
                        }

                        .avatar-section {
                            width: 100px;
                            height: 100px;
                            border-radius: 50%;
                            background: #0d6efd;
                            color: white;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 40px;
                            font-weight: bold;
                            margin-right: 25px;
                        }

                        /* Table Styles */
                        .card {
                            border-radius: 12px;
                            border: none;
                            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
                            padding: 20px;
                        }

                        th {
                            background: #1f2937 !important;
                            color: white !important;
                        }

                        .status {
                            padding: 5px 12px;
                            border-radius: 20px;
                            font-size: 13px;
                            font-weight: 600;
                        }

                        .pending {
                            background: #fff3cd;
                            color: #856404;
                        }

                        .confirmed {
                            background: #d4edda;
                            color: #155724;
                        }

                        .cancelled {
                            background: #f8d7da;
                            color: #721c24;
                        }
                    </style>
                </head>

                <body>
                    <jsp:include page="includes/header.jsp" />

                    <div class="container">
                        <c:if test="${param.message == 'update_success'}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Cập nhật thông tin cá nhân thành công!
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${param.error == 'update_failed'}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Cập nhật thông tin thất bại. Vui lòng thử lại!
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${param.error == 'invalid_phone'}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                Số điện thoại không hợp lệ (Phải có 10 chữ số và bắt đầu bằng số 0)!
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>

                        <div class="profile-card">
                            <div class="row align-items-center">
                                <div class="col-md-auto">
                                    <div class="avatar-section shadow-sm">
                                        ${not empty sessionScope.account.fullName ?
                                        sessionScope.account.fullName.substring(0, 1).toUpperCase() : 'U'}
                                    </div>
                                </div>
                                <div class="col">
                                    <h2 class="fw-bold mb-2">${sessionScope.account.fullName}</h2>
                                    <div class="d-flex flex-wrap gap-4 text-muted">
                                        <span class="mb-0"><i
                                                class="fas fa-envelope me-2"></i>${sessionScope.account.email}</span>
                                        <span class="mb-0"><i class="fas fa-phone me-2"></i>${not empty
                                            sessionScope.account.phone ? sessionScope.account.phone : 'Chưa cập nhật số
                                            điện thoại'}</span>
                                    </div>
                                </div>
                                <div class="col-md-auto text-end">
                                    <button class="btn btn-outline-primary fw-bold" data-bs-toggle="modal"
                                        data-bs-target="#editProfileModal">
                                        <i class="fas fa-user-edit me-2"></i>Chỉnh sửa hồ sơ
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="card bg-white">
                            <h4 class="fw-bold mb-4"><i class="fas fa-history me-2 text-primary"></i>Lịch sử đặt phòng
                            </h4>
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead>
                                        <tr>
                                            <th>Phòng</th>
                                            <th>Loại</th>
                                            <th>Ngày nhận</th>
                                            <th>Ngày trả</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${not empty listBookings}">
                                                <c:forEach var="b" items="${listBookings}">
                                                    <tr>
                                                        <td class="fw-bold">P.${b.roomNumber}</td>
                                                        <td>${b.typeName}</td>
                                                        <td>${b.checkInDate}</td>
                                                        <td>${b.checkOutDate}</td>
                                                        <td class="text-danger fw-bold">
                                                            <fmt:formatNumber value="${b.totalPrice}" pattern="#,##0" />
                                                            đ
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${b.status=='Pending'}">
                                                                    <span class="status pending">Chờ xác nhận</span>
                                                                </c:when>
                                                                <c:when test="${b.status=='Confirmed'}">
                                                                    <span class="status confirmed">Thành công</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="status cancelled">${b.status}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="6" class="text-center py-5 text-muted">Bạn chưa có giao
                                                        dịch đặt phòng nào.</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="editProfileModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content border-0 shadow">
                                <div class="modal-header bg-primary text-white">
                                    <h5 class="modal-title fw-bold">Chỉnh sửa thông tin cá nhân</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <form action="<%=ctx%>/profile" method="post">
                                    <div class="modal-body p-4">
                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Họ và tên</label>
                                            <input type="text" name="fullName" class="form-control"
                                                value="${sessionScope.account.fullName}" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Số điện thoại</label>
                                            <input type="text" name="phone" class="form-control"
                                                value="${sessionScope.account.phone}" 
                                                pattern="^0[0-9]{9}$" 
                                                title="Số điện thoại phải bắt đầu bằng 0 và gồm 10 chữ số (Ví dụ: 0912345678)">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Email (Không thể thay đổi)</label>
                                            <input type="text" class="form-control bg-light"
                                                value="${sessionScope.account.email}" readonly>
                                        </div>
                                    </div>
                                    <div class="modal-footer bg-light">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Hủy</button>
                                        <button type="submit" class="btn btn-primary fw-bold px-4">Lưu thay đổi</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="includes/footer.jsp" />
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        // CHẶN NHẬP CHỮ TRỰC TIẾP TRÊN Ô SỐ ĐIỆN THOẠI (UX TỐT HƠN)
                        const phoneInput = document.querySelector('input[name="phone"]');
                        if(phoneInput) {
                            phoneInput.addEventListener('keypress', function(e) {
                                if (!/[0-9]/.test(e.key)) {
                                    e.preventDefault();
                                }
                            });
                        }
                    </script>
                </body>

                </html>