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
public class Lesson3Controller extends HttpServlet {

    public boolean check(String a) {
        boolean check = true;
        int out = 0;
        try {
            out = Integer.parseInt(a);
        } catch (Exception e) {
            check = false;
        }
        if (out <= 3) {
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

    public int getEvenNAdd(int n) {
        int result = 0;
        for (int i = 0; i < n; i++) {
            if (i % 2 == 0) {
                result += i;
            }
        }
        return result;
    }

    public String getListEven(int n) {
        String result = "";
        for (int i = 0; i < n; i++) {
            if (i % 2 == 0) {
                result += i + " ";
            }
        }
        return result;
    }

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Lesson3Controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Lesson3Controller at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String error = "Enter an integer n:";
        if (check(request.getParameter("n"))) {
            int numN = Integer.parseInt(request.getParameter("n"));
            String result = "", resultSum = "";
            if (request.getParameter("check") != null) {
                NumberDAO nd = new NumberDAO();
                iNumber in = nd.getData(numN);
                if (in != null) {
                    result += in.getiNum() + ": " + in.getiResult();
                    request.setAttribute("result", result);
                    request.setAttribute("numN", numN);
                    request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
                } else {
                    error = "No result";
                    request.setAttribute("numN", numN);
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
                }
            }
            if (request.getParameter("move") != null) {
                NumberDAO nd = new NumberDAO();
                result = getListEven(numN);
                iNumber in = nd.getData(numN);
                if (in == null) {
                    try {
                        resultSum += getEvenNAdd(numN) + "";
                        nd.Add(numN, result);
                        request.setAttribute("result", result);
                        request.setAttribute("resultSum", resultSum);
                        request.setAttribute("numN", numN);
                        request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(Lesson3Controller.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    try {
                        nd.update(numN, result);
                        request.setAttribute("result", result);
                        request.setAttribute("resultSum", resultSum);
                        request.setAttribute("numN", numN);
                        request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(Lesson3Controller.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (request.getParameter("load") != null) {
                NumberDAO nd = new NumberDAO();
                result = getListEven(numN);
                iNumber in = nd.getData(numN);
                if (in == null) {
                    try {
                        resultSum += getEvenNAdd(numN) + "";
                        nd.Add(numN, result);
                        request.setAttribute("result", result);
                        request.setAttribute("resultSum", resultSum);
                        request.setAttribute("numN", numN);
                        request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(Lesson3Controller.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    try {
                        nd.update(numN, result);
                        request.setAttribute("result", result);
                        request.setAttribute("resultSum", resultSum);
                        request.setAttribute("numN", numN);
                        request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(Lesson3Controller.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (request.getParameter("reset") != null) {
                request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
            }

        } else {
            try {
                if (Integer.parseInt(request.getParameter("n")) <= 3) {
                    error = "must be >3";
                } else {
                    error = "Invalid output";
                }
            } catch (NumberFormatException e) {
                error = e.getMessage();
//                out.print(error);
                request.setAttribute("error", error);
                request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
            }

            String x = error;
//            out.print(x);
            request.setAttribute("error", x);
            request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
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
