package com.smhrd.data_at;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@Autowired
	
	@RequestMapping("/MainPage")
	public String goMainPage() {
		
		return "MainPage";
	}
	
	@RequestMapping("/MyPage")
	public String goMyPage() {
		
		return "MyPage";
	}

}
