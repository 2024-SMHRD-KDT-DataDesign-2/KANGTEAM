package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class credit {
	private String credit_type;
	private String credit_reason;
	private int credit_cnt;
	private String user_id;
	private int user_credit;
}
