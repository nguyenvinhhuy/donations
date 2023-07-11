package com.service;

import java.util.List;

import com.dto.CreateUserDTO;
import com.dto.LockUserDTO;
import com.dto.LoginDTO;
import com.dto.UnLockUserDTO;
import com.dto.UpdateUserDTO;
import com.entity.User;

public interface UserService {
	public List<User> getUsers();

	public void saveUser(CreateUserDTO dto);

	void updateUser(UpdateUserDTO dto);
	
	public void deleteUser(int theId);

	public User getUserById(int theId);

	public void lockUserDTO(LockUserDTO dto);

	public void unLockUserDTO(UnLockUserDTO dto);

	public User isUsers(LoginDTO dto);
}
