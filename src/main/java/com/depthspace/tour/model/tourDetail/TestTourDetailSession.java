package com.depthspace.tour.model.tourDetail;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.depthspace.tour.model.TourDetailVO;
import com.depthspace.tour.model.TourDetailVO.CompositeDetail;
import com.depthspace.utils.HibernateUtil;

public class TestTourDetailSession {
	public static void main(String[] args) {
		// 系統組態檔裡一定要有 <property
		// name="hibernate.current_session_context_class">thread</property> 的設定才可以
		Session s1 = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx1 = null;
		try {

			tx1 = s1.beginTransaction();
			TourDetailVO.CompositeDetail detail = new TourDetailVO.CompositeDetail(1, 1);
			TourDetailVO rest = s1.get(TourDetailVO.class, detail);
			System.out.println(rest);

			tx1.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (tx1 != null)
				tx1.rollback();
		} finally {
			HibernateUtil.shutdown();
		}
	}
}
