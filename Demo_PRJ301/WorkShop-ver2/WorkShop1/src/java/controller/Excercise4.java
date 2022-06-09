package controller;

import core.IsNumber;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author BachDuc
 */
public class Excercise4 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Exercise4.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //HEAD
        String choice = null;
        String Nmang = null;
        String Notice = "";
        String form_Input = "";
        String solution = "";
        ArrayList<Integer> list;
        choice = request.getParameter("Choice");
        Nmang = request.getParameter("Nmang");
        list = new ArrayList<>();
        if (request.getParameter("Nmang") != null && request.getParameter("arr0") != null) {
            for (int i = 0; i < Integer.valueOf(Nmang); i++) {
                try {
                    list.add(Integer.valueOf(request.getParameter("arr" + String.valueOf(i))));
                } catch (Exception e) {
                    Notice += "Wrong format text: " + "arr" + String.valueOf(i) + "\n";
                }
            }
            request.getServletContext().setAttribute("list", list);
        }
        if (Nmang == null) {
            Nmang = "";
        }
        //HEAD
        //DEMOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
        if (choice.equals("nhapmang")) {
            String box_input = "";
            if (!Nmang.isEmpty()) {
                if (IsNumber.isNumeric(Nmang) == false) {
                    Notice += "Invalid Format amount array!";
                } else {
                    for (int i = 0; i < Integer.valueOf(Nmang); i++) {
                        box_input += ("<div style=\"display: inline-block;\">" + i + ":" + "</div>\n" + "<input style=\"display: block;\" type=\"text\" name=\"" + "arr" + i + "\" value=\"\">");
                    }
                }
            } else {
                Notice += "You have not input amount array !";
            }
            form_Input = "<form action=\"Excercise4\" method=\"POST\">\n"
                    + "            <input type=\"text\" name=\"Choice\" value=\"nhapmang\" hidden>\n"
                    + "        <div style=\"display: inline-block;\">Nhap N Mang</div>\n"
                    + "        <input style=\"display: block;\" type=\"text\" name=\"Nmang\" value=\"" + Nmang + "\">\n"
                    + "            <input type=\"submit\" name=\"btn\" value=\"Submit_Amount_Array\" />\n"
                    + "        </form>\n"
                    + "<div style=\"display:block;\" id=\"insert_form\">" + "<form action=\"Excercise4\" method=\"POST\">" + box_input + "<input type=\"submit\" name=\"\" value=\"Insert\" onclick=\"\" />" + "<input  type=\"text\" name=\"Choice\" value=\"nhapmang\" hidden=\"\">" + "<input  type=\"text\" name=\"Nmang\" value=\"" + Nmang + "\" hidden=\"\">" + "</form>" + "</div>";
            if (Notice.isEmpty()) {
                Notice = "Success Action!";
            }
        }
        if (choice.equals("inmang")) {
            ArrayList<Integer> list_inmang = (ArrayList<Integer>) request.getServletContext().getAttribute("list");
            solution = "Mang Rong !";
            if (list_inmang != null) {
                solution = list_inmang.toString();
            }
            if (Notice.isEmpty()) {
                Notice = "Success Action!";
            }
        }
        if (choice.equals("tongle")) {
            ArrayList<Integer> list_inmang = (ArrayList<Integer>) request.getServletContext().getAttribute("list");
            solution = "Mang Rong !";
            int total = 0;
            if (list_inmang != null) {
                for (int i = 0; i < list_inmang.size(); i++) {
                    if (list_inmang.get(i) % 2 != 0) {
                        total += list_inmang.get(i);
                    }
                }
                solution = String.valueOf(total);
            }
            if (Notice.isEmpty()) {
                Notice = "Success Action!";
            }
        }
        if (choice.equals("tichchan")) {
            ArrayList<Integer> list_inmang = (ArrayList<Integer>) request.getServletContext().getAttribute("list");
            solution = "Mang Rong !";
            int total = 1;
            if (list_inmang != null) {
                for (int i = 0; i < list_inmang.size(); i++) {
                    if (list_inmang.get(i) % 2 == 0) {
                        total *= list_inmang.get(i);
                    }
                }
                solution = String.valueOf(total);
            }
            if (Notice.isEmpty()) {
                Notice = "Success Action!";
            }
        }
        if (choice.equals("sapxep")) {
            ArrayList<Integer> list_sever = (ArrayList<Integer>) request.getServletContext().getAttribute("list");
            solution = "Mang Rong !";
            if (list_sever != null) {
                ArrayList<Integer> list_inmang =(ArrayList<Integer>) list_sever.clone();
                Collections.sort(list_inmang, new Comparator<Integer>() {
                    @Override
                    public int compare(Integer o1, Integer o2) {
                        return o1 - o2;
                    }
                });
                solution = list_inmang.toString();
            }
            if (Notice.isEmpty()) {
                Notice = "Success Action!";
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
                    + "        <div>Cac Thao Tac Voi Mang</div>\n"
                    + "        <div>Ket qua</div>\n"
                    + "        <textarea name=\"textarea\" id=\"textarea\" cols=\"20\" rows=\"10\" readonly>" + solution + "</textarea>\n"
                    + "        <form action=\"Excercise4\" method=\"POST\">\n"
                    + "           <input type=\"radio\" name=\"Choice\" value=\"nhapmang\"> Nhapmang\n"
                    + "            <input type=\"radio\" name=\"Choice\" value=\"inmang\">Inmang\n"
                    + "            <input type=\"radio\" name=\"Choice\" value=\"tongle\">Tongle\n"
                    + "            <input type=\"radio\" name=\"Choice\" value=\"tichchan\">Tichchan\n"
                    + "            <input type=\"radio\" name=\"Choice\" value=\"sapxep\">Sapxep<br>\n"
                    + "            <input type=\"submit\" name=\"btn\" value=\"Thuchien\" onclick=\"checkRadio(this.form)\" />\n"
                    + "        </form>\n"
                    //Addition Script
                    + "        <script>"
                    + "            function checkRadio(myform) {\n"
                    + "                }\n"
                    + "for (var i = 0, max = 5; i < max; i++) {\n"
                    + "                    if (document.getElementsByName(\"Choice\")[i].value == \"" + choice + "\") {\n"
                    + "                        document.getElementsByName(\"Choice\")[i].checked = \"true\";\n"
                    + "                    }\n"
                    + "                    }\n"
                    + "\n"
                    + "        </script>\n"
                    //Addition Script
                    + "    </body>\n"
                    + "</html>\n"
                    + "");
            out.println(form_Input);
            out.println("<textarea name=\"textarea\" id=\"textarea\" cols=\"20\" rows=\"10\" readonly >" + Notice + "</textarea>");
        }
    }
}
