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
import java.util.List;
import model.Account;
import model.Member;

/**
 *
 * @author Lenovo
 */
public class search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO dao = new DAO();
        List<Account> listde = dao.getAllAccount();
        req.setAttribute("list",listde);
        req.getRequestDispatcher("search.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acc = req.getParameter("acc");
        DAO dao = new DAO();
        List<Member> listmem = dao.getAllMemberByAcc(acc);
        req.setAttribute("listmem", listmem);
        req.setAttribute("acc", acc);
        List<Account> listde = dao.getAllAccount();
        req.setAttribute("list", listde);
        req.getRequestDispatcher("search.jsp").forward(req, resp);
    }

}
