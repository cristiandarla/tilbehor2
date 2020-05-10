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
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import util.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getSession().getAttribute("user") != null) {
			if(request.getParameter("change") == null) {
				String username = (String) request.getSession().getAttribute("user");
				UserDAO udao = UserDAO.getInstance();
				User user = udao.getUser(username);
				if(user == null)
					response.sendRedirect("LogoutController");
				request.setAttribute("userDetails", user);
				request.getRequestDispatcher("user.jsp").forward(request, response);
			}else {
				if(request.getSession().getAttribute("user") != null) {
					String oldPass =(String) request.getParameter("oldpass");
					String newPass =(String) request.getParameter("newpass");
					String username =(String) request.getSession().getAttribute("user");
					UserDAO udao = UserDAO.getInstance();
					try {
						if(udao.changePassword(newPass, oldPass, username)) {
							HttpSession session=request.getSession();
							session.setAttribute("user", null);  
					        session.setAttribute("admin", null);  
					        session.setAttribute("cart", null);
					        response.sendRedirect("login.jsp");
						}else{
							List<String> errors = new ArrayList<>();
							errors.add("Old password wrongly spelt");
							request.setAttribute("errors", errors);
							request.getRequestDispatcher("changePswd.jsp").forward(request,response);
						}
					} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}else {
			response.sendRedirect("home.jsp");
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
