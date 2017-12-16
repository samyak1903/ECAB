package com.pack;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddCarServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") == null) {
            response.sendRedirect("../login.jsp");
        } else if (!session.getAttribute("roleName").toString().equals("Admin")) {
            response.sendRedirect("../login.jsp");
        } else {
            String vehicleNumber = request.getParameter("vehicleNumber");
            String vehicleType = request.getParameter("vehicleType");
            String model = request.getParameter("model");
            int seatingCapacity = Integer.parseInt(request.getParameter("seatingCapacity"));
            int ac = request.getParameter("ac")==null?0:1;
            int musicSystem = request.getParameter("musicSystem")==null?0:1;
            double fixedCharge = Double.parseDouble(request.getParameter("fixedCharge"));
            double fare = Double.parseDouble(request.getParameter("fare"));
            Part p = request.getPart("photo");
            String location = getServletContext().getRealPath("/");
            String photo = FileManager.saveUploadedFile(location, p, vehicleNumber);
            Car car = new Car(vehicleNumber, vehicleType, model, seatingCapacity, ac, musicSystem, fixedCharge, fare, photo);
            DBManager.addCar(car);
            request.getSession().setAttribute("message", "Car is added successfully to the Database");
            response.sendRedirect("admin/manage_cars.jsp");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
