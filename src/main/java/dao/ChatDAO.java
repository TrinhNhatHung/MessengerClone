package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ItemChat;
import model.User;
import model.UsersChat;
import model.UsersChat.TypeMessage;
import model.ItemChat.KindMessage;
import model.ItemChat.StatusMessage;

public class ChatDAO {
	public static List<ItemChat> getListChatWith (int id){
		List<ItemChat> itemChats = new ArrayList<>();
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql = "";
			List<Integer> listChatWith = new ArrayList<>();
			sql = "SELECT sender as userId FROM users_chat WHERE receiver = ? UNION SELECT receiver as userId FROM users_chat WHERE sender = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			statement.setInt(2, id);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				listChatWith.add(resultSet.getInt("userId"));
			}
			
			for (Integer idChatWith : listChatWith) {
				sql = "SELECT userSender.username as senderName ,userSender.id as senderId, userSender.profile as senderProfile, \r\n" + 
						"      userReceiver.username as receiverName ,userReceiver.id as receiverId, userReceiver.profile as receiverProfile,content,status,type,time \r\n" + 
						"FROM users_chat \r\n" + 
						"JOIN user as userSender ON users_chat.sender = userSender.id \r\n" + 
						"JOIN user as userReceiver ON users_chat.receiver = userReceiver.id \r\n" + 
						"WHERE (sender = ? AND receiver = ?) OR (sender = ? AND receiver = ?) ORDER BY time DESC LIMIT 1";
				statement = connection.prepareStatement(sql);
				statement.setInt(1, id);
				statement.setInt(2, idChatWith);
				statement.setInt(3, idChatWith);
				statement.setInt(4, id);
				resultSet = statement.executeQuery();
				int senderId = 0;
				while (resultSet.next()) {
					senderId = resultSet.getInt("senderId");
					String profifileItemChat = "";
					String nameItemChat = "";
					KindMessage kindLastMessageItemChat = null;
					if (senderId == id) {
						 profifileItemChat = resultSet.getString("receiverProfile");
						 nameItemChat = resultSet.getString("receiverName");
						 kindLastMessageItemChat = KindMessage.SENT;
					} else {
						 profifileItemChat = resultSet.getString("senderProfile");
						 nameItemChat = resultSet.getString("senderName");
						 kindLastMessageItemChat = KindMessage.REPLIES;
					}
					
					User user = User.builder().id(idChatWith).profile(profifileItemChat)
							.username(nameItemChat).build();
					String content = resultSet.getString("content");
					long time = resultSet.getLong("time");
					String status = resultSet.getString("status");
					StatusMessage statusMessage = null;
					if (status.equals("sent")) {
						statusMessage = StatusMessage.SENT;
					} else {
						statusMessage = StatusMessage.SEEN;
					}
					
					TypeMessage type = TypeMessage.TEXT;
					if (TypeMessage.IMAGE.getType().equals(resultSet.getString("type"))) {
						type = TypeMessage.IMAGE;
					}
					
					if (TypeMessage.FILE.getType().equals(resultSet.getString("type"))) {
						type = TypeMessage.FILE;
					}
					
					itemChats.add(new ItemChat(user,content , kindLastMessageItemChat,statusMessage , time, type));
				}
			}
			return itemChats;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return itemChats;
		}
		
	}
	
	public static List<UsersChat> getUsersChat (int currentId, int chatWithId){
		List<UsersChat> usersChats = new ArrayList<>(); 
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql = "SELECT * FROM users_chat WHERE (sender = ? AND receiver = ?) OR (sender = ? AND receiver = ?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, currentId);
			statement.setInt(2, chatWithId);
			statement.setInt(3, chatWithId);
			statement.setInt(4, currentId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int senderId = resultSet.getInt("sender");
				int receiverId = resultSet.getInt("receiver");
				String content = resultSet.getString("content");
				StatusMessage statusMessage = StatusMessage.SENT;
				if ("seen".equals(resultSet.getString("status"))) {
					statusMessage = StatusMessage.SEEN;
				}
				TypeMessage type = TypeMessage.TEXT;
				if (TypeMessage.IMAGE.getType().equals(resultSet.getString("type"))) {
					type = TypeMessage.IMAGE;
				}
				
				if (TypeMessage.FILE.getType().equals(resultSet.getString("type"))) {
					type = TypeMessage.FILE;
				}
				long time = resultSet.getLong("time");
				UsersChat usersChat = UsersChat.builder().senderId(senderId).receiverId(receiverId).content(content)
						               .status(statusMessage).time(time).type(type).build();
			    usersChats.add(usersChat);
			}
			return usersChats;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return usersChats;
		}
	}
	
	public static boolean sendMessage (UsersChat usersChat) {
		try {
			Connection connection = ConnectionDB.getConnection();
			String sql = "INSERT INTO users_chat (sender, receiver, content, status, time, type) VALUES (?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, usersChat.getSenderId());
			statement.setInt(2, usersChat.getReceiverId());
			statement.setString(3, usersChat.getContent());
			statement.setString(4, "sent");
			statement.setLong(5, usersChat.getTime());
			statement.setString(6, usersChat.getType());
			int rowAffected = statement.executeUpdate();
			if (rowAffected == 0) {
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
