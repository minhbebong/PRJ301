/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

//import Valid.Character;
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
public class Exercise5 extends HttpServlet {

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
            String String = request.getParameter("String").trim();
            if (String.isEmpty()) {
                out.print("Please enter string before we begin");
                return;
            } else {
                out.print("String have:" + String.length()+" indexes");
            }

            //text position
            int index = 0;
            try {
                index = Integer.parseInt(request.getParameter("index"));
            } catch (NumberFormatException e) {
            }
            if (index < 1 || index > String.length()) {
                out.print("<br> Index not exist please enter agian.");
            } else {
                out.print("<br> Word stay in position " + index + " is: '" + String.charAt(index - 1) + "'");
            }
            //Phần tìm vị trí chuỗi
            String string = request.getParameter("string");
            String ret = "";
            if (string.isEmpty()) {
                out.print("<br> Please input string");
            } else {
                if (String.contains(string)) {
                    if (string.length() == 1) {
                        for (int i = 0; i < String.length(); i++) {
                            if (String.charAt(i) == string.charAt(0)) {
                                ret = ret + " | " + (i + 1);
                            }
                        }
                    } else {
                        for (int i = 0; i < String.length() - string.length(); i++) {
                            if (String.substring(i, i + string.length()).equalsIgnoreCase(string)) {
                                ret = ret + " | " + (i + 1) + " đến " + (i + string.length());
                            }
                        } 
                    }
                    out.print("<br> String input stays in: " + ret + " |");
                } else {
                    out.print("<br> String does not exist");
                }
            }
            //Phần tách chuỗi
            int min = 0, max = 0;
            try {
                min = Integer.parseInt(request.getParameter("min"));
                max = Integer.parseInt(request.getParameter("max"));
                if (min < 1 || max < 1) {
                    out.print("<br> min and max have to bigger than 1");
                    return;
                }
                if (min > max) {
                    out.print("<br> of course min cannot bigger than max right?");
                    return;
                }
                if (max > (String.length() + 1)) {
                    max = String.length() + 1;
                }
                ret = String.substring(min - 1, max);
                out.print("<br> String after split: " + ret);
            } catch (Exception e) {
                out.print("<br> Wrong format min max");
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
