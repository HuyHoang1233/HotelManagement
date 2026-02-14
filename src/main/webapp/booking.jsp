<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt Phòng - Hotel Management</title>
    <style>
        body{font-family:Arial,sans-serif;background:#f5f5f5;}
        .form-container{max-width:600px;margin:40px auto;background:#fff;padding:20px;border-radius:8px;box-shadow:0 2px 4px rgba(0,0,0,.1);}
        .form-group{margin-bottom:15px;}
        label{display:block;margin-bottom:5px;color:#333;}
        input[type=text],input[type=email],input[type=tel]{width:100%;padding:8px;border:1px solid #ccc;border-radius:4px;}
        .btn{padding:10px 20px;border:none;border-radius:4px;background:#007bff;color:#fff;cursor:pointer;}
    </style>
</head>
<body>
<div class="form-container">
    <h2>Đặt Phòng</h2>
    <c:if test="${not empty room}">
        <p>Phòng: <strong>${room.name}</strong> | Giá: $${room.price}/đêm</p>
    </c:if>
    <form action="confirmBooking" method="post">
        <input type="hidden" name="roomId" value="${param.roomId}">
        <div class="form-group">
            <label>Họ tên</label>
            <input type="text" name="fullname" required>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>
        <div class="form-group">
            <label>Điện thoại</label>
            <input type="tel" name="phone" required>
        </div>
        <div class="form-group">
            <label>Ngày đến</label>
            <input type="date" name="checkin" required>
        </div>
        <div class="form-group">
            <label>Ngày đi</label>
            <input type="date" name="checkout" required>
        </div>
        <button type="submit" class="btn">Xác nhận đặt</button>
    </form>
</div>
</body>
</html>