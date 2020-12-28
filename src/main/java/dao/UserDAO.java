package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

public class UserDAO {
	
	public static User checkLogin (String username, String password){		
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql = "SELECT * FROM user WHERE username= ? AND password = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
			ResultSet resultSet = statement.executeQuery();
			int count =0;
			User user = new User();
			while (resultSet.next()) {
				user = User.builder().id(resultSet.getInt("id")).username(resultSet.getString("username")).build();
				count++;
			}
			if (count > 0) {
				return user;
			} else {
				return null;
			}
		} catch (SQLException | ClassNotFoundException e) {
			return null;
		}		
	}
	
	public static User register (User user) {
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql= "INSERT INTO user (username, password,email, gender, phone) VALUES (?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql, new String[] { "id", "username","email"});
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getEmail());
			statement.setString(4, user.getGender());
			statement.setString(5, user.getPhone());
			statement.execute();
			ResultSet resultSet = statement.getGeneratedKeys();
			int rowAffected =0;
			User user2 = new User();
			if (resultSet.next()) {		
				user2 = User.builder().id(resultSet.getInt(1)).username(user.getUsername()).build();
				rowAffected++;
			}
			if (rowAffected == 0) {
				return null;
			} else {
				return user2;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		} 
	}
	
	public static User getUser (int id) {
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql = "SELECT * FROM user WHERE id =? LIMIT 1";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet resultSet = statement.executeQuery();
			User user = null;
			while (resultSet.next()) {
			    user = User.builder().id(id).username(resultSet.getString("username")).email(resultSet.getString("email"))
						 .password(resultSet.getString("password")).gender(resultSet.getString("gender")).phone(resultSet.getString("phone"))
						 .profile(resultSet.getString("profile")).address(resultSet.getString("address"))
						 .city(resultSet.getString("city")).country(resultSet.getString("country"))
						 .dateOfBirth(resultSet.getDate("date_of_birth")).build();
				break;
			}
			return user;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean update(User user) {
			
			try {
				Connection connection = ConnectionDB.getConnection();
				String sql = "UPDATE user SET ";
				if (user.getUsername() != null && user.getUsername().matches("\\s*") == false) {
					sql += "username=" + "'" + user.getUsername() + "',";
				} 
				
				if (user.getPassword() != null && user.getPassword().matches("\\s*") == false) {
					sql += "password=" + "'" + user.getPassword() + "',";
				} 

				if (user.getEmail() != null) {
					sql += "email=" + "'" + user.getEmail() + "',";
				}
				
				if (user.getPhone() != null) {
					sql += "phone=" + "'" + user.getPhone() + "',";
				}
				
				if (user.getAddress() != null) {
					sql += "address=" + "'" + user.getAddress() + "',";
				}
				
				if (user.getCity() != null) {
					sql += "city=" + "'" + user.getCity() + "',";
				}
				
				if (user.getCountry() != null) {
					sql += "country=" + "'" + user.getCountry() + "',";
				}
				
				if (user.getGender() != null) {
					sql += "gender=" + "'" + user.getGender() + "',";
				}
				
				if (user.getDateOfBirth() != null) {
					sql += "date_of_birth=" + "'" + user.getDateOfBirth() + "',";
				}
				
				sql = sql.substring(0, sql.length()-1);
				sql += "WHERE id = ?";
				
				PreparedStatement statement = connection.prepareStatement(sql);
				statement.setInt(1, user.getId());
				int result = statement.executeUpdate();
				if (result == 0) {
					return false;
				} else {
					return true;
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
				return false;
			}
	}
}
