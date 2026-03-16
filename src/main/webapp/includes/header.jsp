<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctx = request.getContextPath();%>

<nav class="navbar navbar-expand-lg shadow-sm" style="background-color: #0d6efd;">
    <div class="container">

        <a class="navbar-brand d-flex align-items-center text-decoration-none" href="<%=ctx%>/home" style="gap: 10px;">
            <div class="bg-white rounded p-1" style="height: 50px; width: 50px; display: flex; align-items: center; justify-content: center;">
                <img src="<%=ctx%>/assets/img/logo.png" alt="Logo" style="height: 40px; width: auto; object-fit: contain;">
            </div>
            <span style="color: black; font-weight: 800; font-size: 22px; letter-spacing: 1px; text-transform: uppercase;">
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

                        <a href="<%=ctx%>/logout" class="btn btn-danger btn-sm fw-bold">Đăng Xuất</a>
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