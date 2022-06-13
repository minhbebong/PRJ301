/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.controller;

import com.cellphonestore.dao.ProductDAO;
import com.cellphonestore.function.Functions;
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
@WebServlet(name = "loadtop4product", urlPatterns = {"/loadtop4product"})
public class loadtop4products extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        //Load dao
        com.cellphonestore.dao.ProductDAO dao = new ProductDAO();
        //Get list product
        List<Products> list = dao.getTop4();
        //Init new function
        com.cellphonestore.function.Functions f = new Functions();
        for (Products products : list) {
            //Replace int price to currency format 
            String price = f.Currency(products.getPrice());
            out.println("<div class=\"col-lg-3 col-md-4 col-sm-6 product\">\n" +
"                    <div class=\"item-wrapper\">\n" +
"                        <div class=\"item-img\">\n" +
"                            <a href=\""+request.getContextPath()+"/product?pid="+products.getPid()+"\"><img src=\""+products.getImage()+"\" class=\"img-responsive img-i\"\n" +
"                                    alt=\""+products.getName()+"\"></a>\n" +
"\n" +
"                        </div>\n" +
"                        <div class=\"item-price\">\n" +
"                            <h3>"+products.getName()+"</h3>\n" +
"                            <p>"+price+"&nbsp;₫</p>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>");
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
        processRequest(request, response);
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
