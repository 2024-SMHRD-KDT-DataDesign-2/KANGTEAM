package com.smhrd.data_at;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.data_img;
import com.smhrd.mapper.dinoJson;

@Controller
public class classifyController {
	@Autowired
	private apiController apiCon;
	@Autowired
	private dinoJson dinoJson;

	@RequestMapping(value = "/classify", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> classify(HttpSession session,
			@RequestBody Map<String, String> requestBody) {
		String base64Image = "";

		String classes = requestBody.get("classes");
		String img = requestBody.get("img_url");

		img = img.replace(" ", "");
		String[] img_url = img.split(",");

		System.out.printf("classes : %s \n", classes);

		String apiURL = "http://112.217.124.195:30020/classify";
//		String apiURL = "http://127.0.0.1:30020/classify";

		for (String i : img_url) {
			base64Image += ImageToBase64Converter.ImageToBase64(i);
			if (i.equals(img_url[img_url.length - 1]))
				break;
			else
				base64Image += ",";
		}

		// String base64Image = ImageToBase64Converter.ImageToBase64(img) ;
		String resultJson = apiCon.classifypost(apiURL, base64Image, classes);

		if (resultJson != null) {
			// JSON 문자열을 Map으로 변환
			Map<String, Object> responseMap = new HashMap<String, Object>();
			responseMap.put("result", resultJson); // 필요한 데이터를 Map에 추가

			System.out.println("resultJson : " + responseMap);

			return ResponseEntity.ok(responseMap);
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@RequestMapping(value = "/detect", method = RequestMethod.POST)
	public String detect(@RequestParam String classes, @RequestParam int img_idx, @RequestParam String img_url) {
		String apiURL = "http://112.217.124.195:30020/detect";

		// tb_data_img에서 URL과 img_idx를 가져옴
		List<data_img> images = dinoJson.getImages();
//      for (data_img image : images) {
//         String base64Image = ImageToBase64Converter.ImageToBase64(image.getImg_url());
//         post(apiURL, base64Image, classes);
//      }
		String base64Image = ImageToBase64Converter.ImageToBase64(img_url);
		CompletableFuture.runAsync(() -> apiCon.detectpost(apiURL, base64Image, classes, img_idx));
		return "redirect:/";
	}
}
