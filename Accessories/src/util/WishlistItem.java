package util;

public class WishlistItem {

	private String name, img, size;
	private int id;
	private float price;
	
	public WishlistItem(String name, float price, String img, int id, String size) {
		this.name = name;
		this.price = price;
		this.img = img;
		this.id = id;
		this.size = size;
	}

	public String getName() {
		return name;
	}

	public String getImg() {
		return img;
	}

	public String getSize() {
		return size;
	}
	
	public int getId() {
		return id;
	}

	public float getPrice() {
		return price;
	}
	
	
}