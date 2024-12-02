package com.smhrd.data_at;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.entity.User;
import com.smhrd.mapper.userMapper;

@Controller
public class HomeController {
	@Autowired
	private userMapper userMapper;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<User> list = userMapper.boardCount();
		System.out.println(list.size());
		
		// request객체가 아닌 model에 저장
		model.addAttribute("list",list);
		
		System.out.println("히힛");
		
		return "home";
	}

}
