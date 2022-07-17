/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import model.Author;
import model.Paper;

/**
 *
 * @author Lenovo
 */
public class AddController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO dao = new DAO();
        ArrayList<Author> authors = dao.getAuthors();
        req.setAttribute("authors", authors);
        req.getRequestDispatcher("AddView.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String raw_paperid = req.getParameter("paperid");
        String raw_title = req.getParameter("title");
        String raw_date = req.getParameter("date");
        
        Paper p = new Paper();
        p.setId(Integer.parseInt(raw_paperid));
        p.setTitle(raw_title);
        p.setPublished(Date.valueOf(raw_date));
        DAO dao = new DAO();
        dao.setPaper(p);
        String[] raw_authorids = req.getParameterValues("authorid");
        for (String raw_authorid : raw_authorids) {
            dao.setAuthorPaper(Integer.parseInt(raw_authorid), 
                    Integer.parseInt(raw_paperid));
        }
    }

}
