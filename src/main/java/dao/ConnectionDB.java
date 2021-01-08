package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import utils.ReadProperties;

public class ConnectionDB {
	
	public static Connection getConnection () throws ClassNotFoundException, SQLException {
		Properties properties = ReadProperties.getProperties();
		String username = properties.getProperty("username");
		String password = properties.getProperty("password");
		String url = properties.getProperty("url");
		String driverSql = properties.getProperty("driverSQL");;
		Class.forName(driverSql);
		return DriverManager.getConnection(url, username, password);
	}
}
