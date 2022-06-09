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
 * @author BachDuc
 */
public class Exercise6 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Exercise6.html");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int a = 0;
        int b = 0;
        try {
            a = Integer.parseInt(request.getParameter("a"));
            b = Integer.parseInt(request.getParameter("b"));
        } catch (Exception e) {
            response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "    <head>\n"
                    + "        <title>TODO supply a title</title>\n"
                    + "        <meta charset=\"UTF-8\">\n"
                    + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    </head>\n"
                    + "    <body>\n"
                    + "        <div>Giai Phuong Trinh Bac Nhat</div>\n"
                    + "        <form action=\"Exercise6\" method=\"POST\">\n"
                    + "            <div style=\"display: inline-block;\">Nhap a:</div><input type=\"text\" name=\"a\" value=\"\" ><br>\n"
                    + "            <div style=\"display: inline-block;\">Nhap b:</div><input type=\"text\" name=\"b\" value=\"\" ><br>\n"
                    + "            <input type=\"submit\"  value=\"GiaiPT\"/><br> \n"
                    + "            \n"
                    + "        </form>\n"
                    + "    </body>\n"
                    + "</html>");
             out.println("Loi Format");
        }
        }

        String c;
        //core
        if (a == 0) {
            if (b == 0) {
                c = ("Phương trình này có vô số nghiệm.");
            } else {
                c = ("Phương trình vô nghiệm.");
            }
        } else {
            c = "Phuong trinh co nghiem x = " + String.valueOf((double) -b / a);
        }
        //
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "    <head>\n"
                    + "        <title>TODO supply a title</title>\n"
                    + "        <meta charset=\"UTF-8\">\n"
                    + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    </head>\n"
                    + "    <body>\n"
                    + "        <div>Giai Phuong Trinh Bac Nhat</div>\n"
                    + "        <form action=\"Exercise6\" method=\"POST\">\n"
                    + "            <div style=\"display: inline-block;\">Nhap a:</div><input type=\"text\" name=\"a\" value=\"" + a + "\" ><br>\n"
                    + "            <div style=\"display: inline-block;\">Nhap b:</div><input type=\"text\" name=\"b\" value=\"" + b + "\" ><br>\n"
                    + "            <input type=\"submit\"  value=\"GiaiPT\"/><br> \n"
                    + "            \n"
                    + "        </form>\n"
                    + "        <div>Ket Qua</div>\n"
                    + "        <div>" + c + "</div>\n"
                    + "    </body>\n"
                    + "</html>");
        }

    }

}
