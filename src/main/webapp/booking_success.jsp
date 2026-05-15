<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông báo thanh toán - DANA Hotel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .status-container {
            min-height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }
        .status-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            padding: 50px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .status-card:hover {
            transform: translateY(-5px);
        }
        .icon-circle {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            font-size: 50px;
        }
        .success-icon {
            background-color: #d1e7dd;
            color: #198754;
            animation: pulse-green 2s infinite;
        }
        .error-icon {
            background-color: #f8d7da;
            color: #dc3545;
            animation: pulse-red 2s infinite;
        }
        @keyframes pulse-green {
            0% { box-shadow: 0 0 0 0 rgba(25, 135, 84, 0.4); }
            70% { box-shadow: 0 0 0 20px rgba(25, 135, 84, 0); }
            100% { box-shadow: 0 0 0 0 rgba(25, 135, 84, 0); }
        }
        @keyframes pulse-red {
            0% { box-shadow: 0 0 0 0 rgba(220, 53, 69, 0.4); }
            70% { box-shadow: 0 0 0 20px rgba(220, 53, 69, 0); }
            100% { box-shadow: 0 0 0 0 rgba(220, 53, 69, 0); }
        }
        .status-title {
            font-weight: 800;
            margin-bottom: 20px;
            color: #212529;
        }
        .status-msg {
            color: #6c757d;
            font-size: 1.1rem;
            margin-bottom: 40px;
            line-height: 1.6;
        }
        .btn-group-custom {
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        .btn-custom {
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-history {
            background-color: #1a6eb5;
            color: white;
            border: none;
        }
        .btn-history:hover {
            background-color: #14568d;
            color: white;
            transform: scale(1.05);
        }
        .btn-home {
            background-color: #e9ecef;
            color: #495057;
            border: none;
        }
        .btn-home:hover {
            background-color: #dee2e6;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <jsp:include page="includes/header.jsp" />

    <div class="status-container">
        <div class="status-card">
            <c:choose>
                <c:when test="${param.status == 'paid'}">
                    <div class="icon-circle success-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h1 class="status-title">Đặt Phòng Thành Công!</h1>
                    <p class="status-msg">
                        Cảm ơn bạn đã tin tưởng lựa chọn <strong>DANA Hotel</strong>.<br>
                        Hệ thống đã ghi nhận yêu cầu và gửi email xác nhận chi tiết đến hòm thư của bạn. 
                        Rất hân hạnh được đón tiếp bạn sớm nhất!
                    </p>
                </c:when>
                <c:otherwise>
                    <div class="icon-circle error-icon">
                        <i class="fas fa-times-circle"></i>
                    </div>
                    <h1 class="status-title" style="color: #dc3545;">Thanh Toán Thất Bại</h1>
                    <p class="status-msg">
                        Rất tiếc, quá trình giao dịch qua VNPay đã gặp sự cố hoặc bị hủy bỏ.<br>
                        Vui lòng kiểm tra lại số dư tài khoản hoặc thử lại bằng phương thức khác.
                    </p>
                </c:otherwise>
            </c:choose>

            <div class="btn-group-custom">
                <a href="history#bookingHistory" class="btn btn-custom btn-history">
                    <i class="fas fa-history me-2"></i>Xem lịch sử
                </a>
                <a href="home" class="btn btn-custom btn-home">
                    <i class="fas fa-home me-2"></i>Trang chủ
                </a>
            </div>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>