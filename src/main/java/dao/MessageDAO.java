package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MessageDAO {
	public static void updateStatus (int currentUserId, int withUserId) {
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql = "UPDATE users_chat SET status = 'seen' WHERE sender = ? AND receiver = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, withUserId);
			statement.setInt(2, currentUserId);
			statement.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static long getUnRead (int currentUserId) {
		long messageUnread = 0;
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql = "SELECT COUNT(id) as message_unread FROM users_chat WHERE receiver = ? AND status = 'sent'";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, currentUserId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				messageUnread = resultSet.getLong("message_unread");
				break;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return messageUnread;
	}
	
	public static String getLastNameUnread (int currentUserId) {
		String lastNameUnread = "";
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql = "SELECT user.username as lastNameUnread FROM users_chat\r\n" + 
					"JOIN user ON users_chat.sender = user.id\r\n" + 
					"WHERE receiver = ? AND status = 'sent'\r\n" + 
					"ORDER BY time DESC\r\n" + 
					"LIMIT 1";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, currentUserId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				lastNameUnread = resultSet.getString("lastNameUnread");
				break;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return lastNameUnread;
	}
	
}
