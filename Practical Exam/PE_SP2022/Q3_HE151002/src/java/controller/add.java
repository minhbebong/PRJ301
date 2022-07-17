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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import model.Account;
import model.Certificate;

/**
 *
 * @author Lenovo
 */
public class add extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sess = req.getSession();
        try {
            int id = Integer.valueOf(req.getParameter("id"));
            String name = req.getParameter("name");
            Date dob = Date.valueOf(req.getParameter("dob"));
            Boolean gender = Boolean.valueOf(req.getParameter("gender"));
            String[] certi = req.getParameterValues("certi");
            Account acc = (Account) sess.getAttribute("acc");
            String createby = acc.getUsername();
            DAO dao = new DAO();
            dao.insertEmployee(id, name, dob, true, createby);
            processRequest(req, resp);
        } catch (Exception e) {
            resp.getWriter().print("Error!");
        }
    }

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession sess = req.getSession();
        DAO dao = new DAO();
        List<Certificate> lc = dao.getAllCertificate();
        req.setAttribute("lc", lc);
        req.getRequestDispatcher("add.jsp").forward(req, resp);
    }

}
