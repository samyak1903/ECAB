<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
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
            <table width="100%">
                <tr>
                    <td><a class="link-style" href="viewcars.jsp">View All Cars</a></td>
                    <td><a class="link-style" href="viewcars.jsp?vehicleType=Small">View Small Cars</a></td>
                    <td><a class="link-style" href="viewcars.jsp?vehicleType=Sedan">View Sedans</a></td>
                    <td><a class="link-style" href="viewcars.jsp?vehicleType=SUV">View SUV</a></td></tr>
            </table>
            <br><br>
            <table width="100%" cellpadding="10">
                <%
                    int i = 1;
                    String vehicleType = request.getParameter("vehicleType");
                    ArrayList<Car> list = DBManager.getCars(vehicleType);
                    for (Car c : list) {
                        if (i % 3 == 1) {
                            out.println("<tr>");
                        }
                %>
                <td align="center">
                    <a href="showcar.jsp?vehicleNumber=<%= c.getVehicleNumber()%>"><img width="310" height="180" src="../<%= c.getPhoto()%>" alt=""></a>
                    <br>
                    <span style="font-size: 3.0em"><%= c.getModel()%></span>
                </td>
                <%
                        if (i % 3 == 0) {
                            out.println("</tr>");
                        }
                        i++;
                    }
                %>
            </table>
        </div>

        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>
<% } %>

