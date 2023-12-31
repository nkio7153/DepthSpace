package com.depthspace.member.model.hibernate;

import java.util.List;
import java.util.Map;

import com.depthspace.attractions.model.AttractionsVO;
import com.depthspace.member.model.MemVO;

public interface HibernateMemDAO_Interface {
	// 會員註冊
	void insert(MemVO entity);

	// 會員修改
	int update(MemVO entity);
	int updatePassword(String memAcc,String memPwd);

	//刪除會員
	int delete(Integer memId);

	MemVO getById(Integer memId);
	
	MemVO findByMemAcc(String memAcc);
	
	List<MemVO> getAll();
	
	//疑問:是複合主鍵才要?
//	List<MemVO> getByCompositeQuery();

	List<MemVO> getAll(int currentPage);

	MemVO getById(String memAcc);
	MemVO findOneMem(String memAcc);

	MemVO getOneMem(Integer memId);
	
	int updateStatus(Integer memId , byte status);

	List<MemVO> searchMembers(String memName);

	List<MemVO> getByCompositeQuery(Map<String, List<String>> map);
}
