<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
        Car car = (Car)session.getAttribute("car");
        Location location = (Location)session.getAttribute("location");
        double totalFare = car.getFixedCharge()+car.getFare()*location.getDistance();
        UserInfo info = (UserInfo)session.getAttribute("info");
        
        Booking booking = new Booking();
        booking.setUserId(info.getUserId());
        booking.setSource(location.getSource());
        booking.setDestination(location.getDestination());
        java.util.Date d = DateConverter.toDate(session.getAttribute("travelDate").toString());
        booking.setTravelDate(d);
        booking.setVehicleNumber(car.getVehicleNumber());
        booking.setTotalFare(totalFare);
        booking.setBookingDate(new java.util.Date());
        DBManager.confirmBooking(booking);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="../styles/default.css" rel="stylesheet" type="text/css" media="all" />
        <style>
            #content{
                width: 80%; 
                margin: auto;
                padding: 40px;
            }
            img{
                border-radius: 40px;
            }
        </style>        
    </head>
    <body>
        <div id="header-wrapper">
            <div id="header" class="container">
                <div id="logo">
                    <h1><a href="index.jsp">Ecab System</a></h1>
                </div>
                <div id="menu">
                    <ul>
                        <li class="first active"><a href="index.jsp" accesskey="1" title="">Member Home</a></li>
                        <li><a href="change_password.jsp" accesskey="3" title="">Change Password</a></li>
                        <li><a href="../logout" accesskey="4" title="">Logout</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <div id="content">
                <table cellpadding="10">
                    <tr>
                        <td>Travel Date : </td>
                        <td colspan="2"><%= DateConverter.toString(booking.getTravelDate()) %></td>
                    </tr>
                    <tr>
                        <td>Source City : </td>
                        <td><%= location.getSource() %></td>
                        <td rowspan="10" style="padding-left: 50px;">
                            Your Booking is Confirmed. An Email has been sent to your email ID.
                            <br>
                            Rs. <%= totalFare%> hav been deducted from your Credit Card No - <%= info.getCreditCard()%> .
                            <br>
                            <a class="link-style" href="../logout">Logout</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="link-style" href="index.jsp">Home</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Destination : </td>
                        <td><%= location.getDestination() %></td>
                    </tr>
                    <tr>
                        <td>Vehicle Number : </td>
                        <td><%= car.getVehicleNumber() %></td>
                    </tr>
                    <tr>
                        <td>Model : </td>
                        <td><%= car.getModel()%></td>
                    </tr>
                    <tr>
                        <td>Distance : </td>
                        <td><%= location.getDistance() %> Km</td>
                    </tr>
                    <tr>
                        <td>Total Fare : </td>
                        <td>Rs. <%= totalFare %></td>
                    </tr>
                    <tr>
                        <td>Name : </td>
                        <td><%= info.getName() %></td>
                    </tr>
                    <tr>
                        <td>Address : </td>
                        <td><%= info.getAddress() %></td>
                    </tr>
                    <tr>
                        <td>Email : </td>
                        <td><%= info.getEmail() %></td>
                    </tr>
                    <tr>
                        <td>Mobile Number : </td>
                        <td><%= info.getMobileNumber()%></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left">
                            <input type="button" value="Print Receipt" onclick="window.print()" />
                        </td>
                    </tr>
                </table>
        </div>
        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>

<%
    session.removeAttribute("location");
    session.removeAttribute("car");
    session.removeAttribute("travelDate");
    }
%>