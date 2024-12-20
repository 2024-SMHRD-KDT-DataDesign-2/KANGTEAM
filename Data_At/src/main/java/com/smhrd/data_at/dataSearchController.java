package com.smhrd.data_at;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.search;
import com.smhrd.mapper.dataMapper;

@Controller
public class dataSearchController {
	@Autowired
	public dataMapper datamapper;

	@RequestMapping(value = "/dataSearch", method = RequestMethod.GET)
	public String dataSearchList(Model model, @RequestParam("search") String search) {
		List<search> searchList = datamapper.searchList(search);

		System.out.println(searchList.toString());

		model.addAttribute("searchList", searchList);

		return "DataResultPage";
	}

}
