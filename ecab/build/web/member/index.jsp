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
            <br><br>
            <p>
                <a class="link-style" href="viewcars.jsp">Book a Car</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="link-style" href="show_history.jsp">View Booking History</a>
            </p>
        </div>
        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>
<% } %>