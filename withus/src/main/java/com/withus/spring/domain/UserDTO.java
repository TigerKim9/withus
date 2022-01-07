package com.withus.spring.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class UserDTO {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_aiid")
	private Long aiid;
	@Column(name="user_pw")
	private String pw; // user_pw
	@Column(name="user_name")
	private String name; // user_name
	@Column(name="user_phone")
	private String phone; // user_phone
	@Column(name="user_email")
	private String email; // user_email
	@Column(name="user_addr")
	private String addr; // user_addr
	@Column(name="user_cardnum")
	private String cardnum; // user_cardnum
	@Column(name="user_cash")
	private int cash; // user_cash
	@Column(name="user_picture")
	private String picture;
	@Column(name="user_role")
	private String role = "ROLE_USER";
	@Column(name="user_regdate")
	private LocalDateTime regDate; // user_regdate
	
	public UserDTO(String name, String email, String picture, String phone) {
		this.name = name;
		this.email = email;
		this.picture = picture;		
		this.phone = phone;
	}

	public UserDTO update(String name, String picture, String phone) {
		this.name = name;
		this.picture = picture;
		this.phone = phone;
		return this;
	}
	
	@JsonIgnore
	public LocalDateTime getRegDate() {
		return regDate;
	}
	
	@JsonProperty("regdate")
	public String getRegDateTime() {
		if (this.regDate == null)
			return "";
		return this.regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	@Override
	public String toString() {
		return String.format("%s %s", email, pw);
	}
}
