package com.depthspace.restaurant.model.restaurant;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class RestDAOImpl implements RestDAO {
	
	private SessionFactory factory;
	
	public RestDAOImpl(SessionFactory factory) {
		this.factory = factory;
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public int add(RestVO restVO) {
		return (Integer) getSession().save(restVO);
	}

	@Override
	public int update(RestVO restVO) {
		try {
			getSession().update(restVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer restId) {
		RestVO rest = getSession().get(RestVO.class, restId);
		if (rest != null) {
			getSession().delete(rest);
			return 1;
		} else {
			return -1;
		}
	}

	@Override
	public RestVO findByPK(Integer restId) {
		return getSession().get(RestVO.class, restId);
	}

	@Override
	public RestVO findByAdmin(Integer adminId) {
		return getSession().createQuery("from RestVO where ADMIN_ID = :ADMIN_ID", RestVO.class)
										.setParameter("ADMIN_ID", adminId)
										.uniqueResult();
	}

	@Override
	public List<RestVO> getAll() {
		return getSession().createQuery("from RestVO", RestVO.class).list();
	}

	@Override
	public List<RestVO> showRest() {
		return getSession().createQuery("from RestVO where REST_STATUS = 1", RestVO.class).list();
	}

	@Override
	public List<RestVO> sreach(Map<String, String> map) {
		CriteriaBuilder builder = getSession().getCriteriaBuilder();
        CriteriaQuery<RestVO> criteria = builder.createQuery(RestVO.class);
        Root<RestVO> root = criteria.from(RestVO.class);

        List<Predicate> predicates = new ArrayList<>();

        
        for (Map.Entry<String, String> row : map.entrySet()) {
        	if (row.getValue() != null) {
	            if ("restAddress".equals(row.getKey())) {
	            	predicates.add(builder.like(root.get("restAddress"), "%" + row.getValue() + "%"));
	            }
	
	            if ("restType".equals(row.getKey())) {
	                predicates.add(builder.equal(root.get("restType"), row.getValue()));
	            }
	
	            if ("restName".equals(row.getKey())) {
	                predicates.add(builder.like(root.get("restName"), "%" + row.getValue() + "%"));
	            }
        	}
		}
        

        criteria.where(predicates.toArray(new Predicate[0]));

        return getSession().createQuery(criteria).getResultList();
    } 


	
	
}
