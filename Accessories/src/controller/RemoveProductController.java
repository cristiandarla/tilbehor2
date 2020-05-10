package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductDAO;
import util.Product;

/**
 * Servlet implementation class RemoveProductController
 */
@WebServlet("/RemoveProductController")
public class RemoveProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getSession().getAttribute("user") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			ProductDAO prod = ProductDAO.getInstance();
			prod.removeProduct(id);
			List<Product> products = (List<Product>) request.getServletContext().getAttribute("products");
			for(Product product : products)
				if(product.getId() == id) {
					products.remove(product);
					break;
				}
			request.getSession().setAttribute("products", products);
			response.sendRedirect("product.jsp");
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
