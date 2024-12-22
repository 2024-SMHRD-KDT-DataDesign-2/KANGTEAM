package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.data;


@Mapper
public interface loadMapper {
	
	@Select("select img_url from tb_object_img where img_id = #{img_id}")
	public List<String> urlSelect(String img_id);

}
