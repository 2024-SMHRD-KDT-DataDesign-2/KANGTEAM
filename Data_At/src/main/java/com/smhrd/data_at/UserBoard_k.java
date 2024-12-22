package com.smhrd.data_at;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import com.smhrd.entity.credit;
import com.smhrd.entity.myBoard;
import com.smhrd.mapper.boardMapper;

@Controller
public class UserBoard_k {

	@Autowired
	private boardMapper boardMapper;

	@RequestMapping(value = "/creditList", method = RequestMethod.POST)
//	public List<myBoard> boardList(HttpSession session, Model model) { // public @ResponseBody List... 해도 됨
	public ResponseEntity<List<credit>> boardList(HttpSession session) { // public @ResponseBody List... 해도 됨
		System.out.println("보드리스트들어옴");

		User info = (User) session.getAttribute("info");
		System.out.println(info.getUser_id());
		List<credit> list = boardMapper.myCreditList(info.getUser_id());

		System.out.println(list);

		if (list != null) {
			System.out.println("credit 내역 200");
			return ResponseEntity.ok(list);
		} else {
			System.out.println("credit 내역 실패");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(list);
		}

	}

	@RequestMapping(value = "/userUploadList", method = RequestMethod.POST)
	   public ResponseEntity<List<myBoard>> uploadList(HttpSession session) {
	      System.out.println("보드리스트들어옴");

	      User info = (User) session.getAttribute("info");
	      List<myBoard> list = boardMapper.myboardList(info.getUser_id());

	      // 중복 제거를 위한 Set
	      Set<String> uniqueImgIds = new HashSet<>();
	      List<myBoard> filteredList = new ArrayList<>();

	      // 중복 제거 로직
	      for (myBoard board : list) {
	         if (uniqueImgIds.add(board.getImg_id())) { // Set에 추가 성공하면 중복이 아님
	            filteredList.add(board);
	         }
	      }

	      if (!filteredList.isEmpty()) {
	         System.out.println(filteredList);
	         return ResponseEntity.ok(filteredList);
	      } else {
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(filteredList);
	      }
	   }

}
