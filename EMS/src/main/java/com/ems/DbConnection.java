package com.ems;

import java.sql.*;

public class DbConnection {

	static Connection con = null;

	public static Connection getConnection(String db_name) {
//		register driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//			create connection
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db_name, "root", "root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

}
