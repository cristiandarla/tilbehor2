package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import util.DBConnection;
import util.OrderItem;
public class CartDAO {
	
	private static CartDAO instance;
	public static CartDAO getInstance() {
		if (instance == null) {
			instance = new CartDAO();
		}
	return instance;
	}
	
	private CartDAO() {}
	
	public void placeOrder(List<OrderItem> items, String user) {
		PreparedStatement statement;
		String sql = "insert into orders(id_user, date)\r\n" + 
				"values ((select id from users where username=?), current_date);\r\n" + 
				"insert into order_items(id, id_product, qty, total_price)\r\n" + 
				"values ((select max(id) from orders), ?, ?, ?);\r\n" + 
				"update orders\r\n" + 
				"set total_price = (select sum(total_price) from order_items)\r\n" + 
				"where id = (select max(id) from order_items);\r\n" + 
				"update products\r\n" + 
				"set stock_product = (select stock_product from products where id=?) - ?\r\n" + 
				"where id=?;";
		for(OrderItem item : items){
			try (Connection connection = DBConnection.getConnection()) {
				statement = connection.prepareStatement(sql);
				statement.setString(1, user);
				statement.setInt(2, item.getId());
				statement.setString(3, item.getName());
				statement.setInt(4, item.getQty());
				statement.setFloat(5, item.getPrice());
				statement.setInt(6, item.getId());
				statement.setInt(7, item.getQty());
				statement.setInt(8, item.getId());
				statement.executeUpdate();
	            statement.close();
	            connection.close();
	            System.out.println("solved");
			}catch (SQLException e) {
	            System.out.println("Connection failure.");
	            e.printStackTrace();
	        }
		}
		
	}
}
