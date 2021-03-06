package DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;
import util.User;

public class UserDAO 
{
	private static UserDAO instance;
	public static UserDAO getInstance() {
	if (instance == null) {
	instance = new UserDAO();
	}
	return instance;
	}
	private UserDAO() {}
	
	private byte[] encode(byte[] text) throws NoSuchAlgorithmException{
		MessageDigest digest = MessageDigest.getInstance("SHA-512");
		byte[] encodedhash = digest.digest(text); 
		return encodedhash;
	}
	    
	private String bytesToHex(byte[] hash) {
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if(hex.length() == 1) hexString.append('0');
                 hexString.append(hex);
        }
        return hexString.toString();
    }
	
	public List<String> loginValidation(String uname, String password) throws NoSuchAlgorithmException {
		Statement statement;
		ResultSet resultSet;
		List<String> errors = new ArrayList<String>();
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * from public.users WHERE username='" + uname + "' and password='" + bytesToHex(encode(password.getBytes())) + "'");
            
            if(resultSet.next()) {
            }else {
            	errors.add("Wrong password or username");
            }
    		resultSet.close();
            statement.close();
            connection.close();
		}catch (SQLException e) {
	        System.out.println("Connection failure.");
	        e.printStackTrace();
	    }
		return errors;
	}
	
	private boolean userExists(String username) {
		Statement statement;
		ResultSet resultSet;
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT EXISTS(SELECT * from public.users WHERE username='" + username +"')");
            resultSet.next();
            if(resultSet.getBoolean(1))
            	return true;
            resultSet.close();
            statement.close();
            connection.close();
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		return false;
	}
	
	public boolean emailExists(String email) {
		Statement statement;
		ResultSet resultSet;
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT EXISTS(SELECT * from public.users WHERE email='" + email +"')");
            resultSet.next();
            if(resultSet.getBoolean(1))
            	return true;
            resultSet.close();
            statement.close();
            connection.close();
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		return false;
	}
	
	public boolean addUser(User user, List<String> errors) {
		if(!userExists(user.getUsername()) && !emailExists(user.getEmail())) {
			PreparedStatement statement;
			String sql = "insert into users(name,username,email,password,admin) values(?,?,?,?,?)";
			try (Connection connection = DBConnection.getConnection()) {
				statement = connection.prepareStatement(sql);
				statement.setString(1,user.getName());
				statement.setString(2,user.getUsername());
				statement.setString(3,user.getEmail());
				statement.setString(4,user.getPassword());
				statement.setBoolean(5,false);
				statement.executeUpdate();
	            statement.close();
	            connection.close();
	            return true;
			}catch (SQLException e) {
	            System.out.println("Connection failure.");
	            e.printStackTrace();
	        }
		}else if(userExists(user.getUsername())){
			errors.add("User already exists!");
		}else if(emailExists(user.getEmail())){
			errors.add("Email already exists!");
		}
		return false;
	}
	
	public boolean getAdmin(String user) {
		PreparedStatement statement;
		String sql = "select admin from users where name = '" + user + "'";
		Boolean admin = false;
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			rs.next();
			admin = rs.getBoolean(1);
			rs.close();
            statement.close();
            connection.close();
            return admin;
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		return admin;
		
	}
	
	public User getUser(String username) {
		User user = new User();
		PreparedStatement statement;
		String sql = "select * from users where username='" + username + "'";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			rs.next();
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setUsername(username);
			user.setId(rs.getInt("id"));
            statement.close();
            connection.close();
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }	
		return user;
	}
	
	public boolean resetPassword(String newPass, String email) throws NoSuchAlgorithmException {
		PreparedStatement statement;
		String sql = "update users\n" + 
					"set password = ?\n" + 
					"where email = ?";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.prepareStatement(sql);
			statement.setString(1,bytesToHex(encode(newPass.getBytes())));
			statement.setString(2, email);
			statement.executeUpdate();
			statement.close();
            connection.close();			
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		return false;
	}
	
	public boolean changePassword(String newPass, String oldPass, String username) throws NoSuchAlgorithmException {
		Statement statement;
		String sql = "select password from users where username='" + username + "'";
		String sql1 = "update users\n" + 
					"set password = ?\n" + 
					"where username = ?";
		try (Connection connection = DBConnection.getConnection()) {
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			rs.next();
			if(rs.getString(1).equals(bytesToHex(encode(oldPass.getBytes())))) {
				PreparedStatement s;
				s = connection.prepareStatement(sql1);
				s.setString(1,bytesToHex(encode(newPass.getBytes())));
				s.setString(2, username);
				s.executeUpdate();
				statement.close();
	            connection.close();
				return true;
			}else{
				return false;
			}
		}catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
		return false;
	}
}
