package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Role;

@Repository
public class RoleDAOImpl implements RoleDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Role> getRoles() {
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query
		Query<Role> theQuery = currentSession.createQuery("from Role", Role.class);
		// execute query and get result list
		List<Role> roles = theQuery.getResultList();
		// return the results
		return roles;
	}

	@Override
	public Role getRoleById(Integer id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		// create a query
		Query<Role> theQuery = currentSession.createQuery("from Role where id = :id", Role.class);
		theQuery.setParameter("id", id);
		// execute query and get result list
		return theQuery.getSingleResult();
	}

}
