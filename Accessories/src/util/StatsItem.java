package util;

public class StatsItem {
	private Product product;
	private int qty;
	
	public StatsItem() {
	}
	
	public StatsItem(Product product, int qty) {
		this.product = product;
		this.qty = qty;
	}

	public Product getProduct() {
		return product;
	}

	public int getQty() {
		return qty;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
}
