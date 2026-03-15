<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<title>Liên hệ</title>

<style>

body{
margin:0;
font-family:"Segoe UI",Arial;
background:#f4f6f9;
}

.banner{
height:300px;
background:url("https://images.unsplash.com/photo-1551882547-ff40c63fe5fa") center/cover;
display:flex;
align-items:center;
justify-content:center;
color:white;
font-size:36px;
font-weight:600;
}

.container{
width:1100px;
margin:50px auto;
display:grid;
grid-template-columns:1fr 1fr;
gap:40px;
}

.card{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

input,textarea{
width:100%;
padding:10px;
margin-bottom:15px;
border:1px solid #ccc;
border-radius:6px;
}

button{
background:#1e73e8;
color:white;
border:none;
padding:12px 20px;
border-radius:6px;
cursor:pointer;
}

</style>

</head>

<body>

<div class="banner">
Liên hệ với chúng tôi
</div>

<div class="container">

<div class="card">

<h2>Thông tin liên hệ</h2>

<p><b>Địa chỉ:</b>  Ngũ Hành Sơn, Đà Nẵng</p>
<p><b>Điện thoại:</b> +84 83 273 6689</p>
<p><b>Email:</b> info@marriott.com</p>

</div>

<div class="card">

<h2>Gửi tin nhắn</h2>

<form>

<input type="text" placeholder="Tên của bạn">

<input type="email" placeholder="Email">

<textarea rows="5" placeholder="Nội dung"></textarea>

<button>Gửi</button>

</form>

</div>

</div>

</body>
</html>
