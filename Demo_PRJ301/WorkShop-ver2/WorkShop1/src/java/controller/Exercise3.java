/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import core.Check_realNumber;
import core.IsNumber;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;

/**
 *
 * @author BachDuc
 */
public class Exercise3 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Exercise3.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String select = null;
        int num = 0;
        String solution = "";
        ArrayList<Integer> list = null;
        String Notice = "";
        try {
            if (request.getParameter("n").isEmpty()) {
                Notice += "You Have Not Input n !";
                num = Integer.valueOf(request.getParameter("n"));
            } else if (IsNumber.isNumeric(request.getParameter("n")) == false) {
                Notice += "Format Input n loi!";
                num = Integer.valueOf(request.getParameter("n"));
            }

            num = Integer.valueOf(request.getParameter("n"));
            if (((num >= 1) && (num <= 100)) == false) {
                Notice += "Invalid range Input n!";
                num = Integer.valueOf(" ");
            }

            select = request.getParameter("Select");
            list = new ArrayList<>();
            for (int i = 1; i <= num; i++) {
                list.add(i);
            }
            if (select.equals("tong")) {
                int count = 0;
                for (int i = 0; i < list.size(); i++) {
                    count += list.get(i);
                }
                solution = String.valueOf(count);
            }
            if (select.equals("n!")) {
                long count = 1;
                for (int i = 0; i < list.size(); i++) {
                    count *= list.get(i);
                }
                if (count == 0 || count > Long.MAX_VALUE) {
                    solution = "OUT OF LONG TYPE DATA RANGE";
                } else {
                    solution = String.valueOf(count);
                }
            }
            if (select.equals("le")) {
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i) % 2 != 0) {
                        solution += String.valueOf(list.get(i)) + " ";
                    }
                }
            }
            if (select.equals("chan")) {
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i) % 2 == 0) {
                        solution += String.valueOf(list.get(i)) + " ";
                    }
                }
            }
            if (select.equals("nguyen")) {
                for (int i = 0; i < list.size(); i++) {
                    Check_realNumber Check_core = new Check_realNumber();
                    if (Check_core.check_real_integer_number(list.get(i)) == 1) {
                        solution += String.valueOf(list.get(i)) + " ";
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
                        + "        <div>Thuc hien phep toan</div>\n"
                        + "        <form action=\"Exercise3\" method=\"POST\">\n"
                        + "            Nhap n:<input class=\"in\" type=\"text\" name=\"n\" value=\"" + num + "\" />(1<<div style=\"display:inline-block;\">n</div style=\"\"><100)<br>\n"
                        + "            Chon phep toan:\n"
                        + "            <select name=\"Select\" id=\"Select\" onchange=\"this.form.submit()\">\n"
                        + "                <option value=\"default\" selected hidden>Select</option>\n"
                        + "                <option value=\"tong\">Tong n so lien tiep</option>\n"
                        + "                <option value=\"n!\">Tinh n!</option>\n"
                        + "                <option value=\"le\">In day le</option>\n"
                        + "                <option value=\"chan\">In day so chan</option>\n"
                        + "                <option value=\"nguyen\">Kiem tra so nguyen to</option>\n"
                        + "            </select>\n"
                        + "            <br>\n"
                        + "            Ket qua:<input class=\"in\" type=\"text\" name=\"n\" value=\"" + solution + "\" readonly/><br>\n"
                        + "        </form>\n"
                        + "    </body>\n"
                        + "</html>");

            }

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
                        + "        <div>Thuc hien phep toan</div>\n"
                        + "        <form action=\"Exercise3\" method=\"POST\">\n"
                        + "            Nhap n:<input class=\"in\" type=\"text\" name=\"n\" value=\"\" />(1<<div style=\"display:inline-block;\">n</div style=\"\"><100)<br>\n"
                        + "            Chon phep toan:\n"
                        + "            <select name=\"Select\" id=\"Select\" onchange=\"this.form.submit()\">\n"
                        + "                <option value=\"default\" selected hidden>Select</option>\n"
                        + "                <option value=\"tong\">Tong n so lien tiep</option>\n"
                        + "                <option value=\"n!\">Tinh n!</option>\n"
                        + "                <option value=\"le\">In day le</option>\n"
                        + "                <option value=\"chan\">In day so chan</option>\n"
                        + "                <option value=\"nguyen\">Kiem tra so nguyen to</option>\n"
                        + "            </select>\n"
                        + "            <br>\n"
                        + "            Ket qua:<input class=\"in\" type=\"text\" name=\"n\" value=\"\" readonly/><br>\n"
                        + "            <div>" + Notice + "</div>"
                        + "        </form>\n"
                        + "    </body>\n"
                        + "</html>");
            }
        }
    }

}
