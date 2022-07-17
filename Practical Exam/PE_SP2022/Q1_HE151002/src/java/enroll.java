
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Lenovo
 */
public class enroll extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String Name = req.getParameter("name");
            String fs = req.getParameter("fs");
            String lev = req.getParameter("lev");
            String date = req.getParameter("doe");
            PrintWriter out = resp.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Enroll</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Student Name: " + Name + "</h1>");
            out.println("<h1>Financial Source: " + fs + "</h1>");
            out.println("<h1>Level: " + lev + "</h1>");
            out.println("<h1>DOE: " + date + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
        }
        req.getRequestDispatcher("index.html").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("index.html").forward(req, resp);
    }

}
