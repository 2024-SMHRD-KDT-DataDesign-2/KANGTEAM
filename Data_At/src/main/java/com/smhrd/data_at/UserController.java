package com.smhrd.data_at;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.User;
import com.smhrd.mapper.userMapper;

@Controller
public class UserController {

	@Autowired
	private userMapper userMapper;

//	@RequestMapping("/userjoin")
//	public String joinPage(User user) {
//		System.out.println(user.toString());
//
//		int res = userMapper.join(user);
//
//		if (user.getUser_id() == null || user.getUser_pw() == null || user.getUser_nick() == null) {
//			System.out.println("회원가입 실패!!");
//			return "Login";
//		} else {
//			System.out.println("회원가입 성공!!");
//			return "redirect:/Login";
//
//		}
//
//	}

	// 로그인 기능
	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	public String loginPage(User user, HttpSession session) {
		User info = userMapper.login(user);
		System.out.println("user : " + info);
		if (info != null) {
			session.setAttribute("info", info);
			System.out.println("로그인 성공!!");
			return "redirect:/MainPage";
		} else {
			System.out.println("로그인 실패!!");
			return "redirect:/MainPage";
		}
	}

	// 회원가입 기능
	@RequestMapping(value = "/userjoin", method = RequestMethod.POST)
	public String joinPage(@RequestParam("user_pw_check") String check, @RequestParam("user_pw") String pw,
			@RequestParam("user_id") String id, @RequestParam("user_nick") String nick) {
		System.out.println("id : " + id);

		User user = new User();
		int res = 0 ;

		// NULL 체크를 먼저 수행합니다.
		if (id == null || pw == null || nick == null) {
			System.out.println("회원가입 실패!!");
			return "MainPage" ;
		}

		if (pw.equals(check)) {
			user.setUser_id(id) ;
			user.setUser_nick(nick) ;
			user.setUser_pw(pw) ;
			
			res = userMapper.join(user);
		}
			
		if (res > 0) { // 성공적으로 삽입되었는지 체크
			System.out.println("회원가입 성공!!");
			return "MainPage" ;
		} else {
			System.out.println("회원가입 실패!!");
			return "MainPage" ;
		}
	}
	
	// 로그 아웃 기능
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("info");
		
		System.out.println("로그 아웃 성공");
		
		return "redirect:/MainPage" ;
	}
	
	// 회원 삭제 기능
	@RequestMapping("/userDelete")
	public String userDelete(HttpSession session) {
		User user = (User) session.getAttribute("info") ;
		
		int res = userMapper.userDelete(user.getUser_id()) ;
		
		if(res > 0) {
			System.err.println("회원 탈퇴 성공");
			session.removeAttribute("info");
			return "redirect:/MainPage" ;
		}
		else return "redirect:/MyPage" ;
	}
}
