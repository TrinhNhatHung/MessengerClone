package model;

import model.ItemChat.StatusMessage;

public class UsersChat {
	private int id;
	private int senderId;
	private String senderName;
	private int  receiverId;
	private String receiverName;
	private String content;
	private String type;
	private StatusMessage status;
	private long time;

	public UsersChat() {
		super();
	}
	
	private UsersChat(Builder builder) {
		this.id = builder.id;
		this.senderId = builder.senderId;
		this.senderName = builder.senderName;
		this.receiverId = builder.receiverId;
		this.receiverName = builder.receiverName;
		this.content = builder.content;
		this.status = builder.status;
		this.time = builder.time;
		this.type = builder.type;
	}
	
	
	
	public int getId() {
		return id;
	}

	public int getSenderId() {
		return senderId;
	}

	public String getSenderName() {
		return senderName;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public String getContent() {
		return content;
	}
	
	public String getType() {
		return type;
	}

	public StatusMessage getStatus() {
		return status;
	}

	public long getTime() {
		return time;
	}

	public static Builder builder () {
		return new Builder();
	}
	
	public static class Builder {
		private int id;
		private int senderId;
		private String senderName;
		private int  receiverId;
		private String receiverName;
		private String content;
		private String type;
		private StatusMessage status;
		private long time;
		
		public Builder id (int id) {
			this.id = id;
			return this;
		}
		
		public Builder senderId (int senderId) {
			this.senderId = senderId;
			return this;
		}
		
		public Builder senderName (String senderName) {
			this.senderName = senderName;
			return this;
		}
		
		public Builder receiverId (int receiverId) {
			this.receiverId = receiverId;
			return this;
		}
		
		public Builder receiverName (String receiverName) {
			this.receiverName = receiverName;
			return this;
		}
		
		public Builder content (String content) {
			this.content = content;
			return this;
		}
		
		public Builder type (TypeMessage type) {
			this.type = type.getType();
			return this;
		}
		
		public Builder status (StatusMessage statusMessage) {
			this.status = statusMessage;
			return this;
		}
		
		public Builder time (long time) {
			this.time = time;
			return this;
		}
		
		public UsersChat build() {
			return new UsersChat(this);
		}
	}
	
	public enum TypeMessage {
		TEXT("text"),
		FILE ("file"),
	    IMAGE("image");
	    
	    private String type;

		private TypeMessage(String type) {
			this.type = type;
		}

		public String getType() {
			return type;
		}
	}
}
