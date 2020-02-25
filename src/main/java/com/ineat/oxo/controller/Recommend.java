package com.ineat.oxo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.RecommendDAO;
import com.ineat.oxo.vo.TasteInfoVO;

/**
 * 
 * 음식추천관련하여 사용하는 클래스입니다.
 * 
 * @author 황태은
 *
 *						2019-12-30
 */
@Controller
@RequestMapping("/recommend/")
public class Recommend {
	@Autowired
	RecommendDAO rDAO;

	//뷰보기
	@RequestMapping("recommend.eat")
	public ModelAndView recommendForm(HttpSession session,ModelAndView mv) {
		List list = rDAO.storeList();
		List listMenu = rDAO.menuList();
		
		
		String sid = (String) session.getAttribute("SID");
		session.setAttribute("SID", sid);
	
		mv.addObject("LIST", list);
		mv.addObject("LISTMENU", listMenu);
		
		
		

		mv.setViewName("recommend/recommendForm");
		return mv;
	}
	
	//api기온받아와서 데이터베이스로 전달
	@RequestMapping("weather.eat")
	@ResponseBody
	public TasteInfoVO result(@RequestParam String dayCondition) {
		TasteInfoVO weatherlist = rDAO.weatherChoo(dayCondition);
		//api에서 데이터 제대로 들어오나 테스트
		return weatherlist;
	}
}
