package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.User;

@Mapper
public interface userMapper {
   @Select("select * from tb_user")
   public List<User> boardCount();
}