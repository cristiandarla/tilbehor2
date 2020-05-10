package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class User {
	private int id;
	private String name, email, password, username;

	public User() {
	}
	
	public User(int id, String name, String email, String password, String username) throws NoSuchAlgorithmException {
		super();
		this.name = name;
		this.email = email;
		this.password = bytesToHex(encode(password.getBytes()));
		this.username = username;
		this.id = id;
	}
	
	public User(String name, String email, String password, String username) throws NoSuchAlgorithmException {
		super();
		this.name = name;
		this.email = email;
		this.password = bytesToHex(encode(password.getBytes()));
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getUsername() {
		return username;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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
}
