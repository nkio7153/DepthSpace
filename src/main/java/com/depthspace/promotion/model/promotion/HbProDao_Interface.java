package com.depthspace.promotion.model.promotion;

import java.util.List;

public interface HbProDao_Interface {

    int insert(PromotionVO entity);

    int update(PromotionVO entity);

    int delete(Integer id);

    PromotionVO getById(Integer id);

    List<PromotionVO> getAll();


    List<PromotionVO> getAll(int currentPage);

    long getTotal();
}