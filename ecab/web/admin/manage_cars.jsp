<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Admin")) {
        response.sendRedirect("../login.jsp");
    } else {
        UserInfo info = (UserInfo)session.getAttribute("info");
        ArrayList<Car> list = DBManager.getCars(null);
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
                        <li class="first active"><a href="index.jsp" accesskey="1" title="">Admin Home</a></li>
                        <li><a href="change_password.jsp" accesskey="3" title="">Change Password</a></li>
                        <li><a href="../logout" accesskey="4" title="">Logout</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <div id="content">
            <h2>Welcome <%= info.getName()%> (Admin)</h2>
            <p align="right"><a class="link-style" href="add_car.jsp">Add New Car</a></p>
            <br><br>
            <table id="list">
                <tr class="odd">
                    <th>S.No.</th>
                    <th>Vehicle Number</th>
                    <th>Vehicle Type</th>
                    <th>Model</th>
                    <th>Seating Capacity</th>
                    <th>Fixed Charge</th>
                    <th>Fare</th>
                    <th>Edit/Delete</th>
                </tr>
                <%
                    int i = 1;
                    for (Car car : list) {
                %>
                <tr  <% if(i%2==0) { %>class="odd"<% } %>>
                    <td><%= i++ %></td>
                    <td><%= car.getVehicleNumber() %></td>
                    <td><%= car.getVehicleType() %></td>
                    <td><%= car.getModel() %></td>
                    <td><%= car.getSeatingCapacity() %></td>
                    <td><%= car.getFixedCharge() %></td>
                    <td><%= car.getFare() %></td>
                    <td>
                        <a href="edit_car.jsp?vehicleNumber=<%= car.getVehicleNumber() %>"><img src="../images/edit.png" alt=""></a>
                    &nbsp;&nbsp; / &nbsp;&nbsp;
                    <a href="delete_car.jsp?vehicleNumber=<%= car.getVehicleNumber() %>" onclick="return confirm('Are you sure');"><img src="../images/delete.png" alt=""></a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>
<% } %>