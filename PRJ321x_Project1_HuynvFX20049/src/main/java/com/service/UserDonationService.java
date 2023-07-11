package com.service;

import java.util.List;

import com.dto.ActionAcceptUserDonationDTO;
import com.dto.ActionRefuseUserDonationDTO;
import com.dto.CreateUserDonationDTO;
import com.dto.UpdateTotalMoneyDonation;
import com.entity.UserDonation;

public interface UserDonationService {
	public List<UserDonation> getUserDonations();
	
	public void saveUserDonation(CreateUserDonationDTO dto);

	public List<UserDonation> getUserDonationByDonationId(int theId);

	void acceptUserDonation(ActionAcceptUserDonationDTO dto);

	void refuseUserDonation(ActionRefuseUserDonationDTO dto);

	Long sumMoneyUserDonation(int theId);
	
	List<UserDonation> getUserDonationAcceptedByDonationId(int theId);

	void updateTotalMoneyDonation(UpdateTotalMoneyDonation dto, int theId);
}
