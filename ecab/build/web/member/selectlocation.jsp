<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
        String vehicleNumber = request.getParameter("vehicleNumber");
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
        <link href="../styles/smoothness/jquery-ui-1.9.2.custom.css" rel="stylesheet">
        <script src="../js/jquery-1.8.3.js"></script>
        <script src="../js/jquery-ui-1.9.2.custom.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker({
                    inline: true, dateFormat: 'd-M-yy', changeMonth: true, changeYear: true
                });
            });
        </script> 
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
            <form action="bookcar.jsp" method="post">
                <table cellpadding="10">
                    <tr>
                        <td>Select Date : </td>
                        <td>
                            <input type="text" name="travelDate" id="datepicker" readonly></td>
                        </td>
                    </tr>
                    <tr>
                        <td>Source City : </td>
                        <td>
                            <select name="source">
                                <option>Select Source</option>
                                <option>Dehradun</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Destination City : </td>
                        <td>
                            <select name="destination">
                                <option>Select Destination</option>
                                <%
                                    ArrayList<Location> list = DBManager.getLocations("Dehradun");
                                    for (Location l : list) {
                                %>
                                <option><%= l.getDestination()%></option>
                                <% }%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <input type="submit"  value="Continue" />
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="vehicleNumber" value="<%= vehicleNumber%>">                
            </form>
        </div>
        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>

<%
    }
%>