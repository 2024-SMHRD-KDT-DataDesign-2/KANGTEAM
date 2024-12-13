package com.smhrd.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.clipJson;

@Mapper
public interface jsonMapper {
	@Insert("insert into tb_data_img(img_id, img_url, img_class, img_title, img_size, user_id, img_content) "
			+ "values(#{img_id}, #{img_url}, #{img_class}, #{img_title}, #{img_size}, #{user_id}, #{img_content})")
	public int clipInsert(clipJson clipjson) ;
}
