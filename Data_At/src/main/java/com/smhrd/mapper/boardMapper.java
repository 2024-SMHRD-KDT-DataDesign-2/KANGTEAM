package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.entity.credit;
import com.smhrd.entity.myBoard;

@Mapper
public interface boardMapper {
	@Update("update tb_user set user_nick = #{user_nick} where user_id = #{user_id}")
	public int updateNick(myBoard user) ;
	
	public List<myBoard> myboardList(String user_id);
	
	@Select("SELECT * FROM tb_credit JOIN tb_user ON tb_credit.user_id = tb_user.user_id WHERE tb_user.user_id = #{user_id} ORDER BY created_at DESC")
	public List<credit> myCreditList(String user_id) ;
}
