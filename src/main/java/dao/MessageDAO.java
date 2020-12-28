package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}
