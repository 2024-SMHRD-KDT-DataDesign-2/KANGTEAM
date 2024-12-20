package com.smhrd.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.User;
import com.smhrd.entity.credit;

@Mapper
public interface creditMapper {
	
	int insertCredit(credit credit);
	
	@Select("SELECT * FROM tb_user WHERE user_id = #{user_id}")
    public User findUserByUserId(@Param("user_id") String userId);
}
