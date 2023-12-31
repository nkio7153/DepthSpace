package com.depthspace.attractions.model.attractionsImages;

import java.util.List;

import com.depthspace.attractions.model.AttractionsImagesVO;
import com.depthspace.member.model.MemVO;

public interface AttractionsImagesDAO_Interface {
	public void insert(AttractionsImagesVO AttractionsImagesVO);
	 public void update(AttractionsImagesVO AttractionsImagesVO);
	 public void delete(Integer attractionsImagesId);
	 public AttractionsImagesVO findByPrimaryKey(Integer attractionsImagesId);
	 public List<AttractionsImagesVO> getAll();
}
