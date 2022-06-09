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
public class Exercise1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Exercise1.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String order = request.getParameter("btn");
        if (order == null) {
            order = "";
        }
        //DOMOOOOOOOOOOOOOOOOOOOOOOOOO
        String a = null;
        String b = null;
        float solution = 0;
        try {
            a = request.getParameter("a").trim();
            b = request.getParameter("b").trim();
            if (order.equals("a+b")) {
                solution = (Float.valueOf(request.getParameter("a")) + Float.valueOf(request.getParameter("b")));
            }
            if (order.equals("a-b")) {
                solution = (Float.valueOf(request.getParameter("a")) - Float.valueOf(request.getParameter("b")));
            }
            if (order.equals("a*b")) {
                solution = (Float.valueOf(request.getParameter("a")) * Float.valueOf(request.getParameter("b")));
            }
            if (order.equals("a/b")) {
                solution = (Float.valueOf(request.getParameter("a")) / Float.valueOf(request.getParameter("b")));
            }
            response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "    <head>\n"
                        + "        <title>TODO supply a title</title>\n"
                        + "        <meta charset=\"UTF-8\">\n"
                        + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                        + "    </head>\n"
                        + "    <body>\n"
                        + "        <div>Thuc Hien Phep Toan</div>\n"
                        + "        <form action=\"Exercise1\" method=\"POST\">\n"
                        + "            Nhap a:<input type=\"text\" name=\"a\" value=\"" + a + "\" /><br>\n"
                        + "            Nhap b:<input type=\"text\" name=\"b\" value=\"" + b + "\" /><br>\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"a+b\" />\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"a-b\" />\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"a*b\" />\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"a/b\" /><br>\n"
                        + "            Ketqua:<input type=\"text\" name=\"c\" value=\" " + solution + "  \" readonly/><br>\n"
                        + "        </form>\n"
                        + "    </body>\n"
                        + "</html>\n"
                        + "");
            }
        } catch (Exception e) {
            try ( PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "    <head>\n"
                        + "        <title>TODO supply a title</title>\n"
                        + "        <meta charset=\"UTF-8\">\n"
                        + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                        + "    </head>\n"
                        + "    <body>\n"
                        + "        <div>Thuc Hien Phep Toan</div>\n"
                        + "        <form action=\"Exercise1\" method=\"POST\">\n"
                        + "            Nhap a:<input type=\"text\" name=\"a\" value=\"\" /><br>\n"
                        + "            Nhap b:<input type=\"text\" name=\"b\" value=\"\" /><br>\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"a+b\" />\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"a-b\" />\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"a*b\" />\n"
                        + "            <input type=\"submit\" name=\"btn\" value=\"a/b\" /><br>\n"
                        + "            Ketqua:<input type=\"text\" name=\"c\" value=\"\" readonly/><br>\n"
                        + "        </form>\n"
                        + "        <div>Loi Format Input!</div>\n"
                        + "    </body>\n"
                        + "</html>\n"
                        + "");
            }
        }

        //DOMOOOOOOOOOOOOOOOOOOOOOOOOO
    }

}
