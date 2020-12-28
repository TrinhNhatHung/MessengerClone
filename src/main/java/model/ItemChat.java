package model;

public class ItemChat {
	private User user;
	private String lastMessage;
	private long time;
	private KindLastMessage kindLastMessage;
	private StatusMessage statusMessage;
	
	public ItemChat() {
		super();
	}

	public ItemChat(User user, String lastMessage, KindLastMessage kindLastMessage,StatusMessage statusMessage ,long time) {
		super();
		this.user = user;
		this.lastMessage = lastMessage;
		this.kindLastMessage = kindLastMessage;
		this.time = time;
		this.statusMessage = statusMessage;
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

	public KindLastMessage getKindLastMessage() {
		return kindLastMessage;
	}

	public void setKindLastMessage(KindLastMessage kindLastMessage) {
		this.kindLastMessage = kindLastMessage;
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



	public enum KindLastMessage {
		SENT, REPLIES
	}
	
	public enum StatusMessage {
		SENT, SEEN
	}
}
