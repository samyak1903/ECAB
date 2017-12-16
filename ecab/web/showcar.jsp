<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("login.jsp");
    } else {

%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="styles/default.css" rel="stylesheet" type="text/css" media="all" />
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
                        <li class="first active"><a href="index.jsp" accesskey="1" title="">Homepage</a></li>
                        <li><a href="login.jsp" accesskey="2" title="">Login</a></li>
                        <li><a href="register.jsp" accesskey="3" title="">Register</a></li>
                        <li><a href="viewcars.jsp" accesskey="4" title="">View Cars</a></li>

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
                    <img width="410" height="225" src="<%= c.getPhoto()%>" alt="">
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
                    <td style="font-size: 1.5em; background-color: yellow; padding: 10px;">To Book a car, you must be Logged in.</td>
                </tr>
            </table>
        </div>

        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>
<% } %>

