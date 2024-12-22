package com.smhrd.data_at;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.User;
import com.smhrd.mapper.creditMapper;
import com.smhrd.mapper.userMapper;

@Controller
public class classifyController {
   @Autowired
   private apiController apiCon;

   @Autowired
   private userMapper usermapper;
   
   @Autowired
   private creditMapper creditmapper;

   @Autowired
   private JsonUpload jsonUpload;

   @RequestMapping(value = "/classify", method = RequestMethod.POST)
   public ResponseEntity<Map<String, Object>> classify(HttpSession session,
         @RequestBody Map<String, String> requestBody) {
      String classes = requestBody.get("classes");
      String imgUrlsString = requestBody.get("img_url");

      if (classes == null || imgUrlsString == null) {
         Map<String, Object> errorMap = new HashMap<>();
         errorMap.put("error", "Missing required parameters: 'classes' or 'img_url'");

         return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorMap);

      }

      // 이미지 URL 처리
      String[] imgUrls = imgUrlsString.split(",");
      StringBuilder base64ImageBuilder = new StringBuilder();

      for (String url : imgUrls) {
         try {
            String base64Image = ImageToBase64Converter.ImageToBase64(url.trim());
            if (base64Image != null && !base64Image.isEmpty()) {
               if (base64ImageBuilder.length() > 0) {
                  base64ImageBuilder.append(",");
               }
               base64ImageBuilder.append(base64Image);
            }
         } catch (Exception e) {
            System.err.println("Failed to convert image URL to Base64: " + url);
            e.printStackTrace();
         }
      }

      if (base64ImageBuilder.length() == 0) {
         Map<String, Object> errorMap = new HashMap<>();
         errorMap.put("error", "Failed to convert any image to Base64");

         return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorMap);
      }

      // Classify API 호출
      String apiURL = "http://112.217.124.195:30020/classify";
      String resultJson = apiCon.classifypost(apiURL, base64ImageBuilder.toString(), classes);
      System.out.println("resultJson"+resultJson);

      if (resultJson != null) {
         // img_id를 imgUrls 배열의 첫 번째 값으로 고정
//         String img_id = imgUrls[0];

         String[] list = imgUrls[0].split("/");
         String img_id = list[list.length - 1];

         // 세션에 저장
         session.setAttribute("img_id", img_id);
         session.setAttribute("img_url", imgUrlsString);
         session.setAttribute("classes", classes);
         System.out.println("Session Data Saved - img_id: " + img_id + ", img_url: " + imgUrlsString + ", classes: " + classes);

         // JSON 결과를 DB에 저장하기 위해 JsonUpload 호출
         Map<String, Object> jsonRequest = new HashMap<>();
         jsonRequest.put("img_url", imgUrlsString);

         Map<String, Object> jsonMap = new HashMap<>();
         Map<String, Object> succes = new HashMap<>();

         jsonMap.put("result", resultJson);
         jsonMap.put("uuid", img_id);

         jsonRequest.put("json", jsonMap);

         jsonUpload.clipUpload(jsonRequest, session);

         // classify 완료 후 detect 호출
         System.out.println("Calling detect after classify...");
         detect(session); // detect 메서드 호출
         System.out.println("Detect process completed and saved to DB.");

         succes.put("result", resultJson);

         return ResponseEntity.status(HttpStatus.OK).body(succes);
      } else {
         Map<String, Object> errorMap = new HashMap<>();
         errorMap.put("error", "Missing required parameters: 'classes' or 'img_url'");

         return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorMap);
      }
   }

   @RequestMapping(value = "/detect", method = RequestMethod.POST)
   public String detect(HttpSession session) {
      String apiURL = "http://112.217.124.195:30020/detect";

      // 세션에서 데이터 불러오기
      String img_id = (String) session.getAttribute("img_id");
      String img_url = (String) session.getAttribute("img_url"); // ,로 구분된 전체 이미지 URL
      String classes = (String) session.getAttribute("classes");

      System.out.println(
            "Session Data Retrieved - img_id: " + img_id + ", img_url: " + img_url + ", classes: " + classes);

      // img_url을 개별적으로 처리
      String[] img_url_list = img_url.split(",");
      for (String singleImgUrl : img_url_list) {
         System.out.println("Processing detect for URL: " + singleImgUrl);

         try {
            // Base64로 이미지 변환
            String base64Image = ImageToBase64Converter.ImageToBase64(singleImgUrl.trim());

            // 비동기 실행 (개별 URL)
            CompletableFuture.runAsync(() -> {
               try {
                  apiCon.detectpost(apiURL, base64Image, classes, img_id, singleImgUrl);
                  System.out.println("Detect completed for URL: " + singleImgUrl);
               } catch (Exception e) {
                  System.err.println("Error during detectpost execution for URL: " + singleImgUrl);
                  e.printStackTrace();
               }
            });

         } catch (Exception e) {
            System.err.println("Failed to convert image URL to Base64: " + singleImgUrl);
            e.printStackTrace();
         }
      }

      User user = (User) session.getAttribute("info");
      System.out.println(user.getUser_credit());
      int user_credit = (user.getUser_credit() - 50);
      System.out.println(user_credit);
      System.out.println(user.getUser_id());
      usermapper.usecredit(user.getUser_id(), user_credit);
      creditmapper.inserusercredit(user.getUser_id());

      return "redirect:/";
   }
}
