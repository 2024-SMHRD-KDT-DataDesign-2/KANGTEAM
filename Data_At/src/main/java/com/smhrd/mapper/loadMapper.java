package com.smhrd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.data;


@Mapper
public interface loadMapper {
   
   @Select("select img_url, data_class from tb_object_img where img_id = #{img_id}")
   public List<Map<String, String>> urlSelect(String img_id);

}