package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;
import util.Product;

public class ProductDAO 
{
	private static ProductDAO instance;
	public static ProductDAO getInstance() {
	if (instance == null) {
	instance = new ProductDAO();
	}
	return instance;
	}
	private ProductDAO() {}
	
	public Product getProduct(int id) {
		Product p = new Product();
    	Statement statement;
		try {
	    	Connection con = DBConnection.getConnection();
			statement = con.createStatement();
			
			//get products
			ResultSet resultSet = statement.executeQuery("select * from products where id = " + id);
			while(resultSet.next()) {
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
			}
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
	
	public boolean addProduct(Product p) {
		
		PreparedStatement statement;
		String sql = "insert into products(brand_product, category_product, color_product, description_product, "
				+ "image_product, material_product, name_product, price_product, size_product, stock_product, id) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.prepareStatement(sql);
			statement.setString(1,p.getBrand());
			statement.setString(2,p.getCategory());
			statement.setString(3,p.getColor());
			statement.setString(4,p.getDescription());
			statement.setString(5,p.getImage());
			statement.setString(6,p.getMaterial());
			statement.setString(7,p.getName());
			statement.setFloat(8,p.getPrice());
			statement.setString(9,p.getSize());
			statement.setInt(10,p.getStock());
			statement.setInt(11,p.getId());
			statement.executeUpdate();
            statement.close();
            connection.close();
            return true;
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		return false;
	}
	
	public boolean removeProduct(int id) {
		
		PreparedStatement statement;
		String sql = "delete from products where id='" + id + "'";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.prepareStatement(sql);
			statement.executeUpdate();
            statement.close();
            connection.close();
            System.out.println("solved");
            return true;
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		return false;
	}
	
	public int getID() {
		Statement statement;
		String sql = "select max(id) from products";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			rs.next();
			return rs.getInt("max");
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		System.out.println("vezi ca a luat-o pe ulei");
		return 0;
	}
}
