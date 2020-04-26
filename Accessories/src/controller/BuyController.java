package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductDAO;
import util.OrderItem;
import util.Product;

/**
 * Servlet implementation class BuyController
 */
@WebServlet("/BuyController")
public class BuyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyController() {
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
		/*ProductDAO pdao = ProductDAO.getInstance();*/
		String name = "";
		float price = 0;
		String img = "";
		
		List<Product> products =(List<Product>) request.getServletContext().getAttribute("products");
		for(Product p : products)
			if(p.getId() == id) {
				p.setStock(p.getStock() - qty);
				name = p.getName();
				price = p.getPrice();
				img = p.getImage();
			}
		request.getServletContext().setAttribute("products", products);
				
		List<OrderItem> items;
		if(request.getSession().getAttribute("cart") == null) {
			items = new ArrayList<>();
			items.add(new OrderItem(name, qty, price*qty, img, id));
		}else {
			items = (ArrayList<OrderItem>) request.getSession().getAttribute("cart");
			int size = items.size();
			int aux = 0;
			if(size == 1 && items.get(0).getId() == id) {
				items.get(0).setQty(items.get(0).getQty() + qty);
				items.get(0).setPrice(items.get(0).getPrice() + qty*price);
			}else {
				for(OrderItem item: items) {
					aux ++;
					if(item.getId() == id) {
						item.setQty(item.getQty() + qty);
						item.setPrice(item.getPrice() + qty);
						break;
					}
				}
				if(aux == size)
					items.add(new OrderItem(name, qty, price*qty, img, id));
			}
		}
		request.getSession().setAttribute("cart", items);
		
		request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
		//response.sendRedirect("product.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
