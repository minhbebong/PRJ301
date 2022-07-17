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
import java.util.List;
import model.Account;

/**
 *
 * @author Lenovo
 */
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("user");
        String pass = req.getParameter("pass");
        DAO dao = new DAO();
        HttpSession sess = req.getSession();
        String mess = "Login Failed";
        List<Account> list = dao.getAllAccount();
        list.add(new Account("thien", "123", "tm"));
        for (Account account : list) {
            if (user.equals(account.getUsername()) && pass.equals((account.getPassword()))) {
                mess = "Login Successfull!";
                sess.setAttribute("acc", account);
            }
        }
        req.setAttribute("mess", mess);
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

}
