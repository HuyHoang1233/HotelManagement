<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Phòng - Hotel Management</title>
    <style>
        body{font-family:Arial,sans-serif;background:#f5f5f5;}
        .container{max-width:800px;margin:20px auto;background:#fff;padding:20px;border-radius:8px;box-shadow:0 2px 4px rgba(0,0,0,.1);}
        .images {display: flex;overflow-x:auto;gap:10px;margin-bottom:20px;}
        .images img{height:200px;border-radius:4px;}
        .info h2{margin-bottom:10px;}
        .amenities {list-style:none;padding:0;}
        .amenities li{margin-bottom:5px;}
        .rating {color:#ffc107;margin-bottom:10px;}
        .reviews{margin-top:20px;}
    </style>
</head>
<body>
<div class="container">
    <c:if test="${empty room}">
        <p>Phòng không tồn tại.</p>
    </c:if>
    <c:if test="${not empty room}">
        <div class="images">
            <c:forEach var="img" items="${room.images}">
                <img src="${img}" alt="${room.name}">
            </c:forEach>
            <c:if test="${empty room.images}">
                <img src="https://via.placeholder.com/400x200?text=${room.name}" alt="${room.name}">
            </c:if>
        </div>
        <div class="info">
            <h2>${room.name}</h2>
            <p>${room.description}</p>
            <div class="rating">⭐ ${room.rating} (${room.reviews} đánh giá)</div>
            <ul class="amenities">
                <c:forEach var="amen" items="${room.amenities}">
                    <li>• ${amen}</li>
                </c:forEach>
            </ul>
            <p class="price">Giá: $${room.price}/đêm</p>
            <a href="booking?roomId=${room.id}" class="btn btn-primary">Đặt Phòng</a>
        </div>
        <div class="reviews">
            <h3>Đánh giá &amp; Bình luận</h3>
            <c:forEach var="rev" items="${room.reviewList}">
                <div class="review">
                    <strong>${rev.author}</strong> - ⭐ ${rev.rating}<br>
                    <p>${rev.comment}</p>
                </div>
                <hr>
            </c:forEach>
            <c:if test="${empty room.reviewList}">
                <p>Chưa có đánh giá.</p>
            </c:if>
        </div>
    </c:if>
</div>
</body>
</html>