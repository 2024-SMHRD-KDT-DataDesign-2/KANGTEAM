package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.myBoard;
import com.smhrd.entity.search;


@Mapper
public interface dataMapper {
	
	public List<search> searchList(String search);

	public List<myBoard> myboardList(String user_id);
	
	@Select("select distinct data_class from tb_object_img")
	public List<String> suggestions();
}
