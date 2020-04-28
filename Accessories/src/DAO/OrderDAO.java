package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;
import util.Order;
import util.OrderItem;
import util.Product;

public class OrderDAO {
	private static OrderDAO instance;
	public static OrderDAO getInstance() {
	if (instance == null) {
	instance = new OrderDAO();
	}
	return instance;
	}
	private OrderDAO() {}
	
	public List<Order> getOrders() {
		List<Order> orders = new ArrayList<>();
		Statement statement;
		String sql ="select * from orders";
		String sql1 = "select * from order_items where id = ";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				int idUser = rs.getInt("id_user");
				Date date = rs.getDate("date");
				Order order = new Order();
				order.setDate(date);
				order.setId(id);
				order.setIdUser(idUser);	
				orders.add(order);
			}
			
			for(Order order : orders) {
				int id = order.getId();
				ArrayList<OrderItem> items = new ArrayList<OrderItem>();
				rs = statement.executeQuery(sql1 + id);
				while(rs.next()) {
					int idProd = rs.getInt("id_product");
					int qty = rs.getInt("qty");
					
					ProductDAO pdao = ProductDAO.getInstance();
					Product prod = pdao.getProduct(idProd);
					OrderItem ordItem = new OrderItem(prod.getName(), qty, prod.getPrice(), prod.getImage(), prod.getId());
					items.add(ordItem);
				}
				order.setItems(items);
			}
			rs.close();
            statement.close();
            connection.close();
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		return orders;
	}
}
