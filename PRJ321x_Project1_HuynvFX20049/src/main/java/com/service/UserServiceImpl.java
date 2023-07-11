package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.RoleDAO;
import com.dao.UserDAO;
import com.dto.CreateUserDTO;
import com.dto.LockUserDTO;
import com.dto.LoginDTO;
import com.dto.UnLockUserDTO;
import com.dto.UpdateUserDTO;
import com.entity.Role;
import com.entity.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private RoleDAO roleDAO;
	
	@Override
	@Transactional
	public List<User> getUsers() {
		return userDAO.getUsers();
	}

	@Override
	@Transactional
	public void saveUser(CreateUserDTO dto) {
		//Converto dto to entity
		User user = new User();
		user.setAddress(dto.getAddress());
		user.setEmail(dto.getEmail());
		user.setFullName(dto.getFullName());
		user.setNote(dto.getNote());
		user.setPassword(dto.getPassword());
		user.setPhoneNumber(dto.getPhoneNumber());
		user.setUserName(dto.getUserName());
		
		Role role = roleDAO.getRoleById(dto.getRole());
		user.setRole(role);
		
		userDAO.saveUser(user);
		
	}

	@Override
	@Transactional
	public void updateUser(UpdateUserDTO dto) {
		//Converto dto to entity
		User user = userDAO.getUserById(dto.getId());	
		user.setAddress(dto.getAddress());
		user.setEmail(dto.getEmail());
		user.setFullName(dto.getFullName());
		user.setNote(dto.getNote());
		user.setPhoneNumber(dto.getPhoneNumber());
		
		Role role = roleDAO.getRoleById(dto.getRole());
		user.setRole(role);
		
		userDAO.saveUser(user);
	}
	
	@Override
	@Transactional
	public void deleteUser(int theId) {
		userDAO.deleteUser(theId);	
	}

	@Override
	@Transactional
	public User getUserById(int theId) {
		return userDAO.getUserById(theId);
	}

	@Override
	@Transactional
	public void lockUserDTO(LockUserDTO dto) {
		User user = userDAO.getUserById(dto.getId());
		user.setStatus(0);
		
		userDAO.saveUser(user);
	}

	@Override
	@Transactional
	public void unLockUserDTO(UnLockUserDTO dto) {
		User user = userDAO.getUserById(dto.getId());
		user.setStatus(1);
		
		userDAO.saveUser(user);
	}

	@Override
	@Transactional
	public User isUsers(LoginDTO dto) {
        User user = userDAO.findByUserName(dto.getUserName());
        if (user != null && user.getPassword().equals(dto.getPassWord())) {
            return user;
        }
        return null;
    }
}
