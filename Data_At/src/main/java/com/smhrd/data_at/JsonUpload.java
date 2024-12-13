package com.smhrd.data_at;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.User;
import com.smhrd.entity.clipJson;
import com.smhrd.mapper.jsonMapper;

@RestController
@RequestMapping("/api")
public class JsonUpload {
   @Autowired
   private jsonMapper jsonmapper;

   @RequestMapping(value = "/clipUpload", method = RequestMethod.POST)
   public String clipUpload(@RequestBody Map<String, Object> userAddress, HttpSession session) {
      System.out.println("userAddress: " + userAddress);
      
      clipJson clip = new clipJson() ;
      
      String img_url = (String) userAddress.get("img_url");
      Object jsonObject = userAddress.get("json");

      Map<String, Object> json = (Map<String, Object>) jsonObject;
       String resultString = (String) json.get("result");
       
       // resultString을 Map으로 변환
       ObjectMapper objectMapper = new ObjectMapper();
       Map<String, Object> resultMap;
       try {
           resultMap = objectMapper.readValue(resultString, Map.class);
       } catch (Exception e) {
           return "Error parsing result JSON: " + e.getMessage();
       }
       
       // resultMap에서 results 추출
       List<Map<String, Object>> address = (List<Map<String, Object>>) resultMap.get("results");
       
       String[] maxKeys = new String[address.size()];
        double[] maxValues = new double[address.size()];

      // 모든 키를 순회하며 최대값 찾기
       for (int i = 0; i < address.size(); i++) {
               Map<String, Object> entry = address.get(i);
               String maxKey = null;
               double maxValue = Double.MIN_VALUE; // 최소값으로 초기화

               for (Map.Entry<String, Object> innerEntry : entry.entrySet()) {
                   String key = innerEntry.getKey();
                   // Object를 Double로 변환
                   Double value = Double.valueOf(innerEntry.getValue().toString());

                   if (value > maxValue) {
                       maxValue = value;
                       maxKey = key; // 최대값을 가진 키 업데이트
                   }
               }
               // 각 리스트의 최대값과 키 저장
               maxKeys[i] = maxKey;
               maxValues[i] = maxValue;
           }
      
      User user = (User)session.getAttribute("info") ;
      
      for(int i = 0; i < maxKeys.length; i++) {
         clip.setImg_class(maxKeys[i]) ;
   //      clip.setUser_id(user.getUser_id()) ;
         clip.setUser_id("test") ;
         clip.setImg_url(img_url) ;
         clip.setImg_title("test") ;
         clip.setImg_size(200) ;
         clip.setImg_id(2000) ;
         clip.setImg_content("test") ;

         jsonmapper.clipInsert(clip);
      }

      // 결과 반환
      return "Key with max value: " + maxKeys[0] + " (Value: " + maxValues[0] + ")";
   }
}
