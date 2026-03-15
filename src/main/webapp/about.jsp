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
    <title>Hotel</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%=ctx%>/assets/css/style.css">

    <link rel="stylesheet" href="<%=ctx%>/assets/css/about.css">

</head>

<body>

<jsp:include page="/includes/header.jsp" />

<!-- HERO -->
<section class="about-hero">

    <img src="<%=ctx%>/assets/img/banner.jpg" class="about-hero-img">

    <div class="about-hero-overlay">
        <div class="container">
            <h1>Hotel</h1>
            <p>Không gian nghỉ dưỡng hiện đại - dịch vụ tận tâm - trải nghiệm đáng nhớ</p>
        </div>
    </div>

</section>


<!-- INTRO -->
<section class="about-section">

<div class="container about-intro">

<h2 class="about-title">Về chúng tôi</h2>

<p>
Hotel là điểm đến lý tưởng dành cho du khách đang tìm kiếm một không gian nghỉ dưỡng hiện đại,
tiện nghi và thoải mái. Chúng tôi mang đến trải nghiệm lưu trú chất lượng với hệ thống phòng nghỉ,
nhà hàng, hồ bơi, spa và nhiều tiện ích cao cấp khác.
</p>

<p>
Với đội ngũ nhân viên chuyên nghiệp và tận tâm, Hotel luôn mong muốn mang lại sự hài lòng tối đa
cho từng khách hàng.
</p>

</div>
</section>


<!-- STORY -->
<section class="about-section about-light">

<div class="container">

<h2 class="about-title center">Không gian đẳng cấp</h2>

<div class="about-grid-3">

<div class="about-card">
<h3>Triết lý dịch vụ</h3>
<p>Chúng tôi luôn đặt trải nghiệm khách hàng lên hàng đầu.</p>
</div>

<div class="about-card">
<h3>Không gian nghỉ dưỡng</h3>
<p>Thiết kế hiện đại, sang trọng và tiện nghi.</p>
</div>

<div class="about-card">
<h3>Trải nghiệm trọn vẹn</h3>
<p>Từ phòng nghỉ đến tiện ích đều được chăm chút.</p>
</div>

</div>

</div>
</section>


<!-- FEATURE -->
<section class="about-section">

<div class="container">

<h2 class="about-title center">Điểm nổi bật</h2>

<div class="about-grid-2">

<div class="about-feature">
<div class="num">01</div>
<div>
<h3>Vị trí thuận lợi</h3>
<p>Dễ dàng di chuyển đến các điểm tham quan.</p>
</div>
</div>

<div class="about-feature">
<div class="num">02</div>
<div>
<h3>Phòng nghỉ hiện đại</h3>
<p>Thiết kế sang trọng, tiện nghi đầy đủ.</p>
</div>
</div>

<div class="about-feature">
<div class="num">03</div>
<div>
<h3>Dịch vụ tận tâm</h3>
<p>Nhân viên chuyên nghiệp và thân thiện.</p>
</div>
</div>

<div class="about-feature">
<div class="num">04</div>
<div>
<h3>Tiện ích đa dạng</h3>
<p>Nhà hàng, hồ bơi, spa, gym...</p>
</div>
</div>

</div>

</div>
</section>


<!-- STATS -->
<section class="about-section about-light">

<div class="container">

<h2 class="about-title center">Những con số ấn tượng</h2>

<div class="stats-grid">

<div class="stat-box">
<h3>100+</h3>
<p>Phòng nghỉ</p>
</div>

<div class="stat-box">
<h3>5000+</h3>
<p>Khách hài lòng</p>
</div>

<div class="stat-box">
<h3>10+</h3>
<p>Năm kinh nghiệm</p>
</div>

<div class="stat-box">
<h3>24/7</h3>
<p>Hỗ trợ khách hàng</p>
</div>

</div>

</div>
</section>


<jsp:include page="/includes/footer.jsp" />

</body>
</html>