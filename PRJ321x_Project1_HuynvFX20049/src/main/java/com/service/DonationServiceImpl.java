package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.DonationDAO;
import com.dto.ActionActiveDonationDTO;
import com.dto.ActionCloseDonationDTO;
import com.dto.ActionEndDonationDTO;
import com.dto.CreateDonationDTO;
import com.dto.UpdateDonationDTO;
import com.entity.Donation;

@Service
public class DonationServiceImpl implements DonationService {

	@Autowired
	private DonationDAO donationDAO;
	
	@Override
	@Transactional
	public List<Donation> getDonations() {
		return donationDAO.getDonations();
	}

	@Override
	@Transactional
	public void saveDonation(CreateDonationDTO dto) {
		Donation donation = new Donation();
		donation.setCode(dto.getCode());
		donation.setName(dto.getName());
		donation.setStartDate(dto.getStartDate());
		donation.setEndDate(dto.getEndDate());
		donation.setOrganizationName(dto.getOrganizationName());
		donation.setPhoneNumber(dto.getPhoneNumber());
		donation.setDescription(dto.getDescription());	
	
		donationDAO.saveDonation(donation);
	}

	@Override
	@Transactional
	public void deleteDonation(int theId) {
		donationDAO.deleteDonation(theId);	
	}

	@Override
	@Transactional
	public Donation getDonationById(int theId) {
		return donationDAO.getDonationById(theId);
	}
	
	@Override
	@Transactional
	public void updateDonation(UpdateDonationDTO dto) {
		Donation donation = donationDAO.getDonationById(dto.getId());
		
		donation.setCode(dto.getCode());
		donation.setName(dto.getName());
		donation.setStartDate(dto.getStartDate());
		donation.setEndDate(dto.getEndDate());
		donation.setOrganizationName(dto.getOrganizationName());
		donation.setPhoneNumber(dto.getPhoneNumber());
		donation.setDescription(dto.getDescription());	
	
		donationDAO.saveDonation(donation);
	}

	@Override
	@Transactional
	public void activeDonation(ActionActiveDonationDTO dto) {
		Donation donation = donationDAO.getDonationById(dto.getId());
		donation.setStatus(2);
		
		donationDAO.saveDonation(donation);
	}

	@Override
	@Transactional
	public void closeDonation(ActionCloseDonationDTO dto) {
		Donation donation = donationDAO.getDonationById(dto.getId());
		donation.setStatus(3);
		
		donationDAO.saveDonation(donation);
		
	}

	@Override
	@Transactional
	public void endDonation(ActionEndDonationDTO dto) {
		Donation donation = donationDAO.getDonationById(dto.getId());
		donation.setStatus(0);
		
		donationDAO.saveDonation(donation);
		
	}

	@Override
	@Transactional
	public List<Donation> getDonationsByPage(int pageId, int total) {
        return donationDAO.getDonationsByPage(pageId, total);
    }

	@Override
	@Transactional
	public long countDonation() {
		return donationDAO.countDonation();
	}
}
