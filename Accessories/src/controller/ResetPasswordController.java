package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;

/**
 * Servlet implementation class ResetPasswordController
 */
@WebServlet("/ResetPasswordController")
public class ResetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDAO udao = UserDAO.getInstance();
		if(password == null) {
			if(udao.emailExists(email)) {
				request.setAttribute("email", email);
				request.getRequestDispatcher("security2.jsp").forward(request, response);
			}else {
				List<String> errors = new ArrayList<>();
				errors.add("Please, check for typos.");
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("security.jsp").forward(request, response);
			}
		}else {
			try {
				udao.resetPassword(password, email);
				response.sendRedirect("login.jsp");
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
