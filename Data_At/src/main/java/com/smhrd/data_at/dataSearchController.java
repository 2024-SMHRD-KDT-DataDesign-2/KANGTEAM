package com.smhrd.data_at;

import java.util.ArrayList;
import java.util.List;
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
		System.out.println("dataSearch 들어옴");
		List<search> searchList = datamapper.searchList(search);

		System.out.println(searchList.get(0).getImg_idx());

		model.addAttribute("searchList", searchList);

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
