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
            <br>
            <%
                if(session.getAttribute("message")!=null){
            %>
            <h2 style="color: green;"><%= session.getAttribute("message")%> </h2>
            <%
                session.removeAttribute("message");
                }
            %>
            <form action="../addCar" enctype="multipart/form-data" method="POST" style="width: 500px;">
                <fieldset>
                    <legend>Add New Car</legend>
                <table border="0" cellpadding="5">
                    <tbody>
                        <tr>
                            <td>Vehicle Number : </td>
                            <td><input type="text"  name="vehicleNumber" /></td>
                        </tr>
                        <tr>
                            <td>Vehicle Type : </td>
                            <td>
                                <select name="vehicleType">
                                    <option>Small</option>
                                    <option>Sedan</option>
                                    <option>SUV</option>
                                </select>
                            </td>
                        </tr>  
                        <tr>
                            <td>Model : </td>
                            <td><input type="text"  name="model" /></td>
                        </tr>
                        <tr>
                            <td>Seating Capacity : </td>
                            <td><input type="text"  name="seatingCapacity" /></td>
                        </tr>
                        <tr>
                            <td>AC : </td>
                            <td><input type="checkbox" name="ac" value="1" /></td>
                        </tr>
                        <tr>
                            <td>Music System : </td>
                            <td><input type="checkbox" name="musicSystem" value="1" /></td>
                        </tr> 
                        <tr>
                            <td>Fixed Charge : </td>
                            <td><input type="text" name="fixedCharge" /></td>
                        </tr>
                        <tr>
                            <td>Fare (Rs/Km) : </td>
                            <td><input type="text" name="fare" /></td>
                        </tr>
                        <tr>
                            <td>Photo : </td>
                            <td><input type="file" name="photo" /></td>
                        </tr>                       
                        <tr>
                            <td colspan="2" align="right">
                                <input type="submit" name="submit" value="Add Car" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                </fieldset>
            </form>
        </div>
        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>
<% } %>