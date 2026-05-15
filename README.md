# 🏨 Hệ thống Quản lý Khách sạn (Hotel Management System)

[![Java](https://img.shields.io/badge/Java-8-orange.svg)](https://www.oracle.com/java/)
[![Maven](https://img.shields.io/badge/Maven-3.x-blue.svg)](https://maven.apache.org/)
[![SQL Server](https://img.shields.io/badge/Database-SQL%20Server-red.svg)](https://www.microsoft.com/sql-server)
[![Tomcat](https://img.shields.io/badge/Server-Tomcat%209-yellow.svg)](https://tomcat.apache.org/)

## 📝 Giới thiệu
Dự án Web Quản lý Khách sạn cao cấp được xây dựng trên nền tảng **Java Servlet/JSP**. Hệ thống giải quyết trọn vẹn quy trình từ tìm kiếm phòng, đặt phòng trực tuyến, thanh toán điện tử cho đến xác nhận dịch vụ tự động, mang lại trải nghiệm chuyên nghiệp cho người dùng.

---

## 🚀 Hệ thống Chức năng Đầy đủ

### 1. Chức năng dành cho Khách hàng (Frontend)
*   🔍 **Tìm kiếm phòng nâng cao:** Tìm kiếm theo ngày nhận/trả phòng, số lượng khách và loại phòng.
*   🖼 **Xem chi tiết phòng:** Hiển thị hình ảnh, mô tả, tiện nghi và giá phòng thời gian thực.
*   📅 **Đặt phòng trực tuyến:** Quy trình đặt phòng nhanh chóng với các bước nhập thông tin tối giản.
*   💳 **Thanh toán VNPay:** Tích hợp cổng thanh toán quốc gia, hỗ trợ thanh toán qua ATM, thẻ quốc tế và QR Code.
*   📩 **Xác nhận qua Email:** Tự động gửi mail thông báo chi tiết đơn đặt phòng ngay sau khi giao dịch thành công.
*   📜 **Lịch sử giao dịch:** Khách hàng có thể theo dõi lại các đơn đặt phòng đã thực hiện.

### 2. Chức năng Quản trị (Backend Logic)
*   📊 **Quản lý trạng thái phòng:** Hệ thống tự động khóa phòng khi có người đặt, tránh tình trạng "Overbooking".
*   💰 **Tính toán doanh thu:** Tự động tính toán tổng tiền, thuế và các chi phí phát sinh.
*   🛠 **Cấu hình hệ thống:** Quản lý danh mục loại phòng, giá cả và các chính sách của khách sạn.

### 3. Đặc điểm Kỹ thuật nổi bật
*   **Kiến trúc MVC:** Phân tách rõ rệt Controller, Service, DAO và View.
*   **Bảo mật giao dịch:** Sử dụng thuật toán băm (Hash) để xác thực chữ ký số từ VNPay.
*   **Xử lý bất đồng bộ:** Sử dụng Java Mail API chạy nền để không làm gián đoạn trải nghiệm người dùng.

---

## 🛠 Công nghệ & Thư viện sử dụng

| Thành phần | Công nghệ / Thư viện |
| :--- | :--- |
| **Backend** | Java 8, Servlet, JSP, JSTL (Java EE 8) |
| **Database** | Microsoft SQL Server (DAO Pattern) |
| **Payment** | VNPay Payment Gateway API |
| **Email** | Java Mail API (javax.mail) |
| **JSON** | Google Gson |

---

## 💻 Hướng dẫn Khởi chạy

1.  **Cài đặt CSDL:** Chạy Script SQL Server đính kèm.
2.  **Cấu hình:** Thay đổi Username/Password database trong file cấu hình.
3.  **Build & Run:**
    ```bash
    mvn clean install
    ```
    ```bash
    mvn cargo:run
    ```
4.  Truy cập: `http://localhost:8080/`

---

## 👨‍💻 Thông tin nộp bài
*   **Tác giả:** Mai Huy Hoàng
*   **Môn học:** PRJ301 - Lập trình Web với Java
*   **Đánh giá:** Dự án hoàn thiện 100% các tính năng cốt lõi và tích hợp nâng cao.

---
*Dự án được quản lý và triển khai chuyên nghiệp trên GitHub.*
