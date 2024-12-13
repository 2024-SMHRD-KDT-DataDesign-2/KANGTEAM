package com.smhrd.data_at;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
		@RequestMapping("/userlogin")
		public String loginPage(User user, HttpSession session) {
			User info = userMapper.login(user);
			System.out.println("user : " + info);
			if (info != null) {
				session.setAttribute("info", info);
				System.out.println("로그인 성공!!");
				return "credit_buy";
			} else {
				System.out.println("로그인 실패!!");
				return "redirect:/Login";
			}
		}

		// 회원가입 기능
		@RequestMapping("/userjoin")
		public String joinPage(User user) {
		    System.out.println(user.toString());

		    // NULL 체크를 먼저 수행합니다.
		    if (user.getUser_id() == null || user.getUser_pw() == null || user.getUser_nick() == null) {
		        System.out.println("회원가입 실패!!");
		        return "Join"; // 실패 시 Login 페이지로 리다이렉트
		    }

		    // NULL이 아닌 경우에만 회원가입을 진행합니다.
		    int res = userMapper.join(user);

		    if (res > 0) { // 성공적으로 삽입되었는지 체크
		        System.out.println("회원가입 성공!!");
		        return "redirect:/Login"; // 성공 시 Login 페이지로 리다이렉트
		    } else {
		        System.out.println("회원가입 실패!!");
		        return "Login"; // 실패 시 Login 페이지로 리다이렉트
		    }
		}
	// 로그 아웃 기능

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("info");
		return "redirect:/";
	}

}
