package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.Contact;
import util.DBConnection;

public class ContactDAO {
	private static ContactDAO instance;
	public static ContactDAO getInstance() {
	if (instance == null) {
	instance = new ContactDAO();
	}
	return instance;
	}
	private ContactDAO() {}
	
	public void addContact(Contact contact) {
		PreparedStatement statement;
		String sql = "insert into contact(name,email,subject,message,privacy) values(?,?,?,?,?)";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.prepareStatement(sql);
			statement.setString(1, contact.getName());
			statement.setString(2, contact.getEmail());
			statement.setString(3, contact.getSubject());
			statement.setString(4, contact.getMessage());
			statement.setBoolean(5, contact.getPrivacy());
			statement.executeUpdate();
            statement.close();
            connection.close();
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		
	}
}
