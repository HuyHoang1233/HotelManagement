<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dịch vụ khách sạn</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link rel="stylesheet" href="<%=ctx%>/assets/css/style.css">

        <style>

            /* Banner */

            .services-banner{
                height:380px;
                background:url("https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=1400") center/cover;
                display:flex;
                align-items:center;
                justify-content:center;
                color:white;
                font-size:45px;
                font-weight:600;
                position:relative;
            }

            .services-banner::after{
                content:"";
                position:absolute;
                width:100%;
                height:100%;
                background:rgba(0,0,0,0.45);
            }

            .services-banner h1{
                position:relative;
            }

            /* Section */

            .services-section{
                padding:80px 0;
                background:#f6f6f6;
            }

            /* Card */

            .service-card{
                border:none;
                border-radius:12px;
                overflow:hidden;
                background:white;
                box-shadow:0 8px 22px rgba(0,0,0,0.12);
                transition:0.3s;
            }

            .service-card:hover{
                transform:translateY(-8px);
            }

            .service-card img{
                height:200px;
                object-fit:cover;
            }

            .service-body{
                padding:18px;
            }

            .service-title{
                font-size:20px;
                font-weight:600;
                margin-bottom:8px;
            }

            .service-desc{
                font-size:14px;
                color:#666;
            }

        </style>

    </head>

    <body>

        <!-- HEADER -->
        <jsp:include page="/includes/header.jsp"/>

        <!-- Banner -->

        <div class="services-banner">
            <h1>Dịch vụ khách sạn</h1>
        </div>

        <!-- Services -->

        <section class="services-section">

            <div class="container">

                <div class="row g-4">

                    <!-- Spa -->

                    <div class="col-md-4">
                        <div class="card service-card">
                            <img src="https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=600&h=400&fit=crop">
                            <div class="service-body">
                                <div class="service-title">Spa & Massage</div>
                                <p class="service-desc">
                                    Thư giãn với dịch vụ spa cao cấp và liệu trình massage chuyên nghiệp.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Gym -->

                    <div class="col-md-4">
                        <div class="card service-card">
                            <img src="https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=600&h=400&fit=crop">
                            <div class="service-body">
                                <div class="service-title">Phòng Gym</div>
                                <p class="service-desc">
                                    Phòng tập hiện đại với đầy đủ thiết bị cho khách lưu trú.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Pool -->

                    <div class="col-md-4">
                        <div class="card service-card">
                            <img src="https://tse1.mm.bing.net/th/id/OIP.MbaWSaaWy4ksgJv10Foo_gHaFA?pid=Api&h=220&P=0">
                            <div class="service-body">
                                <div class="service-title">Hồ bơi</div>
                                <p class="service-desc">
                                    Hồ bơi ngoài trời với không gian thư giãn và view đẹp.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Restaurant -->

                    <div class="col-md-4">
                        <div class="card service-card">
                            <img src="https://images.unsplash.com/photo-1559339352-11d035aa65de?w=600&h=400&fit=crop">
                            <div class="service-body">
                                <div class="service-title">Nhà hàng</div>
                                <p class="service-desc">
                                    Thưởng thức ẩm thực quốc tế và đặc sản địa phương.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Room Service -->

                    <div class="col-md-4">
                        <div class="card service-card">
                            <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600&h=400&fit=crop">
                            <div class="service-body">
                                <div class="service-title">Dịch vụ phòng</div>
                                <p class="service-desc">
                                    Room service 24/7 mang lại trải nghiệm tiện nghi cho khách.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Shuttle -->

                    <div class="col-md-4">
                        <div class="card service-card">
                            <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=600&h=400&fit=crop">
                            <div class="service-body">
                                <div class="service-title">Xe đưa đón</div>
                                <p class="service-desc">
                                    Dịch vụ đưa đón sân bay tiện lợi và nhanh chóng.
                                </p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </section>

        <!-- FOOTER -->
        <jsp:include page="/includes/footer.jsp"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>