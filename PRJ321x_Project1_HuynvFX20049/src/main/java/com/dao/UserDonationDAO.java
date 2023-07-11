package com.dao;

import java.util.List;

import com.entity.UserDonation;

public interface UserDonationDAO {
	public List<UserDonation> getUserDonations();
	
	public void saveUserDonation(UserDonation theUserDonation);
	
	public List<UserDonation> getUserDonationByDonationId(int theId);

	public UserDonation getUserDonationById(int theId);

	Long sumMoneyUserDonation(int theId);

	List<UserDonation> getUserDonationAcceptedByDonationId(int theId);
}
