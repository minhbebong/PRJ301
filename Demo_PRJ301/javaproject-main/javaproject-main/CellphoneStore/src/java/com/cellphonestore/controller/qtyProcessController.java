/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.controller;

import com.cellphonestore.dao.ProductDAO;
import com.cellphonestore.model.Cart;
import com.cellphonestore.model.Color;
import com.cellphonestore.model.Item;
import com.cellphonestore.model.Products;
import com.cellphonestore.model.Storage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hongd
 */
@WebServlet(name = "qtyProcessController", urlPatterns = {"/qtyprocess"})
public class qtyProcessController extends HttpServlet {

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
            out.println("<title>Servlet qtyProcessController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet qtyProcessController at " + request.getContextPath() + "</h1>");
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
        com.cellphonestore.dao.ProductDAO dao = new ProductDAO();
        Cookie arr[] = request.getCookies();
        List<Products> list = dao.getAll();
        List<Color> clist = dao.getAllColor();
        List<Storage> slist = dao.getAllStorage();
        String id_raw = request.getParameter("id");
        String num_raw = request.getParameter("num");
        String cid_raw = request.getParameter("cid"); //Cid: color id
        String sid_raw = request.getParameter("sid"); //Sid: storage id
        String element = "";

        if (arr != null) {
            for (Cookie cookie : arr) {
                if (cookie.getName().equals("cart")) {
                    element += cookie.getValue();
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }

        Cart cart = new Cart(element, list, clist, slist);
        int id, num, cid, sid; //cid: Color id, sid: Storage id
        try {
            id = Integer.parseInt(id_raw);
            num = Integer.parseInt(num_raw);
            cid = Integer.parseInt(cid_raw);
            sid = Integer.parseInt(sid_raw);
            Products p = dao.getProductById2(id);
            Color c = dao.getColorByCid(cid);
            Storage s = dao.getStorageBySid(sid);
            int store = p.getAmount();

            if (num == -1 && cart.getQuantityById(id, cid, sid) <= 1) {
                cart.removeItem(id, cid, sid);
            } else if (num == 0) {
                cart.removeItem(id, cid, sid);

            } else {
                if (num == 1 && cart.getQuantityById(id, cid, sid) >= store) {
                    num = 0;
                }
//                int qty = p.getPrice() * 2;
                Item item = new Item(p, c, s, num);
                cart.addItem(item);
            }

        } catch (NumberFormatException e) {
            System.out.println("Error: " + e);
        }
//        if (num_raw.equals("1") || num_raw.equals("-1")) {
        List<Item> items = cart.getItems();
        element = "";
        if (items.size() > 0) {
            element = items.get(0).getProducts().getId() + ":" + items.get(0).getQuantity() + ":" + items.get(0).getColor().getId() + ":" + items.get(0).getStorage().getId();
            for (int i = 1; i < items.size(); i++) {
                element += "," + items.get(i).getProducts().getId() + ":" + items.get(i).getQuantity() + ":" + items.get(i).getColor().getId() + ":" + items.get(i).getStorage().getId();
            }
        }
        Cookie c = new Cookie("cart", element);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        if (cart.getItems().isEmpty()) {
            request.setAttribute("size", "hd");
        } else {
            request.setAttribute("size", "ds");
        }
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
//        }else{
//            response.sendRedirect(request.getContextPath() + "/cart");
//        }

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
