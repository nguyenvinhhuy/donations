package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.CreateUserDonationDTO;
import com.dto.LoginDTO;
import com.entity.Donation;
import com.entity.User;
import com.entity.UserDonation;
import com.service.DonationService;
import com.service.UserDonationService;
import com.service.UserService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;
	
	@Autowired
	private UserService userService;
	
//	@GetMapping("/")
//	public String home(Model theModel) {
//		// get donations from the Service
//		List<Donation> theDonations = donationService.getDonations();
////		List<UserDonation> theUserDonation = userDonationService.getUserDonations();
//		
//		// add the donations to the model
//		theModel.addAttribute("donations", theDonations);
////		theModel.addAttribute("userDonations", theUserDonation);
//		
//		return "public/home";
//	}
	
	@GetMapping("/")
	public String home(HttpSession session, Model theModel, @RequestParam(name = "page", defaultValue = "1") int page_id) {
		int limit = 5;
		int offset = (page_id - 1)*limit;
		List<Donation> theDonations = donationService.getDonationsByPage(offset, limit);
		theModel.addAttribute("donations", theDonations);
		
		int totalPage = (int) Math.ceil(donationService.countDonation()*1.0/limit);
		theModel.addAttribute("totalPage", totalPage);
		
		return "public/home";
	}
	
	@GetMapping("/detail")
	public String detailDonation(@RequestParam("donationID") int theId, Model theModel) {
		Donation theDonationById = donationService.getDonationById(theId);
		theModel.addAttribute("donation", theDonationById);
		donationService.getDonationById(theId);
		
		Long sumMoneyUserDonation = userDonationService.sumMoneyUserDonation(theId);
		theModel.addAttribute("sumMoneyUserDonation", sumMoneyUserDonation);
		userDonationService.sumMoneyUserDonation(theId);
		
		List<UserDonation> theUserDonationAcceptedByDonationId = userDonationService.getUserDonationAcceptedByDonationId(theId);
		theModel.addAttribute("userDonationsAccepted", theUserDonationAcceptedByDonationId);
		userDonationService.getUserDonationAcceptedByDonationId(theId);
		
		return "public/detail";
	}
	
	@PostMapping("/saveUserDonation")
	public String saveUserDonation(@ModelAttribute("userDonation") CreateUserDonationDTO theUserDonation) {
		userDonationService.saveUserDonation(theUserDonation);
		return "redirect:/detail?donationID=" + theUserDonation.getDonation();
	}
	
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@PostMapping("/doLogin")
	public String login(HttpServletRequest request, @ModelAttribute("user") LoginDTO dto) {
			User user = userService.isUsers(dto);
			if(user != null) {
				HttpSession session = request.getSession(true);
				session.setAttribute("loggedinUser", user);
				return "redirect:/";
			}else {
				HttpSession session = request.getSession(true);
				session.setAttribute("error", "error");
				return "redirect:/login";
			}				
	}
	
	@GetMapping	("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
