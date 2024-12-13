package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
@ToString  // 객체 안에 있는 필드 값들을 문자열로 보여줌
public class User {
	private String user_id ; 
	private String user_pw ;
	private String user_nick ;
	private int user_credit;
	
	public User(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}
	
	public User(String user_id, String user_pw, String user_nick) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nick = user_nick;
	}
}

