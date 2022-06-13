/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import context.DBContext;
import controller.Inpputer;
import controller.NPrimeGreaterThanN;
import controller.isEvent;
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
public class Workshop2_lesson3 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Lesson3.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String result = "";
        String btn = request.getParameter("btn");
        if (btn == null) {
            btn = "";
        }
        if (btn.equals("RESET")) {
            request.setAttribute("n", "");
            request.setAttribute("result", "");
            request.setAttribute("sum", "");
            request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
        }
        if (Inpputer.InputRegex("IntNum", "\\d+", request.getParameter("n"))) {
            if (btn.equals("  >>  ")) {
                ArrayList<Integer> list = new ArrayList<>();
                int n = Integer.parseInt(request.getParameter("n"));
                for (int i = 0; i < n; i++) {
                    if (new isEvent().isEven(i)) {
                        list.add(i);
                    }
                }
                try {
                    new DBContext().AddNum(n, list);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Workshop2_lesson3.class.getName()).log(Level.SEVERE, null, ex);
                }
                result = list.toString();
                request.setAttribute("result", result);
                int sum = 0;
                for (int i = 0; i < list.size(); i++) {
                    sum += list.get(i);
                }
                request.setAttribute("sum", sum);
                request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
            }

            if (btn.equals("Check")) {
                try {
                    if (new DBContext().GetNum(Integer.parseInt(request.getParameter("n"))) == null) {
                        result = "Not Found";
                    } else {
                        result = new DBContext().GetNum(Integer.parseInt(request.getParameter("n"))).toString();
                        ArrayList<Object> list = new DBContext().GetNum(Integer.parseInt(request.getParameter("n")));
                        int sum = 0;
                        System.out.println(sum);
                        for (int i = 0; i < list.size(); i++) {
                            int nNum = Integer.parseInt(((String) list.get(i)).trim());
                            sum += nNum;
                        }
                        request.setAttribute("sum", sum);
                    }
                    request.setAttribute("result", result);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Workshop2_lesson3.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
            }

        } else {
            result = "SAI FORMAT";
            request.setAttribute("result", result);
            request.setAttribute("n", request.getParameter("n"));
            request.getRequestDispatcher("Lesson3.jsp").forward(request, response);
        }
    }
}
