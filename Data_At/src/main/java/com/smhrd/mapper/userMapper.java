package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
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

   public int updateUserCredit(User user);

   @Delete("delete from tb_user where user_id = #{user_id}")
   public int userDelete(String user_id);

   // 사용자 ID로 사용자 정보 조회
   @Select("SELECT * FROM tb_user WHERE user_id = #{user_id}")
   User findByUserId(String userId);

   // 사용자 정보 저장
   @Insert("INSERT INTO tb_user (user_id, user_nick) VALUES (#{user_id}, #{user_nick})")
   void saveUser(User user);

   // 사용자 정보 삭제
   @Delete("DELETE FROM tb_user WHERE user_id = #{user_id}")
   void deleteUser(String user_id);

   @Update("update tb_user set user_credit = #{credit} where user_id = #{user_id} ")
   public int  usecredit(String user_id, int credit);
}