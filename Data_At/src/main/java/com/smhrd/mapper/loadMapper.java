package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.data;


@Mapper
public interface loadMapper {
	
	@Select("select img_url from tb_data_img where user_id = #{user_id} and created_at = #{created_at}")
	public List<String> urlSelect(data data);

}
