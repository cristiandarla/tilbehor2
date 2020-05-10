package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Product;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String desc = request.getParameter("desc");
		String category = request.getParameter("category");
		List<Product> products = (List<Product>) request.getServletContext().getAttribute("products");
		List<Product> trueProducts = new ArrayList<>();
		request.setAttribute("desc", desc);
		request.setAttribute("category", category);
		if(desc != null && category  != null) {
			for(Product prod: products) {
				if(prod.getDescription().equals(desc) && prod.getCategory().equals(category)) {
					trueProducts.add(prod);
				}
			}
			request.getSession().setAttribute("products", trueProducts);
			request.getRequestDispatcher("products.jsp").forward(request, response);
		}else if(desc != null) {
			for(Product prod: products) {
				if(prod.getDescription().equals(desc)) {
					trueProducts.add(prod);
				}
			}
			request.getSession().setAttribute("products", trueProducts);
			request.getRequestDispatcher("products.jsp").forward(request, response);
		}else if(category != null) {
			for(Product prod: products) {
				if(prod.getCategory().equals(category)) {
					trueProducts.add(prod);
				}
			}
			request.getSession().setAttribute("products", trueProducts);
			request.getRequestDispatcher("products.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("products", products);
			request.getRequestDispatcher("products.jsp").forward(request, response);
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
