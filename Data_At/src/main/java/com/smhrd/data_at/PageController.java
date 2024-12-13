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
	
	@RequestMapping("/")
	public String go() {
		return "home" ;
	}
	
	@RequestMapping("/Login")
	public String gologin() {
		return "Login" ;
	}
	
	@RequestMapping("/Upload")
	public String goupload() {
		return "Upload" ;
	}
	
	@RequestMapping("/data")
	public String godata() {
		return "data" ;
	}
	
	@RequestMapping("/filedownload")
	public String gofiledownload() {
		return "filedownload" ;
	}
	
}
