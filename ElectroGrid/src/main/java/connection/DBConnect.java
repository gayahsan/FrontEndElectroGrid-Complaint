package connection;

import java.sql.*;

public class DBConnect {
	
	private static Connection connection;

	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {

		// This creates new connection object when connection is closed or it is null
		if (connection == null || connection.isClosed()) {
			//db driver
			Class.forName("com.mysql.jdbc.Driver");
			//database link username and password
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint", "root", "");
		}
		
		return connection;
	}

}
