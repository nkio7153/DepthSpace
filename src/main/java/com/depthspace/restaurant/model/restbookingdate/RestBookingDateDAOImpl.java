package com.depthspace.restaurant.model.restbookingdate;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.depthspace.restaurant.model.restbookingdate.RestBookingDateVO.CompositeDetail;

public class RestBookingDateDAOImpl implements RestBookingDateDAO {
private SessionFactory factory;
	
	public RestBookingDateDAOImpl(SessionFactory factory) {
		this.factory = factory;
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public void add(RestBookingDateVO restBookingDateVO) {
		getSession().save(restBookingDateVO);
	}

	@Override
	public int update(RestBookingDateVO restBookingDateVO) {
		try {
			getSession().update(restBookingDateVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(RestBookingDateVO restBookingDateVO) {
		RestBookingDateVO bookingDate = getSession().get(RestBookingDateVO.class, restBookingDateVO.getCompositeKey());
		if (bookingDate != null) {
			getSession().delete(bookingDate);
			return 1;
		} else {
			return -1;
		}
	}

	@Override
	public RestBookingDateVO findByPK(RestBookingDateVO restBookingDateVO) {
		return getSession().get(RestBookingDateVO.class, restBookingDateVO.getCompositeKey());
	}

	@Override
	public List<RestBookingDateVO> getAll() {
		return getSession().createQuery("from RestBookingDateVO", RestBookingDateVO.class).list();
	}
	
	
}
