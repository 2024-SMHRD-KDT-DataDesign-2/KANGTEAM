package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.search;

@Mapper
public interface ImageDetail {
	@Select("SELECT * FROM tb_data_img WHERE img_idx = #{img_idx}")
	public search getImageDetailById(int img_idx);
}
