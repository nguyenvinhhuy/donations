package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.ActionAcceptUserDonationDTO;
import com.dto.ActionActiveDonationDTO;
import com.dto.ActionCloseDonationDTO;
import com.dto.ActionEndDonationDTO;
import com.dto.ActionRefuseUserDonationDTO;
import com.dto.CreateDonationDTO;
import com.dto.UpdateDonationDTO;
import com.dto.UpdateTotalMoneyDonation;
import com.entity.Donation;
import com.entity.UserDonation;
import com.service.DonationService;
import com.service.UserDonationService;

@Controller
@RequestMapping("/admin")
public class DonationController {

	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;

	@GetMapping("/listDonations")
	public String listDonations(Model theModel) {

		// get donations from the Service
		List<Donation> theDonations = donationService.getDonations();

		// add the donations to the model
		theModel.addAttribute("donations", theDonations);

		return "admin/donation";
	}

	@GetMapping("/detailDonation")
	public String detailDonation(@RequestParam("donationID") int theId, Model theModel) {
		Donation theDonationById = donationService.getDonationById(theId);
		theModel.addAttribute("donation", theDonationById);
		donationService.getDonationById(theId);
		
		Long sumMoneyUserDonation = userDonationService.sumMoneyUserDonation(theId);
		theModel.addAttribute("sumMoneyUserDonation", sumMoneyUserDonation);
		userDonationService.sumMoneyUserDonation(theId);
		
		List<UserDonation> theUserDonationByDonationId = userDonationService.getUserDonationByDonationId(theId);
		theModel.addAttribute("userDonations", theUserDonationByDonationId);
		userDonationService.getUserDonationByDonationId(theId);
		
		return "admin/detail";
	}
	
	@PostMapping("/saveDonation")
	public String saveDonation(@ModelAttribute("donation") CreateDonationDTO theDonation) {
		donationService.saveDonation(theDonation);
		return "redirect:/admin/listDonations";
	}

	@PostMapping("/deleteDonation")
	public String deleteDonation(@RequestParam("donationID") int theId) {
		// delete the donation
		donationService.deleteDonation(theId);
		return "redirect:/admin/listDonations";
	}

	@PostMapping("/updateDonation")
	public String updateDonation(@ModelAttribute("donation") UpdateDonationDTO dto) {
		donationService.updateDonation(dto);
		return "redirect:/admin/listDonations";
	}

	@PostMapping("/activeDonation")
	public String activeDonation(@ModelAttribute("donation") ActionActiveDonationDTO dto) {
		// active the donation 
		donationService.activeDonation(dto);
		return "redirect:/admin/listDonations";
	}
	
	@PostMapping("/closeDonation")
	public String closeDonation(@ModelAttribute("donation") ActionCloseDonationDTO dto) {
		// close the donation 
		donationService.closeDonation(dto);
		return "redirect:/admin/listDonations";
	}
	
	@PostMapping("/endDonation")
	public String endDonation(@ModelAttribute("donation") ActionEndDonationDTO dto) {
		// end the donation 
		donationService.endDonation(dto);
		return "redirect:/admin/listDonations";
	}
	
	@PostMapping("/acceptUserDonation")
	public String acceptUserDonation(@ModelAttribute("userDonation") ActionAcceptUserDonationDTO actionAcceptUserDonationDTO,UpdateTotalMoneyDonation updateTotalMoneyDonation,@RequestParam("donationID") int theId) {
		userDonationService.acceptUserDonation(actionAcceptUserDonationDTO);
		userDonationService.updateTotalMoneyDonation(updateTotalMoneyDonation,theId);
		return "redirect:/admin/detailDonation?donationID="+ theId;
	}
	
	@PostMapping("/refuseUserDonation")
	public String refuseUserDonation(@ModelAttribute("userDonation") ActionRefuseUserDonationDTO dto,@RequestParam("donationID") int theId) {
		userDonationService.refuseUserDonation(dto);
		return "redirect:/admin/detailDonation?donationID="+ theId;
	}
}
