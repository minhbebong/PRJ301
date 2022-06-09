/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author BachDuc
 */
public class Exercise2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Exercise2.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        float a = 0;
        float b = 0;
        float c = 0;
        float solution = 0;
        String Notice = "";
        try {
            if ((request.getParameter("choice") == null)) {
                Notice += "You Have Not Choice !\n";
            }
            if ((request.getParameter("a").isEmpty())) {
                Notice += "You Have not input a !\n";
            } else {
                try {
                    a = Float.parseFloat(request.getParameter("a"));
                } catch (Exception e) {
                    Notice += "Loi Format input a\n";
                }
            }
            if ((request.getParameter("b").isEmpty())) {
                Notice += "You Have not input b !\n";
            } else {
                try {
                    b = Float.parseFloat(request.getParameter("b"));
                } catch (Exception e) {
                    Notice += "Loi Format input b\n";
                }
            }
            if ((request.getParameter("c").isEmpty())) {
                Notice += "You Have not input c !\n";
            } else {
                try {
                    c = Float.parseFloat(request.getParameter("c"));
                } catch (Exception e) {
                    Notice += "Loi Format input b\n";
                }
            }
            float arr[] = {a, b, c};
            solution = arr[0];
            if (request.getParameter("choice").equals("max")) {
                for (int i = 0; i < arr.length; i++) {
                    if (arr[i] > solution) {
                        solution = arr[i];
                    }
                }
            }
            if (request.getParameter("choice").equals("min")) {
                for (int i = 0; i < arr.length; i++) {
                    if (arr[i] < solution) {
                        solution = arr[i];
                    }
                }
            }
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
                        + "        <div>Tim Max va Min</div>\n"
                        + "        <form  style=\"display: block;\" action=\"Exercise2\" method=\"POST\">\n"
                        + "            Nhap a:<input class=\"in\" type=\"text\" name=\"a\" value=\"" + a + "\" /><br>\n"
                        + "            Nhap b:<input class=\"in\" type=\"text\" name=\"b\" value=\"" + b + "\" /><br>\n"
                        + "            Nhap c:<input class=\"in\" type=\"text\" name=\"c\" value=\"" + c + "\" /><br>\n"
                        + "            Ketqua:<input class=\"in\" type=\"text\" name=\"soluion\" value=\"" + solution + "\" readonly/><br>\n"
                        + "            Tim Max<input type=\"radio\" id=\"1\" name=\"choice\" value=\"max\">\n"
                        + "            Tim Min<input type=\"radio\" id=\"1\" name=\"choice\" value=\"min\"><br>\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"Tim\" />\n"
                        + "            <input style=\"display: inline-block;\" type=\"button\" name=\"btn\" value=\"Xoa\" onclick=\"reset()\"/><br>\n"
                        + "        </form>\n"
                        + "        \n"
                        + "        <script>\n"
                        + "            function reset(){\n"
                        + "                document.getElementsByClassName('in')[0].value=\"\";\n"
                        + "                document.getElementsByClassName('in')[1].value=\"\";\n"
                        + "                document.getElementsByClassName('in')[2].value=\"\";\n"
                        + "                document.getElementsByClassName('in')[3].value=\"\";\n"
                        + "            }\n"
                        + "            \n"
                        + "        </script>\n"
                        + "    </body>\n"
                        + "</html>\n"
                        + "");

            }
        } catch (Exception e) {
            response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out1 = response.getWriter()) {
                out1.println("<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "    <head>\n"
                        + "        <title>TODO supply a title</title>\n"
                        + "        <meta charset=\"UTF-8\">\n"
                        + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                        + "    </head>\n"
                        + "    <body>\n"
                        + "        <div>Tim Max va Min</div>\n"
                        + "        <form  style=\"display:block;\" action=\"Exercise2\" method=\"POST\">\n"
                        + "            Nhap a:<input class=\"in\" type=\"text\" name=\"a\" value=\"\" /><br>\n"
                        + "            Nhap b:<input class=\"in\" type=\"text\" name=\"b\" value=\"\" /><br>\n"
                        + "            Nhap c:<input class=\"in\" type=\"text\" name=\"c\" value=\"\" /><br>\n"
                        + "            Ketqua:<input class=\"in\" type=\"text\" name=\"soluion\" value=\"\" readonly/><br>\n"
                        + "            Tim Max<input type=\"radio\" id=\"1\" name=\"choice\" value=\"max\">\n"
                        + "            Tim Min<input type=\"radio\" id=\"1\" name=\"choice\" value=\"min\"><br>\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"Tim\" />\n"
                        + "            <input style=\"display: inline-block;\" type=\"button\" name=\"btn\" value=\"Xoa\" onclick=\"reset()\"/><br>\n"
                        + "        </form>\n"
                        + "        \n"
                        + "        <script>\n"
                        + "            function reset(){\n"
                        + "                document.getElementsByClassName('in')[0].value=\"\";\n"
                        + "                document.getElementsByClassName('in')[1].value=\"\";\n"
                        + "                document.getElementsByClassName('in')[2].value=\"\";\n"
                        + "                document.getElementsByClassName('in')[3].value=\"\";\n"
                        + "            }\n"
                        + "            \n"
                        + "        </script>\n"
                        + "<textarea name=\"textarea\" id=\"textarea\" cols=\"20\" rows=\"10\" readonly >" + Notice + "</textarea>"
                        + "    </body>\n"
                        + "</html>\n"
                        + "");
            }
        }

    }
}
