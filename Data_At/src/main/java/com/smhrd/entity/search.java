package com.smhrd.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class search {
   private String user_nick ;
   private String img_title ;   
   private List<String> data_class ;
   private String created_at ;
   private String img_url ;
   private String img_id ;
   private int img_idx ;
   private String img_content ;
}