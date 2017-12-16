<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean error=false;
    if(request.getMethod().equals("POST")){
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        UserInfo info = DBManager.loginUser(userId, password);
        if(info==null){
            error=true;
        }else{
            session.setAttribute("userId", info.getUserId());
            session.setAttribute("roleName", info.getRoleName());
            session.setAttribute("info", info);
            if(info.getRoleName().equals("Member")){
                response.sendRedirect("member/index.jsp");
            }else if(info.getRoleName().equals("Admin")){
                response.sendRedirect("admin/index.jsp");
            }
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
        <link href="styles/default.css" rel="stylesheet" type="text/css" media="all" />
        <style>
            #content{
                width: 80%; 
                margin: auto;
                padding: 40px;
                min-height: 350px;
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
		    <form style="width: 400px" action="login.jsp" method="POST">
                    <fieldset>
                        <legend>Login Form</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>User Name : </td>
                                <td><input type="text" name="userId" required value="nagendra" /></td>
                            </tr>
                            <tr>
                                <td>Password : </td>
                                <td><input type="password" name="password" required value="abc#123" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" value="Login" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                </form>
                <% if(error) {%>
                <h2 style="color: red;">userId or Password is Incorrect.</h2>
                <% } %>
                <br><br>
                <p>
                    <a class="link-style" href="register.jsp">New User : Sign Up</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="link-style" href="forgotpassword.jsp">Forgot Password</a>
                </p>
        </div>

        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>

