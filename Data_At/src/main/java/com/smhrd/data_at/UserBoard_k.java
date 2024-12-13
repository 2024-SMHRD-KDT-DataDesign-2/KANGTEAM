package com.smhrd.data_at;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;
import com.smhrd.entity.User;
import com.smhrd.entity.myBoard;
import com.smhrd.mapper.boardMapper;

@Controller
public class UserBoard_k {

	@Autowired
	private boardMapper boardMapper;
	
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
//	public List<myBoard> boardList(HttpSession session, Model model) { // public @ResponseBody List... 해도 됨
	public ResponseEntity<List<myBoard>> boardList(HttpSession session, Model model) { // public @ResponseBody List... 해도 됨
		System.out.println("보드리스트들어옴");
		
		User info = (User)session.getAttribute("info");
		List<myBoard> list = boardMapper.myboardList(info.getUser_id());
		
		System.out.println(list);
		
//		return list;

		if(list != null) {
			return ResponseEntity.ok(list) ;
		}
		else {			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(list) ;
		}
		
	}
	
	
}
