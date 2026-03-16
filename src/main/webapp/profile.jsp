<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
    <head>
        <title>My Account</title>

        <style>

            body{
                margin:0;
                font-family:"Segoe UI", Arial;
                background:#f4f6f9;
            }

            /* Header */

            .header{
                background:#1f2937;
                color:white;
                padding:15px 40px;
                font-size:20px;
                font-weight:600;
            }

            /* Container */

            .container{
                width:1000px;
                margin:40px auto;
            }

            /* Profile Card */

            .profile-card{
                background:white;
                border-radius:12px;
                padding:25px;
                box-shadow:0 4px 12px rgba(0,0,0,0.08);
                display:flex;
                align-items:center;
                gap:20px;
                margin-bottom:30px;
            }

            .avatar{
                width:70px;
                height:70px;
                border-radius:50%;
                background:#ddd;
                display:flex;
                align-items:center;
                justify-content:center;
                font-size:28px;
                font-weight:600;
                color:#555;
            }

            .user-info h2{
                margin:0;
                font-size:22px;
            }

            .user-info p{
                margin:3px 0;
                color:#666;
            }

            /* Booking Card */

            .card{
                background:white;
                border-radius:12px;
                padding:25px;
                box-shadow:0 4px 12px rgba(0,0,0,0.08);
            }

            .card-title{
                font-size:20px;
                font-weight:600;
                margin-bottom:20px;
            }

            /* Table */

            table{
                width:100%;
                border-collapse:collapse;
            }

            th{
                background:#111827;
                color:white;
                padding:12px;
                text-align:left;
            }

            td{
                padding:12px;
                border-bottom:1px solid #eee;
            }

            tr:hover{
                background:#fafafa;
            }

            /* Status */

            .status{
                padding:5px 12px;
                border-radius:20px;
                font-size:13px;
                font-weight:600;
            }

            .pending{
                background:#fff3cd;
                color:#856404;
            }

            .confirmed{
                background:#d4edda;
                color:#155724;
            }

            .cancelled{
                background:#f8d7da;
                color:#721c24;
            }

            .empty{
                text-align:center;
                color:#777;
                padding:20px;
            }

        </style>

    </head>

    <body>


        <div class="container">

            <!-- PROFILE -->

            <div class="profile-card">

                <div class="avatar">
                    ${sessionScope.account.fullName.charAt(0)}
                </div>

                <div class="user-info">
                    <h2>${sessionScope.account.fullName}</h2>
                    <p>${sessionScope.account.email}</p>
                </div>

            </div>

            <!-- BOOKING HISTORY -->

            <div class="card">

                <div class="card-title">
                    Booking History
                </div>

                <table>

                    <tr>
                        <th>Room</th>
                        <th>Type</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Total Price</th>
                        <th>Status</th>
                    </tr>

                    <c:choose>

                        <c:when test="${not empty listBookings}">

                            <c:forEach var="b" items="${listBookings}">

                                <tr>

                                    <td>${b.roomNumber}</td>
                                    <td>${b.typeName}</td>
                                    <td>${b.checkInDate}</td>
                                    <td>${b.checkOutDate}</td>
                                    <td>$${b.totalPrice}</td>

                                    <td>

                                        <c:choose>

                                            <c:when test="${b.status=='Pending'}"> <span class="status pending">Pending</span>
                                            </c:when>

                                            <c:when test="${b.status=='Confirmed'}"> <span class="status confirmed">Confirmed</span>
                                            </c:when>

                                            <c:otherwise> <span class="status cancelled">${b.status}</span>
                                            </c:otherwise>

                                        </c:choose>

                                    </td>

                                </tr>

                            </c:forEach>

                        </c:when>

                        <c:otherwise>

                            <tr>
                                <td colspan="6" class="empty">
                                    You have no bookings yet
                                </td>
                            </tr>

                        </c:otherwise>

                    </c:choose>

                </table>

            </div>

        </div>

    </body>
</html>
