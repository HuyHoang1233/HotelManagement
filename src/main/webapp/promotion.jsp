<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Khuyến mãi</title>

        <style>

            body{
                margin:0;
                font-family:"Segoe UI",Arial;
                background:#f4f6f9;
            }

            /* Banner */

            .banner{
                height:300px;
                background:url("https://images.unsplash.com/photo-1564501049412-61c2a3083791") center/cover;
                display:flex;
                align-items:center;
                justify-content:center;
                color:white;
                font-size:36px;
                font-weight:600;
            }

            /* Container */

            .container{
                width:1100px;
                margin:50px auto;
            }

            /* Grid */

            .grid{
                display:grid;
                grid-template-columns:repeat(2,1fr);
                gap:30px;
            }

            /* Card */

            .card{
                background:white;
                border-radius:12px;
                overflow:hidden;
                box-shadow:0 5px 15px rgba(0,0,0,0.1);
                transition:0.3s;
            }

            .card:hover{
                transform:translateY(-8px);
            }

            .card img{
                width:100%;
                height:220px;
                object-fit:cover;
            }

            .card-content{
                padding:20px;
            }

            .card-content h3{
                margin:0 0 10px;
            }

            .card-content p{
                color:#666;
            }

        </style>

    </head>

    <body>

        <div class="banner">
            Khuyến mãi đặc biệt
        </div>

        <div class="container">

            <div class="grid">

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1501117716987-c8e1ecb2101c">
                    <div class="card-content">
                        <h3>Summer Sale</h3>
                        <p>Giảm 20% cho tất cả phòng trong mùa hè.</p>
                    </div>
                </div>

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb">
                    <div class="card-content">
                        <h3>Weekend Deal</h3>
                        <p>Ở 2 đêm chỉ tính tiền 1.5 đêm.</p>
                    </div>
                </div>

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945">
                    <div class="card-content">
                        <h3>Luxury Package</h3>
                        <p>Combo phòng + spa + bữa tối sang trọng.</p>
                    </div>
                </div>

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4">
                    <div class="card-content">
                        <h3>Honeymoon Offer</h3>
                        <p>Ưu đãi đặc biệt cho cặp đôi trăng mật.</p>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
