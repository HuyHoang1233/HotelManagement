# 🏨 Hệ thống Quản lý Khách sạn (Hotel Management System)

[![Java](https://img.shields.io/badge/Java-8-orange.svg)](https://www.oracle.com/java/)
[![Maven](https://img.shields.io/badge/Maven-3.x-blue.svg)](https://maven.apache.org/)
[![SQL Server](https://img.shields.io/badge/Database-SQL%20Server-red.svg)](https://www.microsoft.com/sql-server)
[![Tomcat](https://img.shields.io/badge/Server-Tomcat%209-yellow.svg)](https://tomcat.apache.org/)

## 📝 Giới thiệu
Đây là dự án ứng dụng Web Quản lý Khách sạn được xây dựng bằng công nghệ **Java Servlet**, **JSP** và cơ sở dữ liệu **Microsoft SQL Server**. Hệ thống hỗ trợ quản lý đặt phòng, tìm kiếm và quản lý phòng trống, tích hợp thanh toán trực tuyến qua cổng **VNPay**, và tự động gửi email xác nhận cho khách hàng.

---

## 🛠 Công nghệ sử dụng

| Thành phần | Công nghệ / Thư viện |
| :--- | :--- |
| **Backend** | Java 8, Servlet, JSP, JSTL (Java EE 8) |
| **Database** | Microsoft SQL Server |
| **Build Tool** | Maven |
| **Web Server** | Apache Tomcat 9 hoặc GlassFish |
| **Thư viện Email** | `javax.mail` - Tự động gửi mail xác nhận |
| **Xử lý JSON** | `gson` - Chuyển đổi dữ liệu linh hoạt |
| **HTTP Client** | `fluent-hc` - Gọi API tích hợp cổng thanh toán |

---

## 💻 Yêu cầu hệ thống (Prerequisites)
Để chạy được dự án này trên máy local, bạn cần cài đặt:
*   **JDK:** 1.8 (Java 8)
*   **Cơ sở dữ liệu:** Microsoft SQL Server (đã khởi chạy và cấu hình kết nối TCP/IP)
*   **Công cụ build:** Apache Maven
*   **IDE:** Khuyến nghị dùng NetBeans, IntelliJ IDEA, hoặc Eclipse

---

## 🚀 Hướng dẫn cài đặt và khởi chạy (How to run)

### Cách 1: Chạy nhanh qua Maven Command (Sử dụng Embedded Tomcat)
Dự án đã được tích hợp sẵn plugin `cargo-maven3-plugin` giúp bạn chạy trực tiếp Tomcat 9 từ dòng lệnh mà không cần cài đặt Tomcat thủ công:

1.  Mở Terminal / Command Prompt tại thư mục chứa file `pom.xml`.
2.  **Clean và cài đặt dependencies:**
    ```bash
    mvn clean install
    ```
3.  **Khởi chạy dự án:**
    ```bash
    mvn cargo:run
    ```
4.  Truy cập ứng dụng tại: `http://localhost:8080/`

### Cách 2: Khởi chạy thông qua IDE (NetBeans/IntelliJ/Eclipse)
1.  Mở IDE và chọn **Open Project**, chọn thư mục chứa file `pom.xml`.
2.  **Cấu hình Database:** Kiểm tra chuỗi kết nối (Connection String) trong source code để khớp với Database SQL Server local (Username, Password, Tên DB).
3.  Thêm Web Server (Tomcat / GlassFish) vào IDE.
4.  Chuột phải vào dự án và chọn **Run**.

---

## 📂 Cấu trúc dự án
*   `pom.xml`: File cấu hình dependency và plugin của Maven.
*   `src/main/java`: Chứa toàn bộ mã nguồn Java (Controllers, Models, DAOs, DB Context...).
*   `src/main/webapp`: Chứa mã nguồn giao diện (JSP, HTML, CSS, JavaScript).
*   `nb-configuration.xml`: Cấu hình dành riêng cho NetBeans IDE.

---

## 👨‍💻 Thông tin nộp bài
*   **Dự án:** Hotel Management System
*   **Môn học:** PRJ301 - Java Web Application Development
*   **Trạng thái:** Hoàn thiện tích hợp Thanh toán & Email.

---
*Dự án được quản lý và triển khai chuyên nghiệp trên GitHub.*
