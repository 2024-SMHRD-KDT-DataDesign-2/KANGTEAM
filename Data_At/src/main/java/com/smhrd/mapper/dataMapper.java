package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.data;


@Mapper
public interface dataMapper {
	
	@Select("SELECT * FROM tb_data_img WHERE img_title LIKE CONCAT('%', #{search}, '%')")
	public List<data> searchList(String search);

}
