package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class User {
	private String name, email, password, username;

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
