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
import util.Product;
import util.WishlistItem;

/**
 * Servlet implementation class WishlistController
 */
@WebServlet("/WishlistController")
public class WishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*int id = Integer.parseInt(request.getParameter("id"));
		ProductDAO pdao = ProductDAO.getInstance();
		Product prod = pdao.getProduct(id);
		String name = prod.getName();
		float price = prod.getPrice();
		String img = prod.getImage();
		String size = prod.getSize();
		
		List<WishlistItem> items;
		if(request.getSession().getAttribute("wishlist") == null) {
			items = new ArrayList<>();
		}else { 
			items = (ArrayList<WishlistItem>) request.getSession().getAttribute("wishlist");
		}
		items.add(new WishlistItem(name, price, img, id, size));
		request.getSession().setAttribute("wishlist", items);
		response.sendRedirect("wishlist.jsp");*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
