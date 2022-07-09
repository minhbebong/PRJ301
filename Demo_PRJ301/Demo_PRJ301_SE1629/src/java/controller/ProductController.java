/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Product;
import model.ProductDAO;

/**
 *
 * @author Lenovo
 */
public class ProductController extends HttpServlet {

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
        //Check xem đã đăng nhập chưa ?
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            response.sendRedirect("home.jsp");
            return;
        }
        ProductDAO d = new ProductDAO();
        ArrayList<Product> listAll = d.getAll();
        //Tạo biến size
        int size = listAll.size();
        //Tính số trang
        int numpage = (size % 4 == 0) ? size / 4 : size / 4 + 1;

        //Tìm page:
        int page = 1;
        String xpage = request.getParameter("xpage");
        if (xpage != null) {
            page = Integer.parseInt(xpage);
        }
        //Lấy list từ vị trí nào đến vị trí nào
        int start = (page - 1) * 4;
        int end = Math.min(page*4 - 1, size - 1);

        ArrayList<Product> list = d.getListByPage(listAll, start, end);
        
        request.setAttribute("numpage", numpage);
        request.setAttribute("list", list);
        request.getRequestDispatcher("ListProduct.jsp").forward(request, response);

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
