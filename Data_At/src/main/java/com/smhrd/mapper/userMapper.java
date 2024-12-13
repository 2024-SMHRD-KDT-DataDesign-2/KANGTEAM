package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.entity.User;

@Mapper
public interface userMapper {

	@Select("select * from tb_user")
	public List<User> boardCount();

	// 회원가입 (insert -> int(1->가입성공, 0->가입실패))
	public int join(User user);

	public User login(User user);

	@Select("select * from tb_user where user_id = #{user_id}")
	public List<User> userInfo(String user_id);
	
	int updateUserCredit(User user);
	
}