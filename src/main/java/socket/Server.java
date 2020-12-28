package socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import model.UsersChat;

@ServerEndpoint (value = "/server")
public class Server {
	
	private static List<Session> users = new ArrayList<>();
	
	@OnOpen
	public void handleOpen(Session userSession) {
		users.add(userSession);
	}

	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		Gson gson = new Gson();
		KindMessage kindMessage = gson.fromJson(message, KindMessage.class);
		if (kindMessage.getKind().equals("open")) {
			userSession.getUserProperties().put("id", kindMessage.getSession());
			sendOnlineUsers(users);
		} else {
//			UsersChat chat = kindMessage.getUsersChat();
//			System.out.println(chat.toString());
		}
	}

	@OnClose
	public void handeClose(Session userSession) {
		users.remove(userSession);
		sendOnlineUsers(users);
	}

	@OnError
	public void handleError(Throwable t) {
		
	}
	
	public void sendOnlineUsers (List<Session> users) {
		try {
			List<Integer> onlineUsersId = users.stream().map(user -> (Integer)user.getUserProperties().get("id")).distinct()
					    .collect(Collectors.toList());
			
			onlineUsersId = onlineUsersId.stream().distinct().collect(Collectors.toList());
			String onlineUsersIdJson = new Gson().toJson(onlineUsersId);
			
			users.forEach(user -> {
				try {
					user.getBasicRemote().sendText(onlineUsersIdJson);
				} catch (IOException e) {
					e.printStackTrace();
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private class KindMessage {
		private String kind;
		private UsersChat usersChat;
		private int session;
		
		public KindMessage() {
			super();
		}

		public KindMessage(String kind, UsersChat usersChat, int session) {
			super();
			this.kind = kind;
			this.usersChat = usersChat;
			this.session = session;
		}

		public String getKind() {
			return kind;
		}

		public void setKind(String kind) {
			this.kind = kind;
		}

		public UsersChat getUsersChat() {
			return usersChat;
		}

		public void setUsersChat(UsersChat usersChat) {
			this.usersChat = usersChat;
		}

		public int getSession() {
			return session;
		}

		public void setSession(int session) {
			this.session = session;
		}
		
	}
}
