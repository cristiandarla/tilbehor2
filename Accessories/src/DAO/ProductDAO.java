package DAO;

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
}
