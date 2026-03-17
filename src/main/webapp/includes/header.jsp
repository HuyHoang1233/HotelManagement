<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctx = request.getContextPath();%>

<nav class="navbar navbar-expand-lg shadow-sm" style="background-color: #0d6efd;">
    <div class="container">

        <a class="navbar-brand d-flex align-items-center text-decoration-none" href="<%=ctx%>/home" style="gap: 10px;">
            <div class="bg-white rounded p-1" style="height: 50px; width: 50px; display: flex; align-items: center; justify-content: center;">
                <img src="<%=ctx%>/assets/img/logo.png" alt="Logo" style="height: 40px; width: auto; object-fit: contain;">
            </div>
            <span style="color: white; font-weight: 800; font-size: 22px; letter-spacing: 1px; text-transform: uppercase;">
                DANA HOTEL
            </span>
        </a>

        <button class="navbar-toggler text-white border-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 fw-semibold">
                <li class="nav-item"><a class="nav-link text-white px-3" href="<%=ctx%>/restaurant.jsp">Nhà hàng</a></li>
                <li class="nav-item"><a class="nav-link text-white px-3" href="<%=ctx%>/search">Lưu trú</a></li>
                <li class="nav-item"><a class="nav-link text-white px-3" href="<%=ctx%>/meeting.jsp">Hội nghị</a></li>
                <li class="nav-item"><a class="nav-link text-white px-3" href="<%=ctx%>/services.jsp">Dịch vụ</a></li>
                <li class="nav-item"><a class="nav-link text-white px-3" href="<%=ctx%>/promotion.jsp">Khuyến mãi</a></li>
                <li class="nav-item"><a class="nav-link text-white px-3" href="<%=ctx%>/contact.jsp">Liên hệ</a></li>
            </ul>

            <div class="d-flex align-items-center gap-2">
                <c:choose>
                    <%-- NẾU ĐÃ ĐĂNG NHẬP --%>
                    <c:when test="${sessionScope.account != null}">
                        <div class="dropdown me-2">
                            <a class="text-white fw-bold text-decoration-none dropdown-toggle d-flex align-items-center" href="#" role="button" id="userMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="bg-light text-primary rounded-circle d-flex align-items-center justify-content-center fw-bold me-2" style="width: 32px; height: 32px;">
                                    ${sessionScope.account.fullName != null ? sessionScope.account.fullName.substring(0,1).toUpperCase() : sessionScope.account.username.substring(0,1).toUpperCase()}
                                </div>
                                ${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.username}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="userMenuLink">
                                <li>
                                    <div class="dropdown-header text-center">
                                        <strong>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.username}</strong><br>
                                        <small class="text-muted">${sessionScope.account.email}</small><br>
                                        <c:choose>
                                            <c:when test="${sessionScope.account.roleID == 1}">
                                                <span class="badge bg-danger mt-1">Admin</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary mt-1">Khách hàng</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<%=ctx%>/history"><i class="fas fa-user-circle me-2 text-primary"></i> Thông tin tài khoản</a></li>
                                <li><a class="dropdown-item" href="<%=ctx%>/history#bookingHistory"><i class="fas fa-history me-2 text-success"></i> Lịch sử đặt phòng</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="<%=ctx%>/logout"><i class="fas fa-sign-out-alt me-2"></i> Đăng xuất</a></li>
                            </ul>
                        </div>
                        <a href="<%=ctx%>/wishlist" class="nav-link text-white position-relative me-3" title="Danh sách yêu thích">
                            <i class="fas fa-heart fs-4"></i>
                            <%-- Nếu muốn hiện số lượng phòng đã lưu, bạn có thể truyền biến wishlistSize từ Servlet --%>
                            <c:if test="${not empty wishlistSize && wishlistSize > 0}">
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.6rem;">
                                    ${wishlistSize}
                                </span>
                            </c:if>
                        </a>

                        <span class="text-white fw-bold me-3">Hi, ${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.username}</span>

                        <%-- HIỆN NÚT QUẢN TRỊ NẾU LÀ ADMIN (roleID = 1) --%>
                        <c:if test="${sessionScope.account.roleID == 1}">
                            <a href="<%=ctx%>/admin/admin_dashboard.jsp" class="btn btn-warning btn-sm fw-bold">Quản Trị</a>
                        </c:if>
                    </c:when>

                    <%-- NẾU CHƯA ĐĂNG NHẬP --%>
                    <c:otherwise>
                        <a href="<%=ctx%>/login.jsp" class="btn btn-light btn-sm fw-bold text-primary">Đăng Nhập</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </div>
</nav>