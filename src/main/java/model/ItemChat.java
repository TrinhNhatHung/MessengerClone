package model;

import model.UsersChat.TypeMessage;

public class ItemChat {
	private User user;
	private String lastMessage;
	private long time;
	private KindMessage kindLastMessage;
	private StatusMessage statusMessage;
	private String typeLastMessage;
	
	public ItemChat() {
		super();
	}

	public ItemChat(User user, String lastMessage, KindMessage kindMessage,StatusMessage statusMessage ,long time, TypeMessage typeMessage) {
		super();
		this.user = user;
		this.lastMessage = lastMessage;
		this.kindLastMessage = kindMessage;
		this.time = time;
		this.statusMessage = statusMessage;
		this.typeLastMessage = typeMessage.getType();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getLastMessage() {
		return lastMessage;
	}

	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}

	public KindMessage getKindLastMessage() {
		return kindLastMessage;
	}

	public void setKindLastMessage(KindMessage kindMessage) {
		this.kindLastMessage = kindMessage;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}
	
	
	public StatusMessage getStatusMessage() {
		return statusMessage;
	}

	public void setStatusMessage(StatusMessage statusMessage) {
		this.statusMessage = statusMessage;
	}
	
	public String getTypeLastMessage() {
		return typeLastMessage;
	}

	public void setTypeLastMessage(String typeLastMessage) {
		this.typeLastMessage = typeLastMessage;
	}

	public enum KindMessage {
		SENT, REPLIES
	}
	
	public enum StatusMessage {
		SENT, SEEN
	}
}
