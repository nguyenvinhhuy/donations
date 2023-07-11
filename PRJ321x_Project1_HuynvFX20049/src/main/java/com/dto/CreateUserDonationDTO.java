package com.dto;

import lombok.Data;

@Data
public class CreateUserDonationDTO {
	private int money;
	private String name;
	private String text;
	private int user;
	private int donation;
}
