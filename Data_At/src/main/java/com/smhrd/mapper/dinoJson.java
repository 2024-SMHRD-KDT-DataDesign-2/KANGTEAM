package com.smhrd.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.data_img;
import com.smhrd.entity.dinojson;

@Mapper
public interface dinoJson {
	
	public int save(dinojson box);
//	List<dinojson> findAll();
	public List<data_img> getImages();
}
