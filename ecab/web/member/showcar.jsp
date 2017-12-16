<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <%
                    String vehicleNumber = request.getParameter("vehicleNumber");
                    Car c = DBManager.getCar(vehicleNumber);
                %>            
            <table width="100%" cellpadding="10">
                <tr>
                <td align="center" rowspan="8">
                    <img width="410" height="225" src="../<%= c.getPhoto()%>" alt="">
                    <br>
                    <span style="font-size: 2.0em">Car - <%= c.getModel()%></span>
                    <br>
                    <span style="font-size: 2.0em">Vehicle Number <%= c.getVehicleNumber()%></span>
                </td>
                <td>&nbsp;</td>
                </tr>
                <tr><td style="font-size: 1.5em">Vehicle Type : <%=c.getVehicleType()%></td></tr>
                <tr><td style="font-size: 1.5em">Seating Capacity : <%=c.getSeatingCapacity()%></td></tr>
                <tr><td style="font-size: 1.5em">AC : <%= c.getAc()==1?"Yes":"No" %></td></tr>
                <tr><td style="font-size: 1.5em">Music System : <%= c.getMusicSystem()==1?"Yes":"No" %></td></tr>
                <tr><td style="font-size: 1.5em">Fixed Charge : <%=c.getFixedCharge() %> Rs/Day</td></tr>
                <tr><td style="font-size: 1.5em">Fare : <%=c.getFare()%> Rs/Km.</td></tr>
                <tr><td style="font-size: 1.5em">
                <tr>
                    <td>
                        <form action="selectlocation.jsp?vehicleNumber=<%= c.getVehicleNumber() %>" method="POST">
                            <input type="submit" value="Book Car" style="height: 50px; width: 150px;">
                            <input type="button" value="Browse Cars" onclick="history.go(-1)" style="height: 50px; width: 150px;">
                        </form>
                    </td>
                </tr>
            </table>
        </div>

        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>

