<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contact - Hotel Management</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link rel="stylesheet" href="<%=ctx%>/assets/css/style.css" />
    </head>

    <body>
        <jsp:include page="/includes/header.jsp"/>

        <section class="section about">
            <div class="container about-grid">
                <div class="about-text">
                    <h2 class="section-title">Liên hệ</h2>
                    <p>
                        Hotel mang đến trải nghiệm lưu trú hiện đại, tinh tế và tiện nghi.
                        Vị trí thuận lợi, phòng ốc sạch đẹp, cùng đội ngũ nhân viên thân thiện.
                    </p>
                    <p>
                        Chúng tôi hướng đến dịch vụ chuyên nghiệp, không gian ấm cúng, phù hợp cho
                        nghỉ dưỡng và công tác.
                    </p>
                </div>

                <div class="about-photo">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8561681211895!2d108.25831637517948!3d15.968885884696078!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1773590808761!5m2!1svi!2s" width="100%" height="400" style="border:0; border-radius: 8px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </section>

        <jsp:include page="/includes/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>