package com.dto;

import lombok.Data;

@Data
public class CreateDonationDTO {
	private String code;
	private String name;
	private String description;
	private String organizationName;
	private String phoneNumber;
	private String startDate;
	private String endDate;
}
