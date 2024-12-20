package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.myBoard;
import com.smhrd.entity.search;


@Mapper
public interface dataMapper {
	
	public List<search> searchList(String search);

	public List<myBoard> myboardList(String user_id);
}
