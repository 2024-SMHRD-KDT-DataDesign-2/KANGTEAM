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
	
	@RequestMapping("/")
	public String goMainPage_go() {
		
		return "MainPage";
	}
	
	@RequestMapping("/MyPage")
	public String goMyPage() {
		return "MyPage";
	}
	
	@RequestMapping("/home")
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
	
	@RequestMapping("/SearchPage")
	public String goSearchPage() {
		return "SearchPage" ;
	}
	
	@RequestMapping("/DataResultPage")
	public String goDataResultPage() {
		return "DataResultPage" ;
	}
	
	@RequestMapping("/PaymentPage")
	public String goPaymentPage() {
		return "PaymentPage" ;
	}
	
	@RequestMapping("/TutorialPage")
	public String goTutorialPage() {
		return "TutorialPage" ;
	}
}
