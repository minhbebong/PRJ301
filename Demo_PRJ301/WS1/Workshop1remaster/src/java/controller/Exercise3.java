/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;
//import Valid.Number;
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
public class Exercise3 extends HttpServlet {

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
            int n = 0;
            if ((request.getParameter("n").isEmpty())) {
                out.print("Please input c before we proceed");
            } else {
                try {
                    n = Integer.parseInt(request.getParameter("n"));
                } catch (NumberFormatException e) {
                    out.print("Please input the right format(integer number)");
                }
            }
            if (((n < 1) && (n > 100))){
                out.print("Invalid range Input n!");
            }
            String math = request.getParameter("math");
            double result = 0;
            switch (math) {
                case "Tổng n số liên tiếp":
                    for (int i = 1; i < n; i++) {
                        result += i;
                    }
                    out.print("\nTổng " + n + " số liên tiếp là: " + result);
                    break;
                case "Tính n!":
                    result = 1;
//                    if (n == 0 || n == 1) {
//                        out.print("" + n + "! là: " + result);
//                    } else {
                    for (int i = 1; i <= n; i++) {
                        result *= i;
                    }
                    out.print("" + n + "! là: " + result);
                    break;

                case "In dãy lẻ":
                    for (int i = 1; i < n; i += 2) {
                        out.print("\n " + i);
                    }
                    break;
                case "In dãy số chẵn":
                    for (int i = 2; i < n; i += 2) {
                        out.print("\n " + i);
                    }
                    break;
                case "Kiểm tra số nguyên tố":
                    if (n <= 1) {
                        out.print("\n" + n + " Không phải số nguyên tố");
                    }
                    int square = (int) Math.sqrt(n);
                    for (int i = 2; i <= square; i++) {
                        if (n % i == 0) {
                            out.print("\n" + n + " Không phải số nguyên tố");
                        } else {
                            out.print("\n" + n + " là số nguyên tố");
                        }
                    }
                    break;
                default:
                    break;
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
