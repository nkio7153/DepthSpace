package com.depthspace.ticketorders.model.ticketorders.jdbc;

import com.depthspace.ticketorders.model.ticketorders.TicketOrdersVO;

import java.util.List;

public interface ToDao {
    public void insert(TicketOrdersVO tod);
    public void update(TicketOrdersVO tod);
    public void delete(Integer orderId);
    public TicketOrdersVO findByPrimaryKey(Integer orderId);
    public List<TicketOrdersVO> getAll();
}
