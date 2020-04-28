package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.OrderItem;
import util.Product;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		

		List<Product> products = (ArrayList<Product>) request.getServletContext().getAttribute("products");
		for(Product prod: products) {
			if(prod.getId() == id) {
				prod.setStock(prod.getStock() + qty);
				List<Product> prods =(List<Product>) request.getServletContext().getAttribute("alertProds");
				for(Product p : prods) {
					if(p.getId() == prod.getId()) {
						prods.remove(p);
						break;
					}
				}
				break;
			}
		}
		request.getServletContext().setAttribute("products", products);
		
		List<OrderItem> items = (ArrayList<OrderItem>) request.getSession().getAttribute("cart");
		for(OrderItem item : items) {
			if(item.getId() == id) {
				items.remove(item);
				break;
			}
		}
		request.getSession().setAttribute("cart", items);
		response.sendRedirect("shoppingCart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
