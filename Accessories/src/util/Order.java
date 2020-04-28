package util;

import java.sql.Date;
import java.util.ArrayList;

public class Order {

	private Date date;
	private int id, idUser;
	private ArrayList<OrderItem> items;
	
	public Order() {
		items = new ArrayList<OrderItem>();
	}
	
	public Order(Date date, int id, int idUser, ArrayList<OrderItem> items ) {
		this.date = date;
		this.id = id;
		this.idUser = idUser;
		this.items = items;
	}

	public Date getDate() {
		return date;
	}

	public int getId() {
		return id;
	}

	public int getIdUser() {
		return idUser;
	}

	public ArrayList<OrderItem> getItems() {
		return items;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public void setItems(ArrayList<OrderItem> items) {
		this.items = items;
	}
	
	
}
