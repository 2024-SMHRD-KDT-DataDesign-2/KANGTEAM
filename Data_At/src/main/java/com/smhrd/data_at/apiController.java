package com.smhrd.data_at;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.dinojson;
import com.smhrd.mapper.dinoJson ;

@Controller
public class apiController {
   @Autowired
   private dinoJson dinoJson;
   
   public String classifypost(String apiURL, String base64Image, String classes) {
      String body = null ;
      try {
         // HttpClient 생성
         CloseableHttpClient client = HttpClients.createDefault();

         // POST 메소드 URL 생성
         HttpPost postRequest = new HttpPost(apiURL);

         // 헤더 설정
         postRequest.addHeader("Content-Type", "application/json");

         // JSON Body 생성         
         String jsonBody = String.format("{\"image\": \"%s\", \"classes\": \"%s\"}", base64Image, classes);
         StringEntity entity = new StringEntity(jsonBody);
         postRequest.setEntity(entity);

         // POST 요청 실행
         HttpResponse response = client.execute(postRequest);

         // Response 출력
         if (response.getStatusLine().getStatusCode() == 200) {
            ResponseHandler<String> handler = new BasicResponseHandler();
            body = handler.handleResponse(response);
            System.out.println("Response: " + body);
         } else {
            System.out.println("response is error: " + response.getStatusLine().getStatusCode());
         }

         // 클라이언트 종료
         client.close();

         return body ;
      }
      catch (Exception e) {
         System.err.println(e.toString());
         return null ;
      }
      
   }
   
   public void detectpost(String apiURL, String base64Image, String classes, int img_idx) {
      try (CloseableHttpClient client = HttpClients.createDefault()) {
         HttpPost postRequest = new HttpPost(apiURL);
         postRequest.addHeader("Content-Type", "application/json");

         String jsonBody = String.format("{\"image\": \"%s\", \"classes\": \"%s\"}", base64Image, classes);
         StringEntity entity = new StringEntity(jsonBody);
         postRequest.setEntity(entity);

         HttpResponse response = client.execute(postRequest);

         if (response.getStatusLine().getStatusCode() == 200) {
            ResponseHandler<String> handler = new BasicResponseHandler();
            String body = handler.handleResponse(response);
            System.out.println("Response: " + body);

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(body);
            JsonNode boxes = jsonNode.get("boxes");
            JsonNode phrases = jsonNode.get("phrases");

            List<dinojson> boxList = new ArrayList<dinojson>();
            for (int i = 0; i < boxes.size(); i++) {
               JsonNode box = boxes.get(i);
               String data_class = phrases.get(i).asText();

               double data_img_x1 = box.get(0).asDouble();
               double data_img_y1 = box.get(1).asDouble();
               double data_img_x2 = box.get(2).asDouble();
               double data_img_y2 = box.get(3).asDouble();

               dinojson newBox = new dinojson(img_idx,data_img_x1, data_img_y1, data_img_x2, data_img_y2, data_class);
               boxList.add(newBox);
            }

            for (dinojson box : boxList) {
               dinoJson.save(box);
            }
         } else {
            System.out.println("response is error: " + response.getStatusLine().getStatusCode());
         }

      } catch (Exception e) {
         System.err.println(e.toString());
         e.printStackTrace();
      }
   }
}
