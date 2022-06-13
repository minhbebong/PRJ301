/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cellphonestore.function;

import com.cellphonestore.model.Users;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hongd
 */
public class AuthenticationLogin implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private ServletContext context;
    protected String ADMIN = "sa";
    protected String USER = "us";

    public AuthenticationLogin() {
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String url_raw = request.getRequestURI();
        String url = url_raw.substring(10,url_raw.length());
        HttpSession session = request.getSession();
        Users a = (Users) session.getAttribute("user");
        if (url.startsWith("/admin")) {
            if (a != null) {
                if (a.getRole().equals(ADMIN)) {
                    chain.doFilter(req, res);
                } else if (a.getRole().equals(USER)) {
                    request.setAttribute("message", "*Bạn không có quyền truy cập!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "*Bạn chưa đăng nhập!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            chain.doFilter(req, res);
        }
    }

    @Override
    public void destroy() {
        System.out.println("Destroy"); //To change body of generated methods, choose Tools | Templates.
    }
   

}
