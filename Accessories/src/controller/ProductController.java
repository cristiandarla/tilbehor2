package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    private boolean checkFilters(Product prod, Map<String, String[]> filters) {
    	boolean category = false, material = false, brand = false;
    	for(Map.Entry<String, String[]> entry : filters.entrySet()) {
    		switch(entry.getKey()){
    			case "category":
    				{
    					category = false;
    					if(entry.getValue() == null) {
    						category = true;
    						break;
    					}else {
	    					for(String value : entry.getValue()) {
	    						if(prod.getCategory().equals(value)) {
	    							category = true;
	    							break;
	    						}    							
		    				}
    					}
	    				break;
    				}
    			case "material": 
				{
					material = false;
					if(entry.getValue() == null) {
						material = true;
						break;
					}else {
						for(String value : entry.getValue()) {
							if(prod.getMaterial().equals(value)) {
								material = true;
								break;
							}
	    				}
					}
    				break;
				}
    			case "brand": 
				{
					brand = false;
					if(entry.getValue() == null) {
						brand = true;
						break;
					}else {
						for(String value : entry.getValue()) {
							if(prod.getBrand().equals(value)) {
								brand = true;
								break;
							}
	    				}
					}
    				break;
				}
    		}
    	}
    	return category && material && brand;
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sex = request.getParameter("sex");
		String[] desc = request.getParameterValues("desc");
		String[] category = request.getParameterValues("category");
		String[] material = request.getParameterValues("material");
		String[] brand = request.getParameterValues("brand");
		
		if(desc == null) {
			if(sex != null) {
				desc = new String[1];
				desc[0] = sex;
			}
		}
		
		Map<String, String[]> filters = new HashMap<>();
		filters.put("category", category);
		filters.put("material", material);
		filters.put("brand", brand);
		
		List<Product> products = (List<Product>) request.getServletContext().getAttribute("products");
		List<Product> trueProducts = new ArrayList<>();
		
		if(desc != null && desc.length == 1) {
			for(Product prod: products) {
				if(prod.getDescription().equals(desc[0]) && checkFilters(prod, filters)) {
					trueProducts.add(prod);
				}
			}
			request.setAttribute("desc", desc[0]);
			request.getSession().setAttribute("products", trueProducts);
			request.getRequestDispatcher("products.jsp").forward(request, response);
		}else {
			for(Product prod: products) {
				if(checkFilters(prod, filters)) {
					trueProducts.add(prod);
				}
			}
			request.setAttribute("desc", null);
			request.getSession().setAttribute("products", trueProducts);
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
