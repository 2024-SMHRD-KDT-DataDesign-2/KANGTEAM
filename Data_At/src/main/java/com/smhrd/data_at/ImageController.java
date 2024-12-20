package com.smhrd.data_at;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.credit;
import com.smhrd.entity.search;
import com.smhrd.mapper.ImageDetail;


@Controller
public class ImageController {
	
	@Autowired
	private ImageDetail imagedetail;
	
	@RequestMapping("/detailPage")
	public String getDetailPage(@RequestParam("img_idx") String imgIdx, Model model) {
		// img_idx를 이용해 데이터베이스에서 상세 정보 가져오기
		
		System.out.println("imgIdx : " + imgIdx);
		
		search detail = imagedetail.getImageDetailById(Integer.parseInt(imgIdx));

		System.out.println("detail : " + detail.toString());
		
		List<String> classes = imagedetail.getClasses(detail.getImg_id()) ;
			
		// 데이터 모델에 추가
		model.addAttribute("detail", detail);
		model.addAttribute("classes", classes);

		// 상세 페이지로 이동
		return "DataDetailPage";
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
}
