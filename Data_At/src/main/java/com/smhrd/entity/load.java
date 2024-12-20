package com.smhrd.entity;

import java.util.ArrayList;

import lombok.Data;

@Data
public class load {
	private String classes;
	private String img_url; // 리스트
	private String img_idx; // 리스트
	private String img_title; 
	private String img_content;
	private ArrayList<Long> img_size;
	
}