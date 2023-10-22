package com.depthspace.ticketorders.service;

import com.depthspace.ticketorders.model.ticketorderdetail.TicketOrderDetailVO;
import com.depthspace.ticketorders.model.ticketorderdetail.hibernate.HbTodDaoImpl;
import com.depthspace.ticketorders.model.ticketorderdetail.hibernate.HbTodDao_Interface;
import com.depthspace.ticketorders.model.ticketorders.TicketOrdersVO;
import com.depthspace.ticketorders.model.ticketorders.hibernate.HbToDaoImpl;
import com.depthspace.ticketorders.model.ticketorders.hibernate.HbToDao_Interface;
import com.depthspace.utils.HibernateUtil;

import java.util.List;

public class TicketOrderDetailService implements TicketOrderDetailService_Interface{
    private HbTodDao_Interface dao;
    //創建票券訂單dao的方法
    public TicketOrderDetailService(){

        dao=new HbTodDaoImpl(HibernateUtil.getSessionFactory());
    }
    //新增一筆訂單明細
    @Override
    public void addTod(TicketOrderDetailVO entity) {
        dao.insert(entity);
    }
    //取消一筆訂單對應訂單明細
    @Override
    public void deleteTod(Integer orderId) {
        dao.delete(orderId);
    }
    //取出一筆訂單對應訂單明細
    @Override
    public List<TicketOrderDetailVO> getAllbyOrderId(Integer orderId) {
        return dao.getByOrderId(orderId);
    }

    @Override
    public List<TicketOrderDetailVO> getAll(int currentPage, Integer orderId) {
        return null;
    }
    //取得一筆訂單列表總數
    @Override
    public long getTotal(Integer orderId) {
        return dao.getTotal(orderId);
    }
//    新增多筆訂單明細

}
