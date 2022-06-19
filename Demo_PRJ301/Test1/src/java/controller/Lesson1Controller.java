/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import db.NumberDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.iNumber;

/**
 *
 * @author Admin
 */
public class Lesson1Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public boolean check(String a) {
        boolean check = true;
        int out = 0;
        try {
            out = Integer.parseInt(a);
        } catch (Exception e) {
            check = false;
        }
        return check;
    }

    public boolean checkPrime(int n) {
        if (n <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NumController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NumController at " + request.getContextPath() + "</h1>");
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
        String error = "Enter an integer n:";
        PrintWriter out = response.getWriter();
        if (check(request.getParameter("num_n"))) {
            if (Integer.parseInt(request.getParameter("num_n")) <= 0) {
                error = "n must > 0";
            } else {
                int numN = Integer.parseInt(request.getParameter("num_n"));
                String result = "";
                for (int i = 1; i <= numN; i++) {
                    if (numN % i == 0 && checkPrime(i) && i < 10) {
                        result += i + " ";
                    }
                }
                result = result.trim();
                if (request.getParameter("show") != null) {
                    NumberDAO nd = new NumberDAO();
                    iNumber in = nd.getData(numN);
                    if (in != null) {
                        result = in.getiNum() + ": " + in.getiResult();
                        request.setAttribute("numN", numN);
                        request.setAttribute("result", result);
                        request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
                    } else {
                        error = "No result";
                        request.setAttribute("numN", numN);
                        request.setAttribute("error", error);
                        request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
                    }
                }
                if (request.getParameter("Add") != null) {
                    try {
                        NumberDAO db = new NumberDAO();
                        iNumber in = db.getData(numN);
                        if (in == null) {
                            db.Add(numN, result);
                        } else {
                            db.update(numN, result);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(Lesson1Controller.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (request.getParameter("reset") != null) {
                    request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
                }
                request.setAttribute("numN", numN);
                request.setAttribute("result", result);
            }
            request.setAttribute("error", error);
            request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
        } else {
            try {
                Integer.parseInt(request.getParameter("num_n"));

            } catch (NumberFormatException e) {
                error = e.getMessage();
            }
            request.setAttribute("error", error);
            request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
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
