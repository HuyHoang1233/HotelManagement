<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Rooms - Hotel Management</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link rel="stylesheet" href="<%=ctx%>/assets/css/style.css" />
    </head>

    <body>
        <jsp:include page="/includes/header.jsp"/>

        <section class="section about">
            <div class="container about-grid">
                <div class="about-text">
                    <h2 class="section-title">Lưu trú</h2>
                    <p>
                        Hotel mang đến trải nghiệm lưu trú hiện đại, tinh tế và tiện nghi.
                        Vị trí thuận lợi, phòng ốc sạch đẹp, cùng đội ngũ nhân viên thân thiện.
                    </p>
                    <p>
                        Chúng tôi hướng đến dịch vụ chuyên nghiệp, không gian ấm cúng, phù hợp cho
                        nghỉ dưỡng và công tác.
                    </p>
                    <a class="btn-outline" href="<%=ctx%>/about.jsp">Xem thêm</a>
                </div>

                <div class="about-photo">
                    <img src="<%=ctx%>/assets/img/about.jpg" alt="About" />
                </div>
            </div>
        </section>

        <jsp:include page="/includes/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>