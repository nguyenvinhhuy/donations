package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Role;
import com.service.RoleService;

@Controller
@RequestMapping("/admin")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@GetMapping("/listRole")
	public String listRole(Model theModel) {

		// get customers from the DAO
		List<Role> theRoles = roleService.getRoles();

		// add the customers to the model
		theModel.addAttribute("users", theRoles);

		return "admin/account";
	}
}
