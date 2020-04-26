package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductDAO;
import util.DBConnection;
import util.Product;

/**
 * Servlet implementation class databaseController
 */
@WebServlet("/databaseController")
public class databaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public databaseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*Product p;
    	List<Product> products = new ArrayList<>();
    	Statement statement;
		try {
	    	Connection con = DBConnection.getConnection();
			statement = con.createStatement();
			
			//get products
			//ResultSet resultSet = statement.executeQuery("SELECT DISTINCT ON (NAME_PRODUCT) NAME_PRODUCT,* FROM public.products");
			ResultSet resultSet = statement.executeQuery("select * from products order by category_product");
			while(resultSet.next()) {
				p = new Product();
				p.setBrand(resultSet.getString("brand_product"));
				p.setCategory(resultSet.getString("category_product"));
				p.setColor(resultSet.getString("color_product"));
				p.setDescription(resultSet.getString("description_product"));
				p.setImage(resultSet.getString("image_product"));
				p.setMaterial(resultSet.getString("material_product"));
				p.setName(resultSet.getString("name_product"));
				p.setPrice(resultSet.getFloat("price_product"));
				p.setSize(resultSet.getString("size_product"));
				p.setStock(resultSet.getInt("stock_product"));
				p.setId(resultSet.getInt("id"));
				products.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("products", products);
		request.getRequestDispatcher("product.jsp").forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
