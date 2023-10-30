package com.depthspace.column.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;


import org.hibernate.Session;
import org.hibernate.query.Query;

import com.depthspace.column.dao.ColumnArticlesDAO;
import com.depthspace.column.dao.ColumnArticlesDAOImpl;
import com.depthspace.column.model.ColumnArticlesVO;
import com.depthspace.ticket.model.TicketVO;
import com.depthspace.utils.HibernateUtil;

public class ColumnArticlesServiceImpl implements ColumnArticlesService {

	public static final int PAGE_MAX_RESULT = 10;
	private ColumnArticlesDAO dao;

	public ColumnArticlesServiceImpl() {
		dao = new ColumnArticlesDAOImpl(HibernateUtil.getSessionFactory());
	}

	@Override
	public ColumnArticlesVO addArt(ColumnArticlesVO columnArticlesVO) {
		dao.insert(columnArticlesVO);
		return columnArticlesVO;
	}

	@Override
	public ColumnArticlesVO updateEmp(ColumnArticlesVO columnArticlesVO) {
		dao.update(columnArticlesVO);
		return columnArticlesVO;
	}

	@Override
	public void deleteEmp(Integer artiId) {
		dao.delete(artiId);
	}

	@Override
	public int getPageTotal() {
		long total = dao.getTotal();

		int pageQty = (int) (total % PAGE_MAX_RESULT == 0 ? (total / PAGE_MAX_RESULT) : (total / PAGE_MAX_RESULT + 1));
		return pageQty;
	}
	
	@Override
	public List<ColumnArticlesVO> getAllArti() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<ColumnArticlesVO> criteriaQuery = criteriaBuilder.createQuery(ColumnArticlesVO.class);
			Root<ColumnArticlesVO> root = criteriaQuery.from(ColumnArticlesVO.class);
			criteriaQuery.select(root);

			Query<ColumnArticlesVO> query = session.createQuery(criteriaQuery);

			return query.getResultList();
		} catch (Exception e) {
			throw new RuntimeException("Error", e);
		}
	}
	
	@Override
	public List<ColumnArticlesVO> getAllArti2(int currentPage) {
		List<ColumnArticlesVO> columnArticles = new ArrayList<>();

		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<ColumnArticlesVO> criteriaQuery = criteriaBuilder.createQuery(ColumnArticlesVO.class);
			Root<ColumnArticlesVO> root = criteriaQuery.from(ColumnArticlesVO.class);
			criteriaQuery.select(root);

			Query<ColumnArticlesVO> query = session.createQuery(criteriaQuery);

			// 分頁
			query.setFirstResult((currentPage - 1) * PAGE_MAX_RESULT);
			query.setMaxResults(PAGE_MAX_RESULT);

			columnArticles = query.list();
		} catch (Exception e) {
			throw new RuntimeException("Error", e);
		}

		return columnArticles;
	}

	@Override
	public ColumnArticlesVO getArtiByArtiId(Integer artiId) {
		return dao.getById(artiId);
	}

}