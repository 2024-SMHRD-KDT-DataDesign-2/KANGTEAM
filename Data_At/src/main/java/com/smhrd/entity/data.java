package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class data {

	private String img_class;
	private String img_url;
	private String img_title;
	private String created_at;
	private String user_id;
	private String img_size;
}
