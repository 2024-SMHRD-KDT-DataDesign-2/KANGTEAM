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
import com.smhrd.entity.load;
import com.smhrd.mapper.jsonMapper;

@RestController
@RequestMapping("/api")
public class JsonUpload {
	@Autowired
	private jsonMapper jsonmapper;

	@RequestMapping(value = "/clipUpload", method = RequestMethod.POST)
	public String clipUpload(@RequestBody Map<String, Object> userAddress, HttpSession session) {
		System.out.println("userAddress: " + userAddress);
		User user = (User)session.getAttribute("info");
		System.out.println(user.toString());
		load data = (load) session.getAttribute("req");
		System.out.println(data.toString());

		clipJson clip = new clipJson();

		String img_url = (String) userAddress.get("img_url"); // 여러 개의 URL
		Object jsonObject = userAddress.get("json");

		Map<String, Object> json = (Map<String, Object>) jsonObject;
		String resultString = (String) json.get("result");
		String uuid = (String) json.get("uuid");

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

//		User user = (User) session.getAttribute("info");
//		load data = (load) session.getAttribute("req");

		// img_url이 여러 개일 경우 분리
		String[] imgUrlList = img_url.split(",");

		for (int j = 0; j < maxKeys.length; j++) {
			System.out.println("ㅇㅅㅇ");
			clip.setImg_class(maxKeys[j]);
			clip.setUser_id(user.getUser_id()); // 예제 데이터, 실제 사용자 정보를 사용하려면 주석 해제
			clip.setImg_url(imgUrlList[j].trim()); // URL 순차적으로 사용
			clip.setImg_title(data.getImg_title());
			clip.setImg_size(data.getImg_size().get(j).toString());
			clip.setImg_id(uuid); // UUID는 이미지마다 다를 수 있다면 여기도 수정 필요
			clip.setImg_content(data.getImg_content());

			jsonmapper.clipInsert(clip);

		}

		// 결과 반환
		return "Key with max value: " + maxKeys[0] + " (Value: " + maxValues[0] + ")";
	}
}
