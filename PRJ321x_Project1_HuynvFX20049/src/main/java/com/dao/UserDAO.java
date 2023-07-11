package com.dao;

import java.util.List;

import com.entity.User;

public interface UserDAO {
	public List<User> getUsers();

	public void saveUser(User theUser);

	public void deleteUser(int theId);

	public User getUserById(int theId);
	
	public User findByUserName(String userName);
}
