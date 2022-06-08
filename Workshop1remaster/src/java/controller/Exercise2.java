/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author bavan
 */
public class Exercise2 extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int a = 0;
            int b = 0;
            int c = 0;

            if ((request.getParameter("a").isEmpty())) {
                out.print("Please input a before we proceed");
            } else {
                try {
                    a = Integer.parseInt(request.getParameter("a"));
                } catch (NumberFormatException e) {
                    out.print("Please input the right format(integer number)");
                }
            }
            if ((request.getParameter("b").isEmpty())) {
                out.print("Please input b before we proceed");
            } else {
                try {
                    b = Integer.parseInt(request.getParameter("b"));
                } catch (NumberFormatException e) {
                    out.print("Please input the right format(integer number)");
                }
            }
            if ((request.getParameter("c").isEmpty())) {
                out.print("Please input c before we proceed");
            } else {
                try {
                    c = Integer.parseInt(request.getParameter("c"));
                } catch (NumberFormatException e) {
                    out.print("Please input the right format(integer number)");
                }
            }
            if (request.getParameter("find") != null) {
                if (request.getParameter("number").equals("max")) {
                    int max = a;
                    if (a < b) {
                        max = b;
                    }
                    if (a < c) {
                        max = c;
                    }
                    out.print("\nResult: " + max);
                }
                if (request.getParameter("number").equals("min")) {
                    int min = a;
                    if (a > b) {
                        min = b;
                    }
                    if (a > c) {
                        min = c;
                    }
                    out.print("\nResult: " + min);
                }
            }
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