package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entity.UserDonation;

@Repository
public class UserDonationDAOImpl implements UserDonationDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<UserDonation> getUserDonations() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation", UserDonation.class);
		// execute query and get result list
		List<UserDonation> userDonations = theQuery.getResultList();
		return userDonations;
	}

	@Override
	@Transactional
	public void saveUserDonation(UserDonation theUserDonation) {
		Session currentSession = sessionFactory.getCurrentSession();
		// save/update the UserDonation
		currentSession.saveOrUpdate(theUserDonation);
	}

	@Override
	@Transactional
	public List<UserDonation> getUserDonationByDonationId(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation d where d.donation.id = :donationID", UserDonation.class);
		theQuery.setParameter("donationID", theId);
		List<UserDonation> userDonationsByDonationId = theQuery.getResultList();
		return userDonationsByDonationId;
	}
	
	@Override
	@Transactional
	public List<UserDonation> getUserDonationAcceptedByDonationId(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation d where d.status = 1 and d.donation.id = :donationID", UserDonation.class);
		theQuery.setParameter("donationID", theId);
		List<UserDonation> userDonationsByDonationId = theQuery.getResultList();
		return userDonationsByDonationId;
	}

	@Override
	@Transactional
	public UserDonation getUserDonationById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		UserDonation theUserDonation = currentSession.get(UserDonation.class, theId);
		return theUserDonation;
	}
	
	@Override
	@Transactional
	public Long sumMoneyUserDonation(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Long> theQuery = currentSession.createQuery("select sum(money) from UserDonation d where d.status = 1 and d.donation.id = :donationID", Long.class);
		theQuery.setParameter("donationID", theId);
		return theQuery.getSingleResult();
	}
}
