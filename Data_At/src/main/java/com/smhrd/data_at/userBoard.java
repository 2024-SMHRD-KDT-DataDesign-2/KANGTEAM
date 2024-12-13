package com.smhrd.data_at;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.entity.User;
import com.smhrd.entity.myBoard;
import com.smhrd.mapper.boardMapper;
import com.smhrd.mapper.userMapper;

@Controller
public class userBoard {
	@Autowired
	private boardMapper boardMapper ;
	@Autowired
	private userMapper userMapper ;
	
	@RequestMapping(value = "/updateNick", method = RequestMethod.POST)
	public ResponseEntity<String> infoUpdate(HttpSession session, String user_nick) {
		System.out.println("updateNick");
		
		myBoard my_info = new myBoard() ;
		
		//User id = (User) session.getAttribute("info") ;	
		String id = "test" ;
		
		//my_info.setUser_id(id.getUser_id()) ;
		my_info.setUser_id(id) ;
		my_info.setUser_nick(user_nick) ;
		
		int res = boardMapper.updateNick(my_info) ;
		
		if(res > 0) {
			List<User> info = userMapper.userInfo(id) ;
			
			if(info != null) {
				//session.removeAttribute("info") ;
				session.setAttribute("info", info) ;
				System.out.println("session 들어감");

				return ResponseEntity.ok(user_nick) ;
			}
			else {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("닉네임 업데이트에 실패했습니다.");
			}
		}
		else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("닉네임 업데이트에 실패했습니다.");
		}
		
	}
	

}
