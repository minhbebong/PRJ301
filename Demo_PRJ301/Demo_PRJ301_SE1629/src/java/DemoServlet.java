/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
public class DemoServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DemoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form method='POST'>");
            out.println("Enter a:<input type='text' name ='a'>");
            out.println("<br>Enter b:<input type='text' name ='b'>");
            out.println("<br><input type='submit' name ='Cong' value='OK'>");
            out.println("</form>");
            //nhập thông tin từ phía client request
            int a=Integer.parseInt(request.getParameter("a"));
            int b=Integer.parseInt(request.getParameter("b"));
            //c1: thêm giá trị paâm nhập trực tiếp từ thanh địa chỉ
//            if(request.getParameter("op")==null){
//                out.print("chưa truyền phép tính");
//                return;
//            }
//            int op=Integer.parseInt(request.getParameter("op"));
            //c2: lưu param trên thẻ context =param trong file web.xml
            //int op = Integer.parseInt(getServletContext().getInitParameter("op"));
            //c3: lưu param trên thẻ init -param của 1 servlet trên web.xml
            int op = Integer.parseInt(getInitParameter("op"));
            //xử lý thông tin theo yêu cầu đề bài
            int c = a/b;
            if(op==0){
                c=a+b;
            }
            if(op==1){
                c=a-b;
            }
            if(op==2){
                c=a*b;
            }
            //response lại kết quả cho phía client
            out.print("<br>Result: " +c);
            
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