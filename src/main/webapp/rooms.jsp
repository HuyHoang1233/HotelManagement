<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phòng khách sạn</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

body{
background:#f5f5f5;
}

/* banner */

.room-banner{
height:380px;
background:url("https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=1400") center/cover;
display:flex;
align-items:center;
justify-content:center;
color:white;
font-size:46px;
font-weight:600;
position:relative;
}

.room-banner::after{
content:"";
position:absolute;
width:100%;
height:100%;
background:rgba(0,0,0,0.25);
}

.room-banner h1{
position:relative;
color:white;
text-shadow:0 4px 12px rgba(0,0,0,0.6);
}
/* section */

.rooms{
padding:70px 0;
}

/* card */

.room-card{
background:white;
border-radius:12px;
overflow:hidden;
box-shadow:0 8px 20px rgba(0,0,0,0.1);
transition:0.3s;
}

.room-card:hover{
transform:translateY(-8px);
}

.room-card img{
width:100%;
height:220px;
object-fit:cover;
}

.room-body{
padding:20px;
}

.room-title{
font-size:20px;
font-weight:600;
}

.room-price{
color:#d4af37;
font-size:20px;
font-weight:600;
}

.btn-book{
background:#c62828;
color:white;
padding:8px 20px;
border-radius:25px;
text-decoration:none;
font-size:14px;
}

.btn-book:hover{
background:#a61d1d;
color:white;
}

</style>

</head>

<body>

<!-- HEADER -->
<jsp:include page="/includes/header.jsp"/>

<!-- Banner -->

<div class="room-banner">
<h1>Phòng khách sạn</h1>
</div>

<!-- Rooms -->

<section class="rooms">

<div class="container">


<div class="row g-4">

<!-- Room 101 -->

<div class="col-md-4">
<div class="room-card">
<img src="https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&h=400&fit=crop">
<div class="room-body">
<div class="room-title">Phòng Deluxe - 101</div>
<p>Phòng đơn tiện nghi cho 2 người.</p>
<div class="d-flex justify-content-between align-items-center">
<div class="room-price">500.000đ / đêm</div>
<a href="#" class="btn-book">Đặt ngay</a>
</div>
</div>
</div>
</div>

<!-- Room 102 -->

<div class="col-md-4">
<div class="room-card">
<img src="https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&h=400&fit=crop">
<div class="room-body">
<div class="room-title">Phòng Deluxe - 102</div>
<p>Phòng đơn view đẹp.</p>
<div class="d-flex justify-content-between align-items-center">
<div class="room-price">800.000đ / đêm</div>
<a href="#" class="btn-book">Đặt ngay</a>
</div>
</div>
</div>
</div>

<!-- Room 201 -->

<div class="col-md-4">
<div class="room-card">
<img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b">
<div class="room-body">
<div class="room-title">Suite - 201</div>
<p>Phòng suite rộng rãi.</p>
<div class="d-flex justify-content-between align-items-center">
<div class="room-price">1.500.000đ / đêm</div>
<a href="#" class="btn-book">Đặt ngay</a>
</div>
</div>
</div>
</div>

<!-- Room 202 -->

<div class="col-md-4">
<div class="room-card">
<img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=600&h=400&fit=crop">
<div class="room-body">
<div class="room-title">Suite - 202</div>
<p>Phòng suite cao cấp.</p>
<div class="d-flex justify-content-between align-items-center">
<div class="room-price">2.000.000đ / đêm</div>
<a href="#" class="btn-book">Đặt ngay</a>
</div>
</div>
</div>
</div>

<!-- Room 301 -->

<div class="col-md-4">
<div class="room-card">
<img src="https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600&h=400&fit=crop">
<div class="room-body">
<div class="room-title">Luxury Suite - 301</div>
<p>Phòng hạng sang.</p>
<div class="d-flex justify-content-between align-items-center">
<div class="room-price">3.500.000đ / đêm</div>
<a href="#" class="btn-book">Đặt ngay</a>
</div>
</div>
</div>
</div>

<!-- Room 302 -->

<div class="col-md-4">
<div class="room-card">
<img src="https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=600&h=400&fit=crop">
<div class="room-body">
<div class="room-title">Luxury Suite - 302</div>
<p>Phòng suite sang trọng.</p>
<div class="d-flex justify-content-between align-items-center">
<div class="room-price">5.000.000đ / đêm</div>
<a href="#" class="btn-book">Đặt ngay</a>
</div>
</div>
</div>
</div>

</div>

</div>

</section>

<!-- FOOTER -->
<jsp:include page="/includes/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>