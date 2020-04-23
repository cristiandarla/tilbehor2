package listener;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import util.Product;
import util.DBConnection;

/**
 * Application Lifecycle Listener implementation class ProductMenListener
 *
 */
@WebListener
public class ProductListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ProductListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	Product p;
    	List<Product> products = new ArrayList<>();
    	Statement statement;
		try {
	    	Connection con = DBConnection.getConnection();
			statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT * FROM public.products");
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
				products.add(p);
			}
			arg0.getServletContext().setAttribute("products", products);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
}
