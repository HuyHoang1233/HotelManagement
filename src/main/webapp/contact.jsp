<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%=ctx%>/assets/css/style.css">
    <link rel="stylesheet" href="<%=ctx%>/assets/css/contact.css">
</head>
<body>

    <jsp:include page="/includes/header.jsp" />

    <!-- HERO -->
    <section class="contact-hero">
        <img src="<%=ctx%>/assets/img/banner.jpg" alt="Liên hệ" class="contact-hero-img">
        <div class="contact-hero-overlay">
            <div class="container">
                <h1>Liên hệ</h1>
                <p>Kết nối với chúng tôi để được hỗ trợ nhanh chóng và tận tâm</p>
            </div>
        </div>
    </section>

    <!-- CONTACT CONTENT -->
    <section class="contact-section">
        <div class="container">
            <div class="contact-grid">

                <!-- CỘT TRÁI -->
                <div class="contact-info-box">
                    <h2>THÔNG TIN LIÊN HỆ</h2>

                    <div class="contact-info-list">
                        <p><strong>DaNa Hotel</strong></p>
                        <p>Ngũ Hành Sơn - Đà Nẵng</p>
                        <p>Điện thoại: 0123 456 789</p>
                        <p>Email: info@abcd.com</p>
                    </div>
                </div>

                <!-- CỘT PHẢI -->
                <div class="contact-map-box">
                    <iframe
                        src="https://www.google.com/maps?q=Ng%C5%A9%20H%C3%A0nh%20S%C6%A1n%2C%20%C4%90%C3%A0%20N%E1%BA%B5ng&z=14&output=embed"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>

            </div>
        </div>
    </section>

    <jsp:include page="/includes/footer.jsp" />

</body>
</html>