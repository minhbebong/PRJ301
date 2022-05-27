/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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
public class Information extends HttpServlet {

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

            out.println("<title>Student information</title>");

            out.println("</head>");

            out.println("<body>");

            out.println("<form method =\"get\">");

            out.println("StudentID: <input type = \"text\" name =\"ID\">");

            out.println("<br>Fullname: <input type =\"text\" name =\"fullname\" >\n"
                    + " <br><select style = \"display:inline-block;\" onchange=\"submit\" name=\"select\">\n"
                    + " <option>Gender</option>\n"
                    + " <option name=\"M\">Male</option>\n"
                    + " <option name=\"N\">Female</option>\n"
                    + " </select>\n"
                    + " <br><input type='submit'>");

            String ID = request.getParameter("ID");

            String fullname = request.getParameter("fullname");

            out.print("<br>Student ID: " + ID);

            out.print("<br>Fullname: " + fullname);

            switch (request.getParameter("select")) {

                case "Male":

                    out.print("<br>Gender: Male");

                    break;

                case "Female":

                    out.print("<br>Gender: Female");

                    break;

                default:

                    out.print("<br>no gender choose");
                    out.println("</body>");
                    out.println("</html>");
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Student information</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<form method =\"POST\">");
                    out.println("StudentID: <input type = \"text\" name =\"ID\">");
                    out.println("<br>Fullname: <input type =\"text\" name =\"fullname\" >\n"
                            + " <br><select style = \"display:inline-block;\" onchange=\"submit\" name=\"select\">\n"
                            + " <option>Gender</option>\n"
                            + " <option name=\"M\">Male</option>\n"
                            + " <option name=\"N\">Female</option>\n"
                            + " </select>\n"
                            + " <br><input type='submit'>");

                    out.print("<br>Student ID: " + ID);

                    out.print("<br>Fullname: " + fullname);

                    switch (request.getParameter("select")) {

                        case "Male":

                            out.print("<br>Male");

                            break;

                        case "Female":

                            out.print("<br>Female");

                            break;

                        default:

                            out.print("<br>no gender choose");

                            out.println("</body>");

                            out.println("</html>");

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
