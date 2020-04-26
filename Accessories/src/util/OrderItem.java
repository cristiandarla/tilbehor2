package util;

public class OrderItem {

	private String name, img;
	private int id;
	private int qty;
	private float price;
	
	public OrderItem(String name, int qty, float price, String img, int id) {
		this.name = name;
		this.qty = qty;
		this.price = price;
		this.img = img;
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public String getImg() {
		return img;
	}

	public int getQty() {
		return qty;
	}
	
	public int getId() {
		return id;
	}

	public float getPrice() {
		return price;
	}
	
	
}