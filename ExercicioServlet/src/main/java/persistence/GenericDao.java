package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GenericDao {

private Connection c;

public Connection getConnection() throws ClassNotFoundException, SQLException {

String hostName = "127.0.0.1";
String dbName ="dbjavafx";
String user ="lazaro";
String senha ="12345678";
Class.forName("net.sourceforge.jtds.jdbc.Driver");
c = DriverManager.getConnection(String.format("jdbc:jtds:sqlserver://%s:1433;databaseName=%s;user=%s;password=%s;", hostName, dbName, user, senha));

return c;
}

}