/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.controller;

import com.cellphonestore.dao.ProductDAO;
import com.cellphonestore.dao.UserDAO;
import com.cellphonestore.model.OrderDetails;
import com.cellphonestore.model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hongd
 */
@WebServlet(name = "AdminOrderDetailsController", urlPatterns = {"/admin-orderdt"})
public class AdminOrderDetailsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminOrderDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminOrderDetailsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        com.cellphonestore.dao.ProductDAO dao = new ProductDAO();
        com.cellphonestore.dao.UserDAO udao = new UserDAO();
        String oid_raw = request.getParameter("oid");
        String action = request.getParameter("action");
        String uname = request.getParameter("uname");
        try {
            int oid = Integer.parseInt(oid_raw);
            if (action.equals("view")) {
                List<OrderDetails> list = dao.getOrderDetailsById(oid);
                Users a = udao.getUser(uname);
                request.setAttribute("user", a);
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            } 
            else if(action.equals("cf")){
                dao.updateStatus("cf", oid);
                List<OrderDetails> list = dao.getOrderDetailsById(oid);
                Users a = udao.getUser(uname);
                request.setAttribute("user", a);
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            } else{
                dao.updateStatus("cl", oid);
                List<OrderDetails> list = dao.getOrderDetailsById(oid);
                Users a = udao.getUser(uname);
                request.setAttribute("user", a);
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            }

        } catch (IOException | NumberFormatException | ServletException e) {
            System.out.println("PurchaseDetailController_Error: " + e);
        }
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
