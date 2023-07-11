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

import com.dto.CreateUserDTO;
import com.dto.LockUserDTO;
import com.dto.UnLockUserDTO;
import com.dto.UpdateUserDTO;
import com.entity.User;
import com.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("")
	public String home() {
		return "admin/home";
	}
	
	@GetMapping("/listUsers")
	public String listUser(Model theModel) {

		// get users from the DAO
		List<User> theUsers = userService.getUsers();

		// add the users to the model
		theModel.addAttribute("users", theUsers);

		return "admin/account";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") CreateUserDTO theUser) {
		userService.saveUser(theUser);
		return "redirect:/admin/listUsers";
	}
	
	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") UpdateUserDTO dto) {
		userService.updateUser(dto);
		return "redirect:/admin/listUsers";
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser(@RequestParam("userID") int theId) {
		// delete the user
		userService.deleteUser(theId);
		return "redirect:/admin/listUsers";
	}
	
	@PostMapping("/lockUser")
	public String lockUser(@ModelAttribute("user") LockUserDTO dto) {
		// lock the user
		userService.lockUserDTO(dto);
		return "redirect:/admin/listUsers";
	}
	
	@PostMapping("/unLockUser")
	public String unLockUser(@ModelAttribute("user") UnLockUserDTO dto) {
		// unLock the user
		userService.unLockUserDTO(dto);
		return "redirect:/admin/listUsers";
	}
}
