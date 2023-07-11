package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<User> getUsers() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query
		Query<User> theQuery = currentSession.createQuery("from User", User.class);
		// execute query and get result list
		List<User> users = theQuery.getResultList();
		// return the results
		return users;
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		// save/update the customer
		currentSession.saveOrUpdate(theUser);
	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// delete object with primary key
		Query theQuery = currentSession.createQuery("delete from User where id=:userId");
		theQuery.setParameter("userId", theId);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public User getUserById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = currentSession.get(User.class, theId);
		return theUser;
	}

	@Override
	@Transactional
	public User findByUserName(String userName) {
		Session currentSession = null;
		 
        try {
        	currentSession = sessionFactory.getCurrentSession();
        } catch (HibernateException e) {
        	currentSession = sessionFactory.openSession();
        }


        Query<User> theQuery = currentSession.createQuery("from User u where u.userName = :userName", User.class);
        theQuery.setParameter("userName", userName);

        return theQuery.getSingleResult();
    }

}
