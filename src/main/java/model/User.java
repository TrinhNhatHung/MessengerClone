package model;

import java.sql.Date;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String address;
	private String city;
	private String country;
	private Date dateOfBirth;
	private String gender;
	private String phone;
	private String profile;
	private String forgottenAnswer;

	public User() {
		super();
	}

	private User(Builder builder) {
		this.id = builder.id;
		this.username = builder.username;
		this.password = builder.password;
		this.email = builder.email;
		this.city = builder.city;
		this.country = builder.country;
		this.address = builder.address;
		this.dateOfBirth = builder.dateOfBirth;
		this.gender = builder.gender;
		this.phone = builder.phone;
		this.profile = builder.profile;
		this.forgottenAnswer = builder.forgottenAnswer;
	}
	
	
	
	public int getId() {
		return id;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getGender() {
		return gender;
	}

	public String getPhone() {
		return phone;
	}

	public String getProfile() {
		return profile;
	}

	public String getForgottenAnswer() {
		return forgottenAnswer;
	}
	
	public String getAddress() {
		return address;
	}

	public String getCity() {
		return city;
	}

	public String getCountry() {
		return country;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public static Builder builder () {
		return new Builder();
	}

	public static class Builder {
		private int id;
		private String username;
		private String password;
		private String email;
		private String address;
		private String city;
		private String country;
		private Date dateOfBirth;
		private String gender;
		private String phone;
		private String profile;
		private String forgottenAnswer;
		
		public Builder id(int id) {
			this.id = id;
			return this;
		}
		
		public Builder username(String name) {
			this.username = name;
			return this;
		}
		
		public Builder password(String password) {
			this.password = password;
			return this;
		}
		
		public Builder email(String email) {
			this.email = email;
			return this;
		}
		
		public Builder address(String address) {
			this.address = address;
			return this;
		}
		
		public Builder city(String city) {
			this.city = city;
			return this;
		}
		
		public Builder country(String country) {
			this.country = country;
			return this;
		}
		
		public Builder dateOfBirth(Date dateOfBirth) {
			this.dateOfBirth = dateOfBirth;
			return this;
		}
		
		public Builder gender(String gender) {
			this.gender = gender;
			return this;
		}
		
		public Builder phone(String phone) {
			this.phone = phone;
			return this;
		}
		
		public Builder profile(String profile) {
			this.profile = profile;
			return this;
		}
		
		public Builder forgottenAnswer(String forgottenAnswer) {
			this.forgottenAnswer = forgottenAnswer;
			return this;
		}
		
		public User build () {
			return new User(this);
		}
	}
}
