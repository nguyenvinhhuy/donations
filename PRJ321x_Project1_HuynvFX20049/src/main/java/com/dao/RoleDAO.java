package com.dao;

import java.util.List;

import com.entity.Role;

public interface RoleDAO {
	public List<Role> getRoles();
	public Role getRoleById(Integer id);
}
