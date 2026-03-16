<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctx = request.getContextPath();%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard - DANA Hotel</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            body {
                background-color: #f4f6f9;
                overflow-x: hidden;
            }
            .sidebar {
                min-height: 100vh;
                background-color: #343a40;
                color: #fff;
            }
            .sidebar .brand {
                font-size: 1.2rem;
                font-weight: bold;
                padding: 20px;
                text-align: center;
                border-bottom: 1px solid #4f5962;
            }
            .sidebar a {
                color: #c2c7d0;
                text-decoration: none;
                padding: 15px 20px;
                display: block;
                transition: 0.3s;
            }
            .sidebar a:hover, .sidebar a.active {
                background-color: #007bff;
                color: #fff;
                border-left: 4px solid #fff;
            }
            .card-box {
                border-radius: 10px;
                border: none;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                transition: transform 0.3s;
            }
            .card-box:hover {
                transform: translateY(-5px);
            }
            .card-box i {
                font-size: 2.5rem;
                opacity: 0.5;
                position: absolute;
                right: 20px;
                top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="d-flex">
            <div class="sidebar" style="width: 250px;">
                <div class="brand"><i class="fas fa-hotel text-warning me-2"></i> DANA ADMIN</div>
                <a href="<%=ctx%>/admin/dashboard" class="active"><i class="fas fa-tachometer-alt me-2"></i> Tổng quan</a>
                <a href="<%=ctx%>/admin/admin_room_form.jsp"><i class="fas fa-bed me-2"></i> Quản lý Phòng</a>
                <a href="<%=ctx%>/admin/admin_booking_manager.jsp"><i class="fas fa-calendar-check me-2"></i> Quản lý Đặt phòng</a>
                <a href="<%=ctx%>/admin/users"><i class="fas fa-users me-2"></i> Quản lý Người dùng</a>
                <a href="<%=ctx%>/home" class="mt-5 border-top border-secondary"><i class="fas fa-arrow-left me-2"></i> Về trang Khách</a>
            </div>

            <div class="flex-grow-1 p-4">
                <h2 class="mb-4 fw-bold" style="color: #343a40;">Thống Kê Doanh Thu Hệ Thống</h2>

                <div class="row g-4 mb-4">
                    <div class="col-md-3">
                        <div class="card card-box bg-primary text-white p-3 position-relative">
                            <h5>Tổng Số Khách</h5>
                            <h3 class="fw-bold">${totalCustomers != null ? totalCustomers : '0'}</h3>
                            <i class="fas fa-users"></i>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-box bg-success text-white p-3 position-relative">
                            <h5>Đơn Đặt Mới</h5>
                            <h3 class="fw-bold">${newBookings != null ? newBookings : '0'}</h3>
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-box bg-warning text-dark p-3 position-relative">
                            <h5>Phòng Đang Trống</h5>
                            <h3 class="fw-bold">${availableRooms != null ? availableRooms : '0'}</h3>
                            <i class="fas fa-door-open"></i>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-box bg-danger text-white p-3 position-relative">
                            <h5>Tổng Doanh Thu</h5>
                            <h3 class="fw-bold">
                                <fmt:formatNumber value="${totalYearRevenue != null ? totalYearRevenue : 0}" type="number" pattern="#,##0"/> đ
                            </h3>
                            <i class="fas fa-chart-line"></i>
                        </div>
                    </div>
                </div>

                <div class="card card-box p-4 bg-white">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0">Biểu Đồ Doanh Thu (${selectedYear != null ? selectedYear : '2026'})</h5>
                        <form action="<%=ctx%>/admin/dashboard" method="GET" class="d-flex">
                            <select name="year" class="form-select form-select-sm" onchange="this.form.submit()">
                                <option value="2024" ${selectedYear == 2024 ? 'selected' : ''}>Năm 2024</option>
                                <option value="2025" ${selectedYear == 2025 ? 'selected' : ''}>Năm 2025</option>
                                <option value="2026" ${selectedYear == 2026 ? 'selected' : ''}>Năm 2026</option>
                            </select>
                        </form>
                    </div>
                    <canvas id="revenueChart" height="80"></canvas>
                </div>
            </div>
        </div>

        <script>
            const ctxChart = document.getElementById('revenueChart').getContext('2d');
            const months = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
            const revenues = ${not empty revenueData ? revenueData : '[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]'};

            new Chart(ctxChart, {
                type: 'bar',
                data: {
                    labels: months,
                    datasets: [{
                            label: 'Doanh Thu (VNĐ)',
                            data: revenues,
                            backgroundColor: 'rgba(54, 162, 235, 0.7)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1, borderRadius: 4
                        }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {beginAtZero: true, ticks: {callback: function (value) {
                                    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
                                }}}
                    },
                    plugins: {
                        tooltip: {callbacks: {label: function (context) {
                                    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(context.parsed.y);
                                }}}
                    }
                }
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>