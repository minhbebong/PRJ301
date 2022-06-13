/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.controller;

import com.cellphonestore.dao.CategoryDAO;
import com.cellphonestore.dao.ProductDAO;
import com.cellphonestore.function.Functions;
import com.cellphonestore.model.Category;
import com.cellphonestore.model.Color;
import com.cellphonestore.model.ProductDetails;
import com.cellphonestore.model.Products;
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
@WebServlet(name = "adminAddnewController", urlPatterns = {"/admin-addnew"})
public class adminAddnewController extends HttpServlet {

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
            out.println("<title>Servlet adminAddnewController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminAddnewController at " + request.getContextPath() + "</h1>");
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
        com.cellphonestore.dao.CategoryDAO cdao = new CategoryDAO();
        List<Category> listc = cdao.getAll();
        request.setAttribute("clist", listc);
        request.getRequestDispatcher("admin-addnew.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        com.cellphonestore.function.Functions f = new Functions();
        
        String cid_raw = request.getParameter("cid");
        String pid =request.getParameter("pid");
        String pname = request.getParameter("pname");
        String image = request.getParameter("image");
        String price_raw = request.getParameter("price");
        String des = request.getParameter("des");
        String amount_raw = request.getParameter("amount");
        
        String screen = request.getParameter("screen");
        String os = request.getParameter("os");
        String rearcam = request.getParameter("rearcam");
        String frontcam = request.getParameter("frontcam");
        String soc = request.getParameter("soc");
        String ram = request.getParameter("ram");
        String sim = request.getParameter("sim");
        String battery = request.getParameter("battery");
        
        String color = request.getParameter("color");
        String storage = request.getParameter("storage");
        
        List<String> colorlist = new ArrayList<>();
        List<String> storagelist = new ArrayList<>();
        
        if (color != null) {
            colorlist = f.splitString(color);
        }
        
        if (storage != null) {
            storagelist = f.splitString(storage);
        }
        
        int cid, price, amount;
        try {
            cid = Integer.parseInt(cid_raw);
            price = Integer.parseInt(price_raw);
            amount = Integer.parseInt(amount_raw);
            
            com.cellphonestore.model.Products products = new Products(cid, pid, cid, pname, image, price, des, amount);
            com.cellphonestore.dao.ProductDAO pdao = new ProductDAO();
            pdao.addProduct(products);
            
            com.cellphonestore.model.ProductDetails productdetail = new ProductDetails(cid, pid, screen, os, rearcam, frontcam, soc, ram, sim, battery);
            pdao.addPDetail(productdetail);
            for (String s : storagelist) {
                Storage st = new Storage(cid, pid, s);
                pdao.addStorage(st);
            }
            
            for (String c : colorlist) {
                Color cl = new Color(cid, pid, c);
                pdao.addColor(cl);
            }
            response.sendRedirect(request.getContextPath()+"/admin-addnew");
        } catch (IOException | NumberFormatException e) {
            System.out.println("Error: "+e);
        }
        processRequest(request, response);
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
