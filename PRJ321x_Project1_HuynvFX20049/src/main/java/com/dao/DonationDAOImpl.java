package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Donation;

@Repository
public class DonationDAOImpl implements DonationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Donation> getDonations() {
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query
		Query<Donation> theQuery = currentSession.createQuery("from Donation", Donation.class);
		// execute query and get result list
		List<Donation> donations = theQuery.getResultList();
		// return the results
		return donations;
	}

	@Override
	@Transactional
	public void saveDonation(Donation theDonation) {
		Session currentSession = sessionFactory.getCurrentSession();
		// save/update the donation
		currentSession.saveOrUpdate(theDonation);
	}

	@Override
	@Transactional
	public void deleteDonation(int theId) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// delete object with primary key
		Query theQuery = currentSession.createQuery("delete from Donation where id=:donationID");
		theQuery.setParameter("donationID", theId);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public Donation getDonationById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Donation theDonation = currentSession.get(Donation.class, theId);
		return theDonation;
	}

	@Override
	@Transactional
	public List<Donation> getDonationsByPage(int pageId, int total) {
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query
		Query<Donation> theQuery = currentSession.createQuery("from Donation", Donation.class);
		theQuery.setFirstResult(pageId);
		theQuery.setMaxResults(total);
		// execute query and get result list
		List<Donation> donations = theQuery.getResultList();
		// return the results
		return donations;
	}

	@Override
	@Transactional
	public long countDonation() {
		Session currentSession;
		try {
			currentSession = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			currentSession = sessionFactory.openSession();
		}
		Query<Long> theQuery = currentSession.createQuery("select count(*) from Donation", Long.class);
		long total = theQuery.uniqueResult();
		return total;
	}
}
