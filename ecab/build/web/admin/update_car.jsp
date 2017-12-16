<%@page import="com.pack.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Admin")) {
        response.sendRedirect("../login.jsp");
    } else {
        String vehicleNumber = request.getParameter("vehicleNumber");
        double fixedCharge = Double.parseDouble(request.getParameter("fixedCharge"));
        double fare = Double.parseDouble(request.getParameter("fare"));
        DBManager.updateCar(vehicleNumber, fixedCharge, fare);
        response.sendRedirect("manage_cars.jsp");
    }
%>