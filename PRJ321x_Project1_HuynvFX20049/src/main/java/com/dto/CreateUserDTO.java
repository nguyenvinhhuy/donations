package com.dto;

import lombok.Data;

@Data
public class CreateUserDTO {
	private String fullName;
	private String address;
	private String email;
	private String note;
	private String phoneNumber;
	private String userName;
	private String password;
	private Integer role;
}
