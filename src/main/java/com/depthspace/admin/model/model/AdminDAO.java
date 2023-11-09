package com.depthspace.admin.model.model;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	void insert(AdminVO adminVO);

	int update(AdminVO adminVO);
	
	int delete(Integer id);
	 
	List<AdminVO> getAll();
	
	AdminVO findByAdminId(Integer adminId);
}