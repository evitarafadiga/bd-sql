package application.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GenericDao {
	
	private Connection c;
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String hostName = "locahost";
		String dbName = "";
		String user = "";
		String senha = "12345678";
		
		Class.forName("net.sourceforge.jtds.jdbs.Driver");
		
		c = DriverManager.getConnection(
				String.format("jdbc:jtds:sqlserver://%s:1433;databaseName=%s;"
						+ "user=%s;password=%s;", hostName,dbName,user,senha));
		
		return c;
	}

}
