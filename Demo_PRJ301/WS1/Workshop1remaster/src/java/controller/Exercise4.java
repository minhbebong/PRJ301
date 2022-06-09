package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Exercise4 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String input = request.getParameter("input");
            String[] arr = input.trim().split("\\s+");

            int[] num = new int[arr.length];
            for (int i = 0; i < arr.length; i++) {
                try {
                    num[i] = Integer.parseInt(arr[i]);
                } catch (NumberFormatException e) {
                    out.print("Wrong format input");
                    return;
                }
            }
            int Choice = 0;
            try {
                Choice = Integer.parseInt(request.getParameter("Choice"));
            } catch (NumberFormatException e) {
                out.print("Please choose a method before we continue!");
                return;
            }
            switch (Choice) {
                case 1:
                    out.print("<br>Mảng đã nhập: " + input);
                    break;
                case 2:
                    int sum = 0;
                    for (int i = 0; i < num.length; i++) {
                        if (num[i] % 2 == 1) {
                            sum += num[i];
                        }
                    }
                    out.print("<br>Tổng lẻ:  " + sum);
                    break;
                case 3:
                    int mul = 1;
                    for (int i = 0; i < num.length; i++) {
                        if (num[i] % 2 == 0) {
                            mul *= num[i];
                        }
                    }
                    out.print("<br>Tích chẵn:  " + mul);
                    break;
                case 4:
                    int temp = 0;
                    for (int i = 0; i < num.length; i++) {
                        for (int j = 1; j < num.length - i; j++) {
                            if (num[j - 1] > num[j]) {
                                temp = num[j - 1];
                                num[j - 1] = num[j];
                                num[j] = temp;
                            }
                        }
                    }
                    String result = "";
                    for (int i = 0; i < num.length; i++) {
                       result = result + " " + num[i];
                    }
                    out.print("<br>Mảng đã sắp xếp theo chiều tăng dần: " + result);
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
