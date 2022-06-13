/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import context.DBContext;
import controller.Divisor;
import controller.Inpputer;
import controller.NPrimeGreaterThanN;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author BachDuc
 */
public class Workshop2_lesson1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Lesson1.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Notice = "";
        String V = request.getParameter("V");
        if (V == null) {
            V = "";
        }
        if (V.equals("RESET")) {
            request.setAttribute("Notice", "");
            request.setAttribute("List", new ArrayList<>());
            request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
        }

        if (Inpputer.InputRegex("IntNum", "\\d+", request.getParameter("Number"))) {
            if (V.equals("  >>  ")) {
                int num = Integer.parseInt(request.getParameter("Number"));
                ArrayList<Integer> list = new Divisor().DiArr(num);
                try {
                    new DBContext().AddNum(num, list);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Workshop2_lesson2.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("Notice", Notice);
                request.setAttribute("List", list);
                request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
            }
            if (V.equals("Check")) {
                ArrayList<Object> list = null;
                try {
                    list = new DBContext().GetNum(Integer.parseInt(request.getParameter("Number")));
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Workshop2_lesson2.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (list == null) {
                    Notice = "No results found";
                }
                request.setAttribute("Notice", Notice);
                request.setAttribute("List", list);
                request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
            }

            //
        } else {
            Notice = "Number Format Error";
            request.setAttribute("Notice", Notice);
            request.getRequestDispatcher("Lesson1.jsp").forward(request, response);
        }
    }

}
