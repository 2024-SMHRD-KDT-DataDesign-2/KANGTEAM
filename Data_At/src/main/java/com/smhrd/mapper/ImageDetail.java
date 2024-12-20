package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.search;

@Mapper
public interface ImageDetail {
	@Select("SELECT * FROM tb_data_img join tb_user on tb_data_img.user_id = tb_user.user_id WHERE img_idx = #{img_idx}")
	public search getImageDetailById(int img_idx);

	@Select("SELECT distinct data_class FROM tb_object_img where img_id = #{img_id}")
	public List<String> getClasses(String img_id);
	
	@Select("SELECT img_url from tb_object_img where img_id = #{img_id}")
	public List<String> getImageJson(String img_id);
}
