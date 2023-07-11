package com.dao;

import java.util.List;

import com.entity.Donation;

public interface DonationDAO {
	public List<Donation> getDonations();

	public void saveDonation(Donation theDonation);

	public void deleteDonation(int theId);
	
	public Donation getDonationById(int theId);
	
	public List<Donation> getDonationsByPage(int pageId, int total);
		
	public long countDonation();
}
