<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String travelDate = request.getParameter("travelDate");
        Location location = DBManager.getLocation(source, destination);
        String vehicleNumber = request.getParameter("vehicleNumber");
        Car car = DBManager.getCar(vehicleNumber);
        double totalFare = car.getFixedCharge()+car.getFare()*location.getDistance();
        UserInfo info = (UserInfo)session.getAttribute("info");
        session.setAttribute("car", car);
        session.setAttribute("location", location);
        session.setAttribute("travelDate", travelDate);
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
                        <td colspan="2"><%= travelDate%></td>
                    </tr>
                    <tr>
                        <td>Source City : </td>
                        <td><%= source%></td>
                        <td rowspan="10" style="padding-left: 50px;">
                            Rs. <%= totalFare %> will be deducted from your credit Card.
                            <br><br>
                            To Confirm Booking, click the below Link.
                            <br><br>
                            <a class="link-style" href="confirm.jsp">Confirm Booking</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Destination : </td>
                        <td><%= destination%></td>
                    </tr>
                    <tr>
                        <td>Vehicle Number : </td>
                        <td><%= vehicleNumber%></td>
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
                </table>
        </div>
        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>

<%
    }
%>