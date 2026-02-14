<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Kiếm Phòng - Hotel Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
        }
        
        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
            gap: 20px;
            padding: 0 20px;
        }
        
        .sidebar {
            width: 250px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            height: fit-content;
        }
        
        .filter-group {
            margin-bottom: 25px;
        }
        
        .filter-group h3 {
            font-size: 16px;
            margin-bottom: 15px;
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        
        .filter-group label {
            display: block;
            margin-bottom: 10px;
            font-size: 14px;
            cursor: pointer;
            color: #555;
        }
        
        .filter-group input[type="checkbox"],
        .filter-group input[type="radio"] {
            margin-right: 8px;
            cursor: pointer;
        }
        
        .price-range {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        
        .price-range input {
            width: 70px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .main-content {
            flex: 1;
        }
        
        .search-header {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .search-header h2 {
            color: #333;
            margin-bottom: 10px;
        }
        
        .search-info {
            color: #666;
            font-size: 14px;
        }
        
        .sort-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            background: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .sort-bar select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .rooms-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
        }
        
        .room-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }
        
        .room-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        
        .room-image {
            width: 100%;
            height: 200px;
            background: #ddd;
            object-fit: cover;
        }
        
        .room-info {
            padding: 15px;
        }
        
        .room-name {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
        }
        
        .room-details {
            font-size: 13px;
            color: #666;
            margin-bottom: 10px;
            line-height: 1.5;
        }
        
        .room-price {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 12px;
        }
        
        .room-rating {
            font-size: 12px;
            color: #ffc107;
            margin-bottom: 12px;
        }
        
        .room-actions {
            display: flex;
            gap: 8px;
        }
        
        .btn {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s;
        }
        
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #0056b3;
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #545b62;
        }
        
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            background: white;
            border-radius: 8px;
        }
        
        .empty-state p {
            color: #666;
            font-size: 16px;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 30px;
        }
        
        .pagination a, .pagination span {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
            color: #007bff;
        }
        
        .pagination a:hover {
            background-color: #f0f0f0;
        }
        
        .pagination .active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar Filters -->
        <aside class="sidebar">
            <form method="GET" action="search">
                <!-- Loại phòng -->
                <div class="filter-group">
                    <h3>Loại Phòng</h3>
                    <label>
                        <input type="checkbox" name="roomType" value="single">
                        Phòng Đơn
                    </label>
                    <label>
                        <input type="checkbox" name="roomType" value="double">
                        Phòng Đôi
                    </label>
                    <label>
                        <input type="checkbox" name="roomType" value="suite">
                        Phòng Suite
                    </label>
                </div>
                
                <!-- Giá -->
                <div class="filter-group">
                    <h3>Khoảng Giá</h3>
                    <div class="price-range">
                        <input type="number" name="priceMin" placeholder="Từ" min="0">
                        <span>-</span>
                        <input type="number" name="priceMax" placeholder="Đến" min="0">
                    </div>
                </div>
                
                <!-- Tiện ích -->
                <div class="filter-group">
                    <h3>Tiện Ích</h3>
                    <label>
                        <input type="checkbox" name="amenities" value="wifi">
                        WiFi Miễn Phí
                    </label>
                    <label>
                        <input type="checkbox" name="amenities" value="aircon">
                        Điều Hòa
                    </label>
                    <label>
                        <input type="checkbox" name="amenities" value="tv">
                        TV Màn Hình Phẳng
                    </label>
                    <label>
                        <input type="checkbox" name="amenities" value="minibar">
                        Mini Bar
                    </label>
                </div>
                
                <!-- Xếp hạng -->
                <div class="filter-group">
                    <h3>Xếp Hạng</h3>
                    <label>
                        <input type="radio" name="rating" value="5">
                        ⭐⭐⭐⭐⭐ (5 sao)
                    </label>
                    <label>
                        <input type="radio" name="rating" value="4">
                        ⭐⭐⭐⭐ (4 sao trở lên)
                    </label>
                    <label>
                        <input type="radio" name="rating" value="3">
                        ⭐⭐⭐ (3 sao trở lên)
                    </label>
                </div>
                
                <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 10px;">
                    Áp Dụng Bộ Lọc
                </button>
            </form>
        </aside>
        
        <!-- Main Content -->
        <main class="main-content">
            <!-- Search Header -->
            <div class="search-header">
                <h2>Kết Quả Tìm Kiếm</h2>
                <p class="search-info">
                    Từ: <strong>01/01/2024</strong> | Đến: <strong>05/01/2024</strong> | 
                    <strong id="roomCount">0</strong> phòng khả dụng
                </p>
            </div>
            
            <!-- Sort Bar -->
            <div class="sort-bar">
                <span>Sắp xếp theo:</span>
                <select onchange="window.location.href='search?sort=' + this.value">
                    <option value="">-- Lựa chọn --</option>
                    <option value="price_asc">Giá: Thấp → Cao</option>
                    <option value="price_desc">Giá: Cao → Thấp</option>
                    <option value="rating">Xếp hạng cao nhất</option>
                    <option value="newest">Mới nhất</option>
                </select>
            </div>
            
            <!-- Rooms Grid -->
            <div class="rooms-grid">
                <c:if test="${empty rooms}">
                    <div class="empty-state" style="grid-column: 1/-1;">
                        <p>❌ Không tìm thấy phòng phù hợp. Vui lòng thử lại với tiêu chí khác.</p>
                    </div>
                </c:if>
                
                <c:forEach var="room" items="${rooms}">
                    <div class="room-card" onclick="window.location.href='detail?roomId=${room.id}'">
                        <img src="https://via.placeholder.com/280x200?text=${room.name}" 
                             alt="${room.name}" class="room-image">
                        <div class="room-info">
                            <div class="room-name">${room.name}</div>
                            <div class="room-details">
                                <div>👥 ${room.maxGuests} khách</div>
                                <div>📐 ${room.size}m²</div>
                            </div>
                            <div class="room-price">$${room.price}/đêm</div>
                            <div class="room-rating">
                                ⭐ ${room.rating} (${room.reviews} đánh giá)
                            </div>
                            <div class="room-actions">
                                <a href="detail?roomId=${room.id}" class="btn btn-primary">Chi Tiết</a>
                                <a href="booking?roomId=${room.id}" class="btn btn-secondary">Đặt Phòng</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <!-- Pagination -->
            <div class="pagination">
                <a href="?page=1">&laquo; Đầu</a>
                <a href="?page=${currentPage - 1}">← Trước</a>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="active">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <a href="?page=${currentPage + 1}">Sau →</a>
                <a href="?page=${totalPages}">Cuối &raquo;</a>
            </div>
        </main>
    </div>
</body>
</html>