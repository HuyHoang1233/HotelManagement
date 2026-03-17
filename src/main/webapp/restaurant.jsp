<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath();
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Restaurant - Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="<%=ctx%>/assets/css/style.css"/>

<style>

/* banner */

.restaurant-banner{
height:420px;
background:url("https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c") center/cover;
position:relative;
display:flex;
align-items:center;
justify-content:center;
}

.restaurant-banner::after{
content:"";
position:absolute;
top:0;
left:0;
width:100%;
height:100%;
background:rgba(0,0,0,0.45);
}

.banner-content{
position:relative;
color:white;
text-align:center;
}

.banner-content h1{
font-size:48px;
font-weight:600;
}

.banner-content p{
font-size:18px;
}

/* section */

.section{
padding:70px 0;
}

.section-title{
font-size:32px;
font-weight:600;
margin-bottom:30px;
}

/* food card */

.food-card{
border:none;
border-radius:12px;
overflow:hidden;
box-shadow:0 5px 15px rgba(0,0,0,0.15);
transition:0.3s;
}

.food-card:hover{
transform:translateY(-8px);
}

.food-card img{
height:230px;
object-fit:cover;
}
.food-card img{
height:200px;
object-fit:cover;
}

.food-card{
border-radius:12px;
overflow:hidden;
box-shadow:0 8px 20px rgba(0,0,0,0.15);
}

/* gallery */

.gallery img{
width:100%;
height:250px;
object-fit:cover;
border-radius:10px;
}

</style>

</head>

<body>

<jsp:include page="/includes/header.jsp"/>

<!-- banner -->

<div class="restaurant-banner">

<div class="banner-content">
<h1>Restaurant</h1>
<p>Fine dining experience at our luxury hotel</p>
</div>

</div>

<!-- intro -->

<section class="section">

<div class="container">

<div class="row align-items-center">

<div class="col-md-6">

<h2 class="section-title">Ẩm thực đẳng cấp</h2>

<p>
Nhà hàng của chúng tôi mang đến trải nghiệm ẩm thực tinh tế với
các món ăn được chế biến bởi đầu bếp chuyên nghiệp.
</p>

<p>
Không gian sang trọng, ấm cúng cùng thực đơn đa dạng từ
ẩm thực quốc tế đến đặc sản địa phương.
</p>

</div>

<div class="col-md-6">

<img class="img-fluid rounded"
src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5">

</div>

</div>

</div>

</section>

<!-- menu -->

<section class="section bg-light">

<div class="container">

<h2 class="text-center section-title">Món ăn nổi bật</h2>

<div class="row g-4 justify-content-center">

<!-- Beef Steak -->

<div class="col-md-4">

<div class="card food-card">

<img src="https://images.unsplash.com/photo-1544025162-d76694265947" class="card-img-top">

<div class="card-body">
<h5>Beef Steak</h5>
<p>Bít tết bò cao cấp với sốt đặc biệt.</p>
</div>

</div>

</div>

<!-- Seafood -->

<div class="col-md-4">

<div class="card food-card">

<img src="https://images.unsplash.com/photo-1555939594-58d7cb561ad1" class="card-img-top">

<div class="card-body">
<h5>Seafood</h5>
<p>Hải sản tươi sống được chế biến tinh tế.</p>
</div>

</div>

</div>

<!-- Signature -->

<div class="col-md-4">

<div class="card food-card">

<img src="https://images.unsplash.com/photo-1600891964599-f61ba0e24092" class="card-img-top">

<div class="card-body">
<h5>Signature Dish</h5>
<p>Món ăn đặc trưng của nhà hàng.</p>
</div>

</div>

</div>

</div>

</div>

</section>

<!-- gallery -->

<section class="section">

<div class="container">

<h2 class="text-center section-title">Không gian nhà hàng</h2>

<div class="row g-4 gallery">

<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4">
</div>

<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1466978913421-dad2ebd01d17">
</div>

<div class="col-md-4">
<img src="https://images.unsplash.com/photo-1552566626-52f8b828add9">
</div>

</div>

</div>

</section>

<jsp:include page="/includes/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
