package com.smhrd.entity;

import java.util.List;

import lombok.Data;

@Data
public class classifyRequest {
	private String classes; // 문자열
	private List<String> img_url; // 리스트
	private List<String> img_idx; // 리스트
}