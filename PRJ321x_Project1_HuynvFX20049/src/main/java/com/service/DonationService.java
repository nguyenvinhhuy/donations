package com.service;

import java.util.List;

import com.dto.ActionActiveDonationDTO;
import com.dto.ActionCloseDonationDTO;
import com.dto.ActionEndDonationDTO;
import com.dto.CreateDonationDTO;
import com.dto.UpdateDonationDTO;
import com.entity.Donation;

public interface DonationService {
	public List<Donation> getDonations();

	public void saveDonation(CreateDonationDTO dto);

	public void deleteDonation(int theId);

	public void updateDonation(UpdateDonationDTO dto);

	public Donation getDonationById(int theId);

	public void activeDonation(ActionActiveDonationDTO dto);

	public void closeDonation(ActionCloseDonationDTO dto);

	public void endDonation(ActionEndDonationDTO dto);

	List<Donation> getDonationsByPage(int pageId, int total);
	
	public long countDonation();
}
