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
 * @author Lenovo
 */
public class Exercise1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static int getAdd(int n){
        int sotachra;
        int s = 0;
        for (int i = 0; i < 10; i++) {
            sotachra = n % 10;
        s += sotachra;
        n /= 10;
        }
        return 0;     
    }
    
    public static int getMul(int n){
        int sotachra;
        int s = 0;
        for (int i = 0; i < 10; i++) {
            sotachra = n % 10;
        s *= sotachra;
        n /= 10;
        }
        return 0;  
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int a = 0;
            int b = 0;
            
                if ( request.getParameter("b") == null  && request.getParameter("a") != null ) {
                    int result;
                    result = getAdd(a);
                    out.print("Result: " + result);
                    out.print("run");
                } else if (request.getParameter("Tru") != null) {
                    int result = a - b;
                    out.print("Result: " + result);
                } else if (request.getParameter("Nhan") != null) {
                    int result = a * b;
                    out.print("Result: " + result);
                } else if (request.getParameter("Chia") != null) {
                    int result = a / b;
                    out.print("Result: " + result);
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