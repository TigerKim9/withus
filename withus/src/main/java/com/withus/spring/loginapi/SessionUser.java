package com.withus.spring.loginapi;

import java.io.Serializable;

import com.withus.spring.domain.UserDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SessionUser implements Serializable {

	private String name;
	private String email;
	private String picture;
	
	public SessionUser(UserDTO user) {
		this.name = user.getName();
		this.email = user.getEmail();
		this.picture = user.getPicture();
	}
	
	public SessionUser() {
		
	}

}
