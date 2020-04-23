package util;

public class Product {
	private String name, image, description, color, size, material, category, brand;
	float price;
	int stock;

	public Product() {
	}

	public Product(String name, String image, String color, String size, String material, String category, String brand,
			float price, int stock) {
		super();
		this.name = name;
		this.image = image;
		this.color = color;
		this.size = size;
		this.material = material;
		this.category = category;
		this.brand = brand;
		this.price = price;
		this.stock = stock;
	}
	
	//getters
	public String getName() {return name;}

	public String getImage() {return image;}
	
	public String getDescription() {return description;}

	public String getColor() {return color;}

	public String getSize() {return size;}

	public String getMaterial() {return material;}

	public String getCategory() {return category;}

	public String getBrand() {return brand;}

	public float getPrice() {return price;}

	public int getStock() {return stock;}

	
	//setters
	public void setName(String name) {this.name = name;}

	public void setImage(String image) {this.image = image;}

	public void setDescription(String description) {this.description = description;}

	public void setColor(String color) {this.color = color;}

	public void setSize(String size) {this.size = size;}

	public void setMaterial(String material) {this.material = material;}

	public void setCategory(String category) {this.category = category;}

	public void setBrand(String brand) {this.brand = brand;}

	public void setPrice(float price) {this.price = price;}

	public void setStock(int stock) {this.stock = stock;}
}