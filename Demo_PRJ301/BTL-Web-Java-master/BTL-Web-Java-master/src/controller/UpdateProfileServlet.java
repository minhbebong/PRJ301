package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CustomerDAO;
import common.ConnectDB;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/UpdateProfile.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		Connection conn = ConnectDB.getConnection();
		if(CustomerDAO.updateProfile(id, username, fullname, address, phone, conn)) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("username", username);
			session.setAttribute("fullname", fullname);
			session.setAttribute("address", address);
			session.setAttribute("phone", phone);
//			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/Profile.jsp");
//			rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/profile");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("views/frontend/UpdateProfile.jsp");
			rd.forward(request, response);
		}
	}

}
