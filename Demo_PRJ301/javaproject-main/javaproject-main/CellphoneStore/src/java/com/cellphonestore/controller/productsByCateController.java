/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.controller;

import com.cellphonestore.dao.CategoryDAO;
import com.cellphonestore.dao.ProductDAO;
import com.cellphonestore.model.Category;
import com.cellphonestore.model.Products;
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
@WebServlet(name = "productsByCateController", urlPatterns = {"/productscate"})
public class productsByCateController extends HttpServlet {

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
            out.println("<title>Servlet productsByCateController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productsByCateController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String search_raw = request.getParameter("category");
        String index_raw = request.getParameter("indexP");
        if (index_raw == null) {
            index_raw = "1";
        }
        try {
            int index = Integer.parseInt(index_raw);
            int search = Integer.parseInt(search_raw);
            com.cellphonestore.dao.ProductDAO dao = new ProductDAO();
            com.cellphonestore.dao.CategoryDAO cdao = new CategoryDAO();
            if (search != 0) {
                List<Products> plist = dao.productByCid(search);
                Category c = cdao.getCateByCid(search);
                if (plist != null && !plist.isEmpty()) {
                    request.setAttribute("plist", plist);
                    request.setAttribute("title", "Tất cả sản phẩm của " + c.getCname());
                    request.getRequestDispatcher("searchresult.jsp").forward(request, response);
                } else {
                    request.setAttribute("title", "Tất cả sản phẩm của " + c.getCname());
                    request.getRequestDispatcher("searchresult.jsp").forward(request, response);
                }
            } else {
                List<Products> plist = dao.getAll();
                int count = plist.size();
                int lastPage = count/8;
                if (count % 8 != 0) {
                    lastPage++;
                }
                List<Products> list = dao.paging(index);
                if (list != null && !list.isEmpty()) {
                    request.setAttribute("plist", list);
                    request.setAttribute("lastP", lastPage);
                    request.setAttribute("display", "ds");
                    request.setAttribute("title", "Tất cả sản phẩm");
                    request.getRequestDispatcher("searchresult.jsp").forward(request, response);
                } else {
                    request.setAttribute("title", "Tất cả sản phẩm");
                    request.getRequestDispatcher("searchresult.jsp").forward(request, response);
                }
            }

        } catch (IOException | NumberFormatException | ServletException e) {
            System.out.println("Error" + e);
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
