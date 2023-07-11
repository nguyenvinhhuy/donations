package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.DonationDAO;
import com.dao.UserDAO;
import com.dao.UserDonationDAO;
import com.dto.ActionAcceptUserDonationDTO;
import com.dto.ActionRefuseUserDonationDTO;
import com.dto.CreateUserDonationDTO;
import com.dto.UpdateTotalMoneyDonation;
import com.entity.Donation;
import com.entity.User;
import com.entity.UserDonation;

@Service
public class UserDonationServiceImpl implements UserDonationService {
	
	@Autowired
	private UserDonationDAO userDonationDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private DonationDAO donationDAO;
	
	@Override
	@Transactional
	public List<UserDonation> getUserDonations() {
		return userDonationDAO.getUserDonations();
	}

	@Override
	@Transactional
	public void saveUserDonation(CreateUserDonationDTO dto) {
		UserDonation userDonation = new UserDonation();
		
		userDonation.setMoney(dto.getMoney());
		userDonation.setName(dto.getName());
		userDonation.setText(dto.getText());
		
		User user = userDAO.getUserById(dto.getUser());
		userDonation.setUser(user);
		
		Donation donation = donationDAO.getDonationById(dto.getDonation());
		userDonation.setDonation(donation);
		
		userDonationDAO.saveUserDonation(userDonation);
	}

	@Override
	@Transactional
	public List<UserDonation> getUserDonationByDonationId(int theId) {
		return userDonationDAO.getUserDonationByDonationId(theId);
	}
	
	@Override
	@Transactional
	public void acceptUserDonation(ActionAcceptUserDonationDTO dto) {
		UserDonation userDonation = userDonationDAO.getUserDonationById(dto.getId());
		userDonation.setStatus(1);
		
		userDonationDAO.saveUserDonation(userDonation);
	}
	
	@Override
	@Transactional
	public void refuseUserDonation(ActionRefuseUserDonationDTO dto) {
		UserDonation userDonation = userDonationDAO.getUserDonationById(dto.getId());
		userDonation.setStatus(2);
		
		userDonationDAO.saveUserDonation(userDonation);
	}
	
	@Override
	@Transactional
	public void updateTotalMoneyDonation(UpdateTotalMoneyDonation dto,int theId) {
		UserDonation userDonation = userDonationDAO.getUserDonationById(dto.getId());
		Donation donation = donationDAO.getDonationById(theId);
		int moneyOfDonation = donation.getMoney();
		int moneyOfUserDonation = userDonation.getMoney();
		
		donation.setMoney(moneyOfDonation + moneyOfUserDonation);
		
		donationDAO.saveDonation(donation);
	}
	
	@Override
	@Transactional
	public Long sumMoneyUserDonation(int theId) {
		return userDonationDAO.sumMoneyUserDonation(theId);
	}

	@Override
	@Transactional
	public List<UserDonation> getUserDonationAcceptedByDonationId(int theId) {
		return userDonationDAO.getUserDonationAcceptedByDonationId(theId);
	}
}
