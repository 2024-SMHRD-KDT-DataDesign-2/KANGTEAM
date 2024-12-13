package com.smhrd.data_at;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.User;
import com.smhrd.entity.credit;
import com.smhrd.mapper.creditMapper;

@Controller
public class CreditController {
	@Autowired
	private creditMapper creditMapper;

	@Autowired
	private com.smhrd.mapper.userMapper userMapper; // UserMapper 추가

	@RequestMapping("/purchase")
	public String purchase(@RequestParam("amount") int amount, Model model) {
		model.addAttribute("amount", amount);
		return "credit_pay"; // 결제 페이지로 이동
	}

	@RequestMapping(value = "/processPayment", method = RequestMethod.POST)
	public String processPayment(@RequestParam("amount") int amount, HttpSession session, Model model) {
// 세션에서 사용자 ID 가져오기
		User user = (User) session.getAttribute("info"); // 세션에서 User 객체를 가져옴

// 크레딧 정보 저장
		credit credit = new credit();
		credit.setCredit_type("카드");
		credit.setCredit_reason("구매");
		credit.setCredit_cnt(amount);
		credit.setUser_id(user.getUser_id()); // 세션에서 가져온 userId 사용

		// 크레딧 정보를 DB에 저장하고, 성공한 행의 수를 반환받음
		int creditResult = creditMapper.insertCredit(credit);

		// 사용자 크레딧 업데이트
		user.setUser_credit(user.getUser_credit() + amount); // 크레딧 증가
		int userResult = userMapper.updateUserCredit(user); // 업데이트된 사용자 크레딧 DB에 저장

		// 성공 여부 확인
		if (creditResult > 0 && userResult > 0) {
			model.addAttribute("message", "크레딧 " + amount + "이(가) 성공적으로 충전되었습니다!");
		} else {
			model.addAttribute("message", "크레딧 충전 또는 사용자 크레딧 업데이트에 실패했습니다.");
		}

		return "credit_result"; // 결과 페이지로 이동
	}
}
