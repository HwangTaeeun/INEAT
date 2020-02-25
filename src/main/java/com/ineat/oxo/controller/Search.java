package com.ineat.oxo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.ReviewDAO;
import com.ineat.oxo.dao.SearchDAO;
import com.ineat.oxo.dao.TasteInfoDAO;
import com.ineat.oxo.vo.ReviewVO;
import com.ineat.oxo.vo.SearchVO;
import com.ineat.oxo.vo.TasteInfoVO;

@Controller
public class Search {
	@Autowired
	SearchDAO schDAO;
	@Autowired
	TasteInfoDAO tDAO;
	@Autowired
	ReviewDAO rvDAO;
	
	@RequestMapping("/searchResult.eat")
	public ModelAndView searchFrom(ModelAndView mv) {
		mv.setViewName("search/searchResult");
		
		return mv;
	}
	
	@RequestMapping("/searchProc.eat")
	public ModelAndView searchProc(ModelAndView mv, SearchVO schVO, HttpSession session) {
		List<TasteInfoVO> list=schDAO.searchM(schVO);
		String sid = (String)session.getAttribute("SID");
		for (int i = 0; i < list.size(); i++) {
			int ml_no = list.get(i).getMl_no();
			if(sid != null) {
				list.get(i).setM_id(sid);
				list.get(i).setFavorite(""+tDAO.checkfavorite(list.get(i)));
			}
			List<ReviewVO> rlist = rvDAO.getReviewInfo(ml_no);
			
			list.get(i).setRvList(rlist);
		}
		
		
		mv.addObject("SCH", schVO);
		mv.addObject("LIST", list);
		mv.setViewName("search/searchResult");
		return mv;
	}
	
	@RequestMapping("/filterSearch.eat")
	@ResponseBody
	public List<TasteInfoVO> filterResult(SearchVO schVO,HttpSession session) {
		List<TasteInfoVO> list = schDAO.searchM(schVO);
		String sid = (String)session.getAttribute("SID");
		for (int i = 0; i < list.size(); i++) {
			int ml_no = list.get(i).getMl_no();
			if(sid != null) {
				list.get(i).setM_id(sid);
				list.get(i).setFavorite(""+tDAO.checkfavorite(list.get(i)));
			}
			System.out.println("controller "+list.get(i).getMl_title());
			List<ReviewVO> rlist = rvDAO.getReviewInfo(ml_no);
			
			list.get(i).setRvList(rlist);
		}
		System.out.println(schVO.getTag());
		System.out.println(schVO.getOrder());
		//System.out.println(schVO.getPrice().toString());
		return list;
	}
	
	
	// 무한 스크롤 
	@RequestMapping("/moreResult.eat")
	@ResponseBody
	public List<TasteInfoVO> moreResult(SearchVO schVO, HttpSession session) {
		List<TasteInfoVO> list = schDAO.moreResult(schVO);
		System.out.println(schVO.getNum());
		
		String sid = (String)session.getAttribute("SID");
		for (int i = 0; i < list.size(); i++) {
			int ml_no = list.get(i).getMl_no();
			if(sid != null) {
				list.get(i).setM_id(sid);
				list.get(i).setFavorite(""+tDAO.checkfavorite(list.get(i)));
				
			}
			List<ReviewVO> rlist = rvDAO.getReviewInfo(ml_no);
			System.out.println("controller "+list.get(i).getMl_title());
			list.get(i).setRvList(rlist);
		}
		
		System.out.println(schVO.getTag());
		System.out.println(schVO.getOrder());
		
		
		return list;
		
		
		
		
	}
	
}
