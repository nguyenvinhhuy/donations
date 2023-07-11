package com.dto;

import lombok.Data;

@Data
public class UpdateDonationDTO {
	private int id;
	private String code;
	private String name;
	private String startDate;
	private String endDate;
	private String organizationName;
	private String phoneNumber;
	private String description;
}
