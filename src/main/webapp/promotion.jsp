<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Khuyến mãi</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link rel="stylesheet" href="<%=ctx%>/assets/css/style.css"/>

        <style>

            /* Banner */

            .promo-banner{
                height:420px;
                background:url("https://images.unsplash.com/photo-1564501049412-61c2a3083791") center/cover;
                display:flex;
                align-items:center;
                justify-content:center;
                color:white;
                font-size:48px;
                font-weight:600;
                position:relative;
            }

            .promo-banner::after{
                content:"";
                position:absolute;
                width:100%;
                height:100%;
                background:rgba(0,0,0,0.5);
            }

            .promo-banner h1{
                position:relative;
            }

            /* Section */

            .section{
                padding:80px 0;
            }

            /* Card */

            .promo-card{
                background:white;
                border-radius:12px;
                overflow:hidden;
                box-shadow:0 8px 20px rgba(0,0,0,0.1);
                transition:0.3s;
            }

            .promo-card:hover{
                transform:translateY(-8px);
            }

            .promo-card img{
                width:100%;
                height:220px;
                object-fit:cover;
            }

            .promo-body{
                padding:20px;
            }

            .promo-body h5{
                font-weight:600;
            }

        </style>

    </head>

    <body>

        <!-- HEADER -->
        <jsp:include page="/includes/header.jsp"/>

        <!-- Banner -->

        <div class="promo-banner">
            <h1>Khuyến mãi đặc biệt</h1>
        </div>

        <!-- Promotion Section -->

        <section class="section">

            <div class="container">

                <h2 class="text-center mb-5">Ưu đãi hiện có</h2>

                <div class="row g-4">

                    <!-- Promotion 1 -->

                    <div class="col-md-6">

                        <div class="promo-card">

                            <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945">

                            <div class="promo-body">
                                <h5>Summer Sale</h5>
                                <p>Giảm 20% cho tất cả phòng trong mùa hè.</p>
                            </div>

                        </div>

                    </div>

                    <!-- Promotion 2 -->

                    <div class="col-md-6">

                        <div class="promo-card">

                            <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb">

                            <div class="promo-body">
                                <h5>Weekend Deal</h5>
                                <p>Ở 2 đêm chỉ tính tiền 1.5 đêm.</p>
                            </div>

                        </div>

                    </div>

                    <!-- Promotion 3 -->

                    <div class="col-md-6">

                        <div class="promo-card">

                            <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945">

                            <div class="promo-body">
                                <h5>Luxury Package</h5>
                                <p>Combo phòng + spa + bữa tối sang trọng.</p>
                            </div>

                        </div>

                    </div>

                    <!-- Promotion 4 -->

                    <div class="col-md-6">

                        <div class="promo-card">

                            <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4">

                            <div class="promo-body">
                                <h5>Honeymoon Offer</h5>
                                <p>Ưu đãi đặc biệt cho cặp đôi trăng mật.</p>
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- FOOTER -->
        <jsp:include page="/includes/footer.jsp"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>