package com.serviceprovider;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static String url = "jdbc:mysql://localhost:3306/serviceprovider";
	private static String username = "root";
	private static String password = "mysql";
	private static Connection con;

	public static Connection getConnection() {
		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection(url, username, password);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        System.out.println("MySQL JDBC driver not found.");
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Error while connecting to the database.");
	    }
	    return con;
	}
}
