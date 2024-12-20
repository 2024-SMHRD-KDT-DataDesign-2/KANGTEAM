package com.smhrd.data_at;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		// 데이터 모델에 추가
		model.addAttribute("detail", detail);

		// 상세 페이지로 이동
		return "DataDetailPage";
	}
}
