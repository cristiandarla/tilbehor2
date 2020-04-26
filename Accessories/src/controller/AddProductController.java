package controller;

import java.io.IOException;
import java.util.List;

import javax.management.InstanceNotFoundException;
import javax.management.MBeanException;
import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.MalformedObjectNameException;
import javax.management.ObjectName;
import javax.management.ReflectionException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductDAO;
import util.Product;

/**
 * Servlet implementation class AddProductController
 */
@WebServlet("/AddProductController")
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String desc = request.getParameter("desc");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		String material = request.getParameter("material");
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		float price = Float.parseFloat(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String img = "img/products_images/" + request.getParameter("image");
		ProductDAO prod = ProductDAO.getInstance();
		int id = prod.getID();
		
		Product p = new Product(name,desc, img, color, size, material, category, brand, price, stock, id + 1);
		
		prod.addProduct(p);
		List<Product> products = (List<Product>) request.getServletContext().getAttribute("products");
		products.add(p);
		request.getServletContext().setAttribute("products", products);
		response.sendRedirect("product.jsp");
		
		//forced restart of servlet
		MBeanServer mbs = MBeanServerFactory.findMBeanServer(null).get(0);
		ObjectName objectName;
		try {
			objectName = new ObjectName("Catalina:j2eeType=WebModule,name=//localhost/contextname,J2EEApplication=none,J2EEServer=none");
			mbs.invoke(objectName, "reload", null, null);
		} catch (MalformedObjectNameException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstanceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ReflectionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MBeanException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
