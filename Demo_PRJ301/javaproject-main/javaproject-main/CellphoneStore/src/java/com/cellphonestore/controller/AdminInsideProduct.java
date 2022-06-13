/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.controller;

import com.cellphonestore.dao.CategoryDAO;
import com.cellphonestore.dao.ProductDAO;
import com.cellphonestore.model.Category;
import com.cellphonestore.model.Color;
import com.cellphonestore.model.ProductDetails;
import com.cellphonestore.model.Products;
import com.cellphonestore.model.Storage;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AdminInsideProduct", urlPatterns = {"/admin-insideproduct"})
public class AdminInsideProduct extends HttpServlet {

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
            out.println("<title>Servlet AdminInsideProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminInsideProduct at " + request.getContextPath() + "</h1>");
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
        com.cellphonestore.dao.ProductDAO pdao = new ProductDAO();
        com.cellphonestore.dao.CategoryDAO cdao = new CategoryDAO();
        String pid = request.getParameter("pid");
        try {
            Products a = pdao.getProductById(pid);
            List<Category> list = cdao.getAll();
            List<Color> clist = pdao.getColorById(pid);
            List<Storage> slist = pdao.getStorageById(pid);
            ProductDetails pd = pdao.getInfoById(pid);
            request.setAttribute("product", a);
            request.setAttribute("clist", list);
            request.setAttribute("colist", clist);
            request.setAttribute("slist", slist);
            request.setAttribute("details", pd);
            request.getRequestDispatcher("admin-insideproduct.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            System.out.println("Error: "+e);
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
        String id_raw = request.getParameter("id");
        String pid = request.getParameter("pid");
        String cate_raw = request.getParameter("cate");
        String name = request.getParameter("pname");
        String img = request.getParameter("img");
        String price_raw = request.getParameter("price");
        String qty_raw = request.getParameter("qty");
        String des = request.getParameter("des");
        try {
            int cate = Integer.parseInt(cate_raw);
            int price = Integer.parseInt(price_raw);
            int qty = Integer.parseInt(qty_raw);
            int id = Integer.parseInt(id_raw);
            Products a = new Products(id, pid, cate, name, img, price, des, qty);
            pdao.updateProduct(a);
            response.sendRedirect(request.getContextPath()+"/admin-insideproduct?pid="+pid);
        } catch (IOException | NumberFormatException e) {
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
