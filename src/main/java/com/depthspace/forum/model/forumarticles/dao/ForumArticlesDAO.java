package com.depthspace.forum.model.forumarticles.dao;

import java.util.List;

import com.depthspace.forum.model.forumarticles.ForumArticlesVO;

public interface ForumArticlesDAO {
	 int insert(ForumArticlesVO entity);
	 
	 int update(ForumArticlesVO entity);
	 
	 int delete(Integer id);
	 
	 List<ForumArticlesVO> getAll();
}