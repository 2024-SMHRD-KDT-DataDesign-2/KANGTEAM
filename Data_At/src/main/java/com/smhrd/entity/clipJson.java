package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class clipJson {
	private int idx ;
	private String img_id ;
	private String img_url ;
	private String img_class ;
	private String created_at ;
	private String user_id ;
	private String img_title ;
	private String img_size ;
	private String img_content;
}
