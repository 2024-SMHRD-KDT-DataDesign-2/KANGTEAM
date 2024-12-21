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

   @Insert("insert into tb_credit(credit_type,credit_reason, credit_cnt, user_id) values('업로드','지불',50,#{user_id})")
   public int inserusercredit(String user_id);
}
