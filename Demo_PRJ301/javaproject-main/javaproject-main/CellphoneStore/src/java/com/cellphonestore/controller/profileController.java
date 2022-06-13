/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.controller;

import com.cellphonestore.dao.UserDAO;
import com.cellphonestore.function.Functions;
import com.cellphonestore.model.Users;
import java.io.IOException;
import java.io.PrintWriter;
//import java.util.Date;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hongd
 */
@WebServlet(name = "profileController", urlPatterns = {"/profile"})
public class profileController extends HttpServlet {

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
            out.println("<title>Servlet profileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profileController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
//            Users a = (Users)session.getAttribute("user");
//            com.cellphonestore.dao.UserDAO dao = new UserDAO();
//            Users x = dao.findUserByUsername(a.getUsername());
            request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String birthday_raw = request.getParameter("birthday");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Users x = (Users) session.getAttribute("user");

        try {
            com.cellphonestore.function.Functions f = new Functions();
            String birthday = f.myDateFormat(birthday_raw);
            Date date = Date.valueOf(birthday);
//            System.out.println(date);
            Users a = new Users(firstname, lastname, email, phone, address, date, x.getUsername(), x.getPassword(), x.getRole());
            com.cellphonestore.dao.UserDAO dao = new UserDAO();
            dao.updateProfile(a);
            Users lg =dao.login(x.getUsername(), x.getPassword());
            session.setAttribute("user", lg);
//            System.out.println("===Done===");
            request.setAttribute("message", "Cập nhật thành công!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (IOException e) {
            System.out.println("Error: " + e);
        }
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
