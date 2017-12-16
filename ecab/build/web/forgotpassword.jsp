<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int template=1;
    String userName="";
    String secretQuestion = "";
    String errorMessage = "";
    String password = "";
    if(request.getMethod().equals("POST")){
        if(request.getParameter("button1")!=null){
            userName = request.getParameter("userName");
            if(!DBManager.isUserExists(userName)){
                errorMessage = "User Name does not exist";
                template=1;
            }else{
                secretQuestion = DBManager.getSecretQuestion(userName);
                template=2;
            }
        }
        if(request.getParameter("button2")!=null){
            userName = request.getParameter("userName");
            secretQuestion = request.getParameter("secretQuestion");
            String answer = request.getParameter("answer");
            if(!DBManager.isAnswerCorrect(userName, secretQuestion, answer)){
                errorMessage = "The answer is not Correct";
                template=2;
            }else{
                password = DBManager.resetPassword(userName);
                //MailManager.sendPasswordMail(email,password);
                template = 3;
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
                <% if(template==1) { %>
                <form style="width: 400px" action="forgotpassword.jsp" method="POST">
                    <fieldset>
                        <legend>Enter your username</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>User Name : </td>
                                <td><input type="text" name="userName" required value="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" name="button1" value="Continue" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                </form>
                <% if(!errorMessage.equals("")){%>
                    <h2 style="color: red;"><%= errorMessage%></h2>
                <% } %>
                <% } %>
                <% if(template==2) { %>
                <form style="width: 400px" action="forgotpassword.jsp" method="POST">
                    <fieldset>
                        <legend>Answer the Following Question</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>Secret Question : </td>
                                <td><textarea name="secretQuestion" readonly rows="4" cols="30"><%= secretQuestion%></textarea></td>
                            </tr>
                            <tr>
                                <td>Answer : </td>
                                <td><input type="text" name="answer" required value="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" name="button2" value="Get Password" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                            <input type="hidden" name="userName" value="<%= userName%>">
                </form> 
                <% if(!errorMessage.equals("")){%>
                    <h2 style="color: red;"><%= errorMessage%></h2>
                <% } %>
                <% } %>
                <% if(template==3) { %>
                    <h2>Your password has been successfully Updated.</h2>
                    <h3>UserName : <%=userName%></h3>
                    <h3>Password : <%=password%></h3>
                    <p>
                    <a class="link-style" href="login.jsp">Login</a>
                    </p>
                <% } %>

        </div>

        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>

