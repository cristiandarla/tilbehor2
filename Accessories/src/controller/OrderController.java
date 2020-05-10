package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.OrderDAO;
import util.Order;
import util.Product;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/OrderController")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getSession().getAttribute("user") != null) {
			if(request.getParameter("client") == null) {
				OrderDAO odao = OrderDAO.getInstance();
				List<Order> orders = odao.getOrders();
				request.setAttribute("orders", orders);
				request.getRequestDispatcher("orders.jsp").forward(request, response);
			}else {
				int idUser = Integer.parseInt(request.getParameter("id"));
				OrderDAO odao = OrderDAO.getInstance();
				List<Order> orders = odao.getOrdersClient(idUser);
				request.setAttribute("orders", orders);
				request.getRequestDispatcher("ordersClient.jsp").forward(request, response);
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
