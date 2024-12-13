package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class myBoard {
	private String user_id ;
	private String user_nick ;
	private String img_title ;
	private String created_at ;
	private String img_class ;
	private String img_size ;
	
}
