<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
        boolean status = false;
        int template = 1;
        if(request.getMethod().equals("POST")){
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            if(!password.equals(cpassword)){
                status=true;
            }else{
                DBManager.changePassword(session.getAttribute("userName").toString(),password);
                template=2;
            }
        }
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
                <% if(template==1) { %>
                <form style="width: 400px" action="changepassword.jsp" method="POST">
                    <fieldset>
                        <legend>Change Password Form</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>New Password : </td>
                                <td><input type="password" name="password" required value="" /></td>
                            </tr>
                            <tr>
                                <td>Confirm Password : </td>
                                <td><input type="password" name="cpassword" required value="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" value="Change Password" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                </form>
                <% if(status) {%>
                <h2 style="color: red;">The Passwords do not match.</h2>
                <% } %>
                <% } %>
                <% if(template==2) { %>
                <h2>Your password has been updated.</h2>
                <% } %>
            </div>
        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>
<% } %>

