<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
        UserInfo info = (UserInfo)session.getAttribute("info");
        String userId = session.getAttribute("userId").toString();
        ArrayList<Booking> list = DBManager.getBookings(userId);
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
                min-height: 400px;
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
            <h2>Welcome <%= info.getName()%></h2>
            <br>
            <br>
            <% if(list.size()==0) { %>
            <h2>You have no booking history.</h2>
            <% } else { %>
            <hr>
            <table id="list">
                <tr class="odd">
                    <th>S.No.</th>
                    <th>Booking Date</th>
                    <th>Travel Date</th>
                    <th>Source</th>
                    <th>Destination</th>
                    <th>Car</th>
                    <th>Vehicle Number</th>
                    <th>Fare</th>
                </tr>
                <%
                    int i = 1;
                    for (Booking b : list) {
                %>
                <tr  <% if(i%2==0) { %>class="odd"<% } %>>
                    <td><%= i++ %></td>
                    <td><%= DateConverter.toString(b.getBookingDate()) %></td>
                    <td><%= DateConverter.toString(b.getTravelDate()) %></td>
                    <td><%= b.getSource() %></td>
                    <td><%= b.getDestination() %></td>
                    <td><%= DBManager.getCar(b.getVehicleNumber()).getModel() %></td>
                    <td><%= b.getVehicleNumber()%></td>
                    <td>Rs. <%= b.getTotalFare()%></td>
                </tr>
                <% } %>
            </table>
            <% } %>

        </div>
        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>
<% } %>