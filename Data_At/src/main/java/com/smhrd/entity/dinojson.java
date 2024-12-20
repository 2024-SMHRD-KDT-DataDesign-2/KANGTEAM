package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
@ToString // 객체 안에 있는 필드 값들을 문자열로 보여줌
public class dinojson {
	private String img_id;
	private Double data_img_x1;
	private Double data_img_y1;
	private Double data_img_x2;
	private Double data_img_y2;
	private String data_class;
	private String img_url;
}

