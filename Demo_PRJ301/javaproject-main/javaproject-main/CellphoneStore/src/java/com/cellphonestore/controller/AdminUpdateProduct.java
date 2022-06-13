/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.controller;

import com.cellphonestore.dao.ProductDAO;
import com.cellphonestore.function.Functions;
import com.cellphonestore.model.Color;
import com.cellphonestore.model.ProductDetails;
import com.cellphonestore.model.Storage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hongd
 */
@WebServlet(name = "AdminUpdateProduct", urlPatterns = {"/admin-updateproduct"})
public class AdminUpdateProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminUpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUpdateProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        com.cellphonestore.dao.ProductDAO pdao = new ProductDAO();
        com.cellphonestore.function.Functions f = new Functions();
        String action = request.getParameter("action");
        String type = request.getParameter("type");
//        System.out.println("Action: "+action+" Type: "+type);
        if (!action.isEmpty()) {
            if (action.equals("update")) {
                String pid = request.getParameter("pid");
                String value = request.getParameter("value");
                if (type.equals("color")) {
                    String cid_raw = request.getParameter("cid");//Color id
                    try {
                        int cid = Integer.parseInt(cid_raw);
                        Color c = new Color(cid, pid, value);
                        pdao.updateColor(c);
                    } catch (NumberFormatException e) {
                        System.out.println("Error: " + e);
                    }
                } else if (type.equals("storage")) {
                    String sid_raw = request.getParameter("sid");
                    try {
                        int sid = Integer.parseInt(sid_raw);
                        Storage s = new Storage(sid, pid, value);
                        pdao.updateStorage(s);
                    } catch (NumberFormatException e) {
                        System.out.println("Error: " + e);
                    }
                }
                response.sendRedirect(request.getContextPath() + "/admin-insideproduct?pid=" + pid);

            } else if (action.equals("add")) {
                String pid = request.getParameter("pid");
                String value = request.getParameter("value");
                if (type.equals("color")) {
                    List<String> color = new ArrayList<>();
                    if (value != null) {
                        color = f.splitString(value);
                    }
                    for (String c : color) {
                        Color cl = new Color(0, pid, c);
                        pdao.addColor(cl);
                    }
                } else if (type.equals("storage")) {
                    List<String> storage = new ArrayList<>();
                    if (value != null) {
                        storage = f.splitString(value);
                    }
                    for (String c : storage) {
                        Storage st = new Storage(0, pid, c);
                        pdao.addStorage(st);
                    }
                }

                response.sendRedirect(request.getContextPath() + "/admin-insideproduct?pid=" + pid);
            } else if (action.equals("delete")) {
                String pid = request.getParameter("pid");
                if (type.equals("color")) {
                    String cid_raw = request.getParameter("cid");
                    try {
                        int cid = Integer.parseInt(cid_raw);
                        pdao.deleteColorById(cid);
                    } catch (NumberFormatException e) {
                        System.out.println("Error: " + e);
                    }
                } else if (type.equals("storage")) {
                    String sid_raw = request.getParameter("sid");
                    try {
                        int sid = Integer.parseInt(sid_raw);
                        pdao.deleteStorageById(sid);
                    } catch (NumberFormatException e) {
                        System.out.println("Error: " + e);
                    }
                }

                response.sendRedirect(request.getContextPath() + "/admin-insideproduct?pid=" + pid);
            }
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        com.cellphonestore.dao.ProductDAO pdao = new ProductDAO();
        String pid = request.getParameter("pid");
        String screen = request.getParameter("screen");
        String os = request.getParameter("os");
        String rear = request.getParameter("rear");
        String front = request.getParameter("front");
        String soc = request.getParameter("soc");
        String ram = request.getParameter("ram");
        String sim = request.getParameter("sim");
        String bat = request.getParameter("bat");
        try {

            ProductDetails pd = new ProductDetails(0, pid, screen, os, rear, front, soc, ram, sim, bat);
            pdao.updateProductDetails(pd);
            response.sendRedirect(request.getContextPath() + "/admin-insideproduct?pid=" + pid);
        } catch (IOException e) {
            System.out.println("Error: " + e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
