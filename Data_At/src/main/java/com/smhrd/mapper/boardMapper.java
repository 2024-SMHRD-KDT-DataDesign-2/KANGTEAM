package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.entity.myBoard;

@Mapper
public interface boardMapper {
	@Update("update tb_user set user_nick = #{user_nick} where user_id = #{user_id}")
	public int updateNick(myBoard user) ;
	
	public List<myBoard> myboardList(String user_id);
}
