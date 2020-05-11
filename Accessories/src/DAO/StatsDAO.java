package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javafx.util.Pair;
import util.DBConnection;
import util.Product;
import util.StatsItem;

public class StatsDAO {

	private static StatsDAO instance;
	public static StatsDAO getInstance() {
	if (instance == null) {
	instance = new StatsDAO();
	}
	return instance;
	}
	private StatsDAO() {}
	
	public List<StatsItem> getStats() {
		List<StatsItem> items = new ArrayList<>();
		Statement statement;
		ResultSet rs;
		ProductDAO pdao = ProductDAO.getInstance();
		Map<Integer,Integer> results = new HashMap<>();
		String sql = "select products.id,\r\n" + 
				"coalesce((select sum(order_items.qty) from order_items\r\n" + 
				"		 where order_items.id_product = products.id), 0)\r\n" + 
				"from products, order_items\r\n" + 
				"group by products.id, order_items.qty\r\n" + 
				"order by products.id";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.createStatement();
            rs = statement.executeQuery(sql);
            while(rs.next()) {
            	int id = rs.getInt("id");
            	int qty = rs.getInt("coalesce");
            	results.put(id, qty);
            }
    		rs.close();
    		statement.close();
    		connection.close();
		}catch (SQLException e) {
	        System.out.println("Connection failure.");
	        e.printStackTrace();
	    }
		for(Map.Entry<Integer, Integer> entry : results.entrySet()) {
			items.add(new StatsItem(pdao.getProduct(entry.getKey()), entry.getValue()));
		}
		return items;
	}
}
