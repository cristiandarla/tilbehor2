package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	
	public static Connection getConnection() {
		Connection connection=null;
		try{
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:/comp/env/jdbc/accessories");
			connection=ds.getConnection();
		}catch (NamingException | SQLException ex) {
			ex.printStackTrace();
		}
	return connection;
	}
}