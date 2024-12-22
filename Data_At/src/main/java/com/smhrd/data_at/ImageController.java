package com.smhrd.data_at;

import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.chart;
import com.smhrd.entity.search;
import com.smhrd.mapper.ImageDetail;


@Controller
public class ImageController {
	
	@Autowired
	private ImageDetail imagedetail;
	

	@RequestMapping("/detailPage")
	public String getDetailPage(@RequestParam("img_idx") String imgIdx, Model model) {
		// img_idx를 이용해 데이터베이스에서 상세 정보 가져오기

		search detail = imagedetail.getImageDetailById(Integer.parseInt(imgIdx));
		List<String> classes = imagedetail.getClasses(detail.getImg_id()) ;
		
		// 데이터 모델에 추가
		model.addAttribute("detail", detail);
		model.addAttribute("classes", classes);

		// 상세 페이지로 이동
		return "DataDetailPage";
	}

	@RequestMapping("/{filename}")
	public ResponseEntity<?> processImage(@PathVariable String img_id) {
		try {
			// 1. Flask 서버에서 이미지 다운로드
			String flaskUrl = "http://112.217.124.195:30010/" + img_id;
			RestTemplate restTemplate = new RestTemplate();
			byte[] imageBytes = restTemplate.getForObject(new URI(flaskUrl), byte[].class);

			// 2. 이미지 처리 로직 (여기선 예시로 이미지 이름과 크기를 JSON으로 반환)
			int imageSize = imageBytes.length;

			// 3. JSON 형태로 응답
			Map<String, Object> response = new HashMap<>();
			response.put("img_id", img_id);
			response.put("size", imageSize);
			response.put("status", "processed");

			// 응답 반환
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Error processing image: " + e.getMessage());
		}
	}
	
	
	@RequestMapping(value = "/jsonImageSelect", method = RequestMethod.POST)
	public ResponseEntity<String> getImageJson(@RequestParam("img_id") String img_id) {
		List<String> imgUrl = imagedetail.getImageJson(img_id) ;
		System.out.println("jsonImageSelect : " + imgUrl);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String json = "" ;
		
		try {
            json = objectMapper.writeValueAsString(imgUrl);
            System.out.println("JSON: " + json);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		return ResponseEntity.ok(json);
	}
	
	@RequestMapping(value = "/chartJson", method = RequestMethod.POST)
	public ResponseEntity<String> chartJson(@RequestParam("img_id") String img_id) {
		List<chart> chartJson = imagedetail.getChart(img_id) ;
		
		ObjectMapper objectMapper = new ObjectMapper();
		String json = "" ;
		
		try {
            json = objectMapper.writeValueAsString(chartJson);
            System.out.println("JSON: " + json);
            System.out.println("chartJson: " + chartJson);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		return ResponseEntity.ok(json);
	}
}
