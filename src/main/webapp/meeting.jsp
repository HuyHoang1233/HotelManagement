<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath();
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Hội Nghị</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<link rel="stylesheet" href="<%=ctx%>/assets/css/style.css"/>

<style>

/* Banner */

.meeting-banner{
height:420px;
background:url("https://images.unsplash.com/photo-1517457373958-b7bdd4587205") center/cover;
display:flex;
align-items:center;
justify-content:center;
color:white;
font-size:48px;
font-weight:600;
position:relative;
}

.meeting-banner::after{
content:"";
position:absolute;
width:100%;
height:100%;
background:rgba(0,0,0,0.5);
}

.meeting-banner h1{
position:relative;
}

/* Section */

.section{
padding:80px 0;
}

.gallery img{
width:100%;
height:250px;
object-fit:cover;
border-radius:10px;
}

/* Features */

.feature-box{
display:flex;
gap:15px;
margin-bottom:20px;
}

.feature-box i{
font-size:24px;
color:#d4af37;
}

</style>

</head>

<body>

<jsp:include page="/includes/header.jsp"/>

<!-- Banner -->

<div class="meeting-banner">
<h1>Hội Nghị & Sự Kiện</h1>
</div>

<!-- Intro -->

<section class="section">

<div class="container text-center">

<h2 class="mb-4">Không gian hội nghị chuyên nghiệp</h2>

<p class="text-muted">
Khách sạn cung cấp không gian hội nghị hiện đại với thiết kế sang trọng,
phù hợp cho các buổi họp, hội thảo và sự kiện doanh nghiệp.
</p>

</div>

</section>

<!-- Gallery -->

<section class="section bg-light">

<div class="container">

<h2 class="text-center mb-5">Không gian hội nghị</h2>

<div class="row g-4 gallery">

<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1511578314322-379afb476865">
</div>

<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1515187029135-18ee286d815b">
</div>

<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1503428593586-e225b39bddfe">
</div>

</div>

</div>

</section>

<!-- Facilities -->

<section class="section bg-light">

<div class="container text-center">

<h2 class="mb-5">Tiện ích hội nghị</h2>

<div class="row justify-content-center g-4">

<div class="col-md-3">

<div class="feature-box d-flex flex-column align-items-center">
<i class="fa fa-wifi"></i>
<h5 class="mt-3">Wifi tốc độ cao</h5>
<p>Kết nối internet ổn định cho hội nghị và hội thảo.</p>
</div>

</div>

<div class="col-md-3">

<div class="feature-box d-flex flex-column align-items-center">
<i class="fa fa-microphone"></i>
<h5 class="mt-3">Hệ thống âm thanh</h5>
<p>Âm thanh chuyên nghiệp cho sự kiện.</p>
</div>

</div>

<div class="col-md-3">

<div class="feature-box d-flex flex-column align-items-center">
<i class="fa fa-video"></i>
<h5 class="mt-3">Máy chiếu hiện đại</h5>
<p>Trang bị máy chiếu và màn hình lớn.</p>
</div>

</div>

<div class="col-md-3">

<div class="feature-box d-flex flex-column align-items-center">
<i class="fa fa-users"></i>
<h5 class="mt-3">Sức chứa lớn</h5>
<p>Không gian phù hợp cho nhiều quy mô sự kiện.</p>
</div>

</div>

</div>

</div>

</section>
<jsp:include page="/includes/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
