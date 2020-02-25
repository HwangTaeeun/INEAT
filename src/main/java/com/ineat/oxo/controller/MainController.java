package com.ineat.oxo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.ReviewDAO;
import com.ineat.oxo.vo.ReviewVO;

@Controller
@RequestMapping


public class MainController {
	@Autowired
	ReviewDAO rvDAO;
	
	@RequestMapping("/main.eat")
	public ModelAndView Main(ModelAndView mv) {
		mv.setViewName("main/main");
		List<ReviewVO> list = rvDAO.mainReview();
		
		mv.addObject("REVIEW",list);
		return mv;
	}
	
}
