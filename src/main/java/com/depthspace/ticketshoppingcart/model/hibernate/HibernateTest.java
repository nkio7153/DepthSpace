package com.depthspace.ticketshoppingcart.model.hibernate;

import com.depthspace.ticketshoppingcart.model.TicketShoppingCartVO;
import com.depthspace.utils.HibernateUtil;
import org.hibernate.Session;

public class HibernateTest {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //岔入
        try{
            session.beginTransaction();
            HbTscDaoImpl hbTscDAO = new HbTscDaoImpl(session.getSessionFactory());
            TicketShoppingCartVO tsc = new TicketShoppingCartVO();
            tsc.setMemId(7);
            tsc.setTicketId(324003);
            tsc.setQuantity(1);
            hbTscDAO.insert(tsc);
            session.getTransaction().commit();
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
        }finally {
            HibernateUtil.shutdown();
        }
    }
}
