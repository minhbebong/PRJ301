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
import java.util.ArrayList;
import model.Author;
import model.Paper;

/**
 *
 * @author Lenovo
 */
public class SearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO dao = new DAO();
        ArrayList<Author> authors = dao.getAuthors();
        req.setAttribute("authors", authors);
        req.getRequestDispatcher("SearchView.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String raw_authorId = req.getParameter("authorid");
        req.setAttribute("raw_authorId", raw_authorId);
        DAO dao = new DAO();
        ArrayList<Author> authors = dao.getAuthors();
        req.setAttribute("authors", authors);
        ArrayList<Paper> papers = dao.getPapers(Integer.parseInt(raw_authorId));
        req.setAttribute("papers", papers);
        req.getRequestDispatcher("SearchView.jsp").forward(req, resp);
    }

}
