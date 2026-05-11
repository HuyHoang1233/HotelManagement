# Hệ thống Quản lý Khách sạn (Hotel Management System)

## Giới thiệu
Đây là dự án ứng dụng Web Quản lý Khách sạn được xây dựng bằng công nghệ Java Servlet, JSP và cơ sở dữ liệu Microsoft SQL Server. Hệ thống hỗ trợ quản lý đặt phòng, tìm kiếm và quản lý phòng trống, tích hợp thanh toán trực tuyến qua cổng VNPay, và tự động gửi email xác nhận cho khách hàng.

## Công nghệ sử dụng
- **Backend:** Java 8, Servlet, JSP, JSTL (Java EE 8)
- **Cơ sở dữ liệu:** Microsoft SQL Server
- **Quản lý package & Build:** Maven
- **Thư viện nổi bật:**
  - `javax.mail`: Hỗ trợ gửi email xác nhận đặt phòng.
  - `gson`: Xử lý dữ liệu JSON.
  - `fluent-hc` (Apache HttpComponents): Gọi HTTP API cho các tích hợp ngoại (như cổng thanh toán).
- **Web Server:** Hỗ trợ chạy trên Apache Tomcat 9 hoặc GlassFish.

## Yêu cầu hệ thống (Prerequisites)
Để chạy được dự án này trên máy local, bạn cần cài đặt:
- **JDK:** 1.8 (Java 8)
- **Cơ sở dữ liệu:** Microsoft SQL Server (đã khởi chạy và cấu hình kết nối TCP/IP)
- **Công cụ build:** Apache Maven
- **IDE:** Khuyến nghị dùng NetBeans, IntelliJ IDEA, hoặc Eclipse

## Hướng dẫn cài đặt và khởi chạy (How to run)

### Cách 1: Chạy nhanh qua Maven Command (Sử dụng Embedded Tomcat)
Dự án đã được tích hợp sẵn plugin `cargo-maven3-plugin` giúp bạn chạy trực tiếp Tomcat 9 từ dòng lệnh mà không cần cài đặt Tomcat thủ công:

1. Mở Terminal / Command Prompt tại thư mục chứa file `pom.xml`.
2. Clean và tải các thư viện (dependencies) cần thiết:
   ```bash
   mvn clean install
   ```
3. Khởi chạy dự án:
   ```bash
   mvn cargo:run
   ```
4. Truy cập ứng dụng qua trình duyệt web tại đường dẫn `http://localhost:8080/` (hoặc port tương ứng theo cấu hình).

### Cách 2: Khởi chạy thông qua IDE (NetBeans/IntelliJ/Eclipse)
1. Mở IDE và tiến hành **Open Project**, chọn thư mục chứa file `pom.xml`.
2. Kiểm tra và cập nhật chuỗi kết nối (Connection String) trong source code để khớp với Database SQL Server local của bạn (Username, Password, Tên DB).
3. Thêm một Web Server (Tomcat / GlassFish) vào IDE của bạn nếu chưa có.
4. Chạy dự án bằng nút **Run** (hoặc chuột phải vào project -> Run).

## Cấu trúc dự án
- `pom.xml`: File cấu hình dependency của Maven.
- `src/main/java`: Chứa toàn bộ mã nguồn Java (Controllers/Servlets, Models, DAOs, DB Context...).
- `src/main/webapp`: Chứa mã nguồn giao diện (JSP, HTML, CSS, JavaScript).
- `nb-configuration.xml`: Cấu hình cho NetBeans IDE.
