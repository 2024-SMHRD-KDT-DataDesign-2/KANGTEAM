package com.smhrd.data_at;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.smhrd.mapper.dinoJson;

@Controller
public class apiController {
	@Autowired
	private dinoJson dinoJson;

	public String classifypost(String apiURL, String base64Image, String classes) {
		try (CloseableHttpClient client = HttpClients.createDefault()) {
			HttpPost postRequest = new HttpPost(apiURL);
			postRequest.addHeader("Content-Type", "application/json");

			// JSON Body 안전하게 생성
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("image", base64Image);
			jsonMap.put("classes", classes);
			System.out.println(classes);
			String jsonBody = objectMapper.writeValueAsString(jsonMap);

			postRequest.setEntity(new StringEntity(jsonBody));

			// POST 요청 실행
			HttpResponse response = client.execute(postRequest);

			// 응답 처리
			ResponseHandler<String> handler = new BasicResponseHandler();
			String responseBody = handler.handleResponse(response);

			if (response.getStatusLine().getStatusCode() == 200) {
				System.out.println("Classify Response: " + responseBody);
				return responseBody;
			} else {
				System.err.println("classifypost Error: " + response.getStatusLine().getStatusCode());
				System.err.println("Response: " + responseBody);
			}
		} catch (Exception e) {
			System.err.println("classifypost Exception: " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	public void detectpost(String apiURL, String base64Image, String classes, String img_id, String singleImgUrl) {
		try (CloseableHttpClient client = HttpClients.createDefault()) {
			HttpPost postRequest = new HttpPost(apiURL);
			postRequest.addHeader("Content-Type", "application/json");

			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("image", base64Image);
			jsonMap.put("classes", classes);

			String jsonBody = objectMapper.writeValueAsString(jsonMap);
			postRequest.setEntity(new StringEntity(jsonBody));

			HttpResponse response = client.execute(postRequest);

			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);

				System.out.println("Detect Response for URL [" + singleImgUrl + "]: " + body);

				// 추가적으로 singleImgUrl을 포함해 결과를 DB에 저장하도록 처리
				JsonNode jsonNode = objectMapper.readTree(body);
				JsonNode boxes_list = jsonNode.get("boxes");
				JsonNode phrases_list = jsonNode.get("phrases");

				// DB 저장 로직 추가
				if (boxes_list != null && phrases_list != null) {
					for (int idx = 0; idx < boxes_list.size(); idx++) {
						for (int i = 0; i < boxes_list.get(idx).size(); i++) {
							JsonNode box = boxes_list.get(idx).get(i);
							String data_class = phrases_list.get(idx).get(i).asText();

							double img_x1 = box.get(0).asDouble();
							double img_y1 = box.get(1).asDouble();
							double img_x2 = box.get(2).asDouble();
							double img_y2 = box.get(3).asDouble();

							dinojson newBox = new dinojson(img_id, img_x1, img_y1, img_x2, img_y2, data_class,
									singleImgUrl);
							dinoJson.save(newBox);
						}
					}
				}

			} else {
				System.err.println("Detect failed for URL [" + singleImgUrl + "]: HTTP "
						+ response.getStatusLine().getStatusCode());
			}
		} catch (Exception e) {
			System.err.println("Error in detectpost for URL: " + singleImgUrl);
			e.printStackTrace();
		}
	}
}
