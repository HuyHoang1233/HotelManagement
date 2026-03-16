<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Dịch vụ</title>

        <style>

            body{
                margin:0;
                font-family:"Segoe UI", Arial;
                background:#f4f6f9;
            }

            /* Banner */

            .banner{
                height:300px;
                background:url("https://images.unsplash.com/photo-1566073771259-6a8506099945") center/cover;
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
                grid-template-columns:repeat(3,1fr);
                gap:25px;
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

            /* Image */

            .card img{
                width:100%;
                height:200px;
                object-fit:cover;
            }

            /* Content */

            .card-content{
                padding:20px;
            }

            .card-content h3{
                margin:0 0 10px;
            }

            .card-content p{
                color:#666;
                font-size:14px;
            }

        </style>

    </head>

    <body>

        <div class="banner">
            Dịch vụ khách sạn
        </div>

        <div class="container">

            <div class="grid">

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1544161515-4ab6ce6db874">
                    <div class="card-content">
                        <h3>Spa & Massage</h3>
                        <p>Thư giãn với dịch vụ spa cao cấp và liệu trình massage chuyên nghiệp.</p>
                    </div>
                </div>

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1554284126-aa88f22d8b74">
                    <div class="card-content">
                        <h3>Phòng Gym</h3>
                        <p>Phòng tập hiện đại với đầy đủ thiết bị cho khách lưu trú.</p>
                    </div>
                </div>

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1572331165267-854da2b10ccc">
                    <div class="card-content">
                        <h3>Hồ bơi</h3>
                        <p>Hồ bơi ngoài trời với không gian thư giãn và view tuyệt đẹp.</p>
                    </div>
                </div>

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5">
                    <div class="card-content">
                        <h3>Nhà hàng</h3>
                        <p>Thưởng thức ẩm thực quốc tế và đặc sản địa phương.</p>
                    </div>
                </div>

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1505691938895-1758d7feb511">
                    <div class="card-content">
                        <h3>Dịch vụ phòng</h3>
                        <p>Room service 24/7 mang lại trải nghiệm tiện nghi cho khách.</p>
                    </div>
                </div>

                <div class="card">
                    <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4">
                    <div class="card-content">
                        <h3>Xe đưa đón</h3>
                        <p>Dịch vụ đưa đón sân bay tiện lợi và nhanh chóng.</p>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
