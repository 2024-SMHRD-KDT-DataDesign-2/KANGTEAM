package com.smhrd.data_at;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.entity.search;
import com.smhrd.mapper.dataMapper;

@Controller
public class dataSearchController {
	@Autowired
	public dataMapper datamapper;

	@RequestMapping(value = "/dataSearch", method = RequestMethod.GET)
	public String dataSearchList(Model model, @RequestParam("search") String search) {
		List<search> searchList = datamapper.searchList(search);

		// Flask 서버의 URL 생성
		String flaskBaseUrl = "http://112.217.124.195:30010/download/";
		Map<String, Set<String>> srcToDataClassesMap = new HashMap<>();

		// 중복 제거 및 URL 설정
		for (search result : searchList) {
			String imgUrl = flaskBaseUrl + result.getImg_id();

			// URL별로 data_class를 그룹화
			srcToDataClassesMap.computeIfAbsent(imgUrl, k -> new HashSet<>()).add(result.getData_class());
			result.setImg_url(imgUrl);
		}

		// 중복 제거된 결과로 새로운 리스트 생성
		List<search> filteredSearchList = new ArrayList<>();
		for (search result : searchList) {
			String imgUrl = result.getImg_url();
			if (!filteredSearchList.stream().anyMatch(r -> r.getImg_url().equals(imgUrl))) {
				result.setData_class(String.join(", ", srcToDataClassesMap.get(imgUrl))); // data_class를 합침
				filteredSearchList.add(result);
			}
		}

		model.addAttribute("searchList", filteredSearchList);
		return "DataResultPage";
	}

	@RequestMapping(value = "/suggestions", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getSuggestions(@RequestParam("query") String query) {
		System.out.println("suggestions 들어옴");
		// 예제 데이터: 실제로는 DB나 검색 엔진에서 데이터 가져오기
		List<String> allKeywords = new ArrayList<>();

		List<String> list = datamapper.suggestions();

		for (String str : list) {
			if (str != null)
				allKeywords.add(str);
		}
		System.out.println("유사 검색어 목록 : " + allKeywords.toString());

		// 입력 값과 일치하는 데이터 필터링
		return allKeywords.stream().filter(keyword -> keyword.toLowerCase().contains(query.toLowerCase()))
				.collect(Collectors.toList());
	}

}
