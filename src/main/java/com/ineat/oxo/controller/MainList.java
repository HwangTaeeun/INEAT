package com.ineat.oxo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ineat.oxo.dao.ReviewDAO;
import com.ineat.oxo.dao.TasteInfoDAO;
import com.ineat.oxo.vo.ReviewVO;
import com.ineat.oxo.vo.TasteInfoVO;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
  
@Controller
@RequestMapping("/ineatlist/")
public class MainList {
	@Autowired
	TasteInfoDAO tDAO;
	@Autowired
	ReviewDAO rvDAO;
	
	@RequestMapping("list.eat")
	public ModelAndView List(ModelAndView mv, HttpSession session,TasteInfoVO tVO) {
		
		List<TasteInfoVO> list=null;  
		if(tVO.getMl_tag()!=null) {
			list = tDAO.tagList(tVO);
			
		}else if(tVO.getMl_tag()==null) {
			list = tDAO.selectList();
		}
		String sid = (String)session.getAttribute("SID");
		
		for (int i = 0; i < list.size(); i++) {
			int ml_no = list.get(i).getMl_no();
			if(sid != null) {
				list.get(i).setM_id(sid);
				list.get(i).setFavorite(""+tDAO.checkfavorite(list.get(i)));
			}
			List<ReviewVO> rlist = rvDAO.getReviewInfo(ml_no);
			list.get(i).setRvList(rlist);
			list.get(i).setAvg(rvDAO.getReviewAvg(ml_no));
		}
		
		int total = list.size();
		
		mv.addObject("LIST",list);
		mv.addObject("TOTAL", total);
		mv.addObject("type","조회");
		mv.setViewName("ineatlist/list");
		return mv;
	}
	@RequestMapping("favoriteup.eat")
	@ResponseBody
	public int FavoriteUp(int ml_no, HttpSession session) {
		TasteInfoVO tVO = new TasteInfoVO();
		String m_id = (String)session.getAttribute("SID");
		tVO.setMl_no(ml_no);
		tVO.setM_id(m_id);
		int cnt = tDAO.favoriteProc(tVO);
		return cnt;
	}
	
	@RequestMapping("morelist.eat")
	@ResponseBody
	public ArrayList<TasteInfoVO> morelist(TasteInfoVO tVO, HttpSession session) {
		ArrayList<TasteInfoVO> list = new ArrayList<TasteInfoVO>();
		String type = tVO.getMl_type();
		String tag = tVO.getMl_tag();
		String sid = (String)session.getAttribute("SID");
		
		if(tag.length() == 0) {
			list = (ArrayList<TasteInfoVO>)tDAO.moreList(tVO);
			
			for (int i = 0; i < list.size(); i++) {
				int ml_no = list.get(i).getMl_no();
				
				if(sid != null) {
					
					list.get(i).setM_id(sid);
					list.get(i).setFavorite(""+tDAO.checkfavorite(list.get(i)));
				}
				List<ReviewVO> rlist = rvDAO.getReviewInfo(ml_no);
				list.get(i).setRvList(rlist);
				list.get(i).setAvg(rvDAO.getReviewAvg(ml_no));
			}
		}else {
			
			list = (ArrayList<TasteInfoVO>)tDAO.tagList(tVO);
			
			for (int i = 0; i < list.size(); i++) {
				int ml_no = list.get(i).getMl_no();
				
				if(sid != null) {
					
					list.get(i).setM_id(sid);
					list.get(i).setFavorite(""+tDAO.checkfavorite(list.get(i)));
				}
				
				List<ReviewVO> rlist = rvDAO.getReviewInfo(ml_no);
				list.get(i).setAvg(rvDAO.getReviewAvg(ml_no));
				list.get(i).setRvList(rlist);
			}
		}
		return list;
	}
	
	
	@RequestMapping("info.eat")
	public ModelAndView detailinfo(ModelAndView mv, int ml_no, RedirectView rv, HttpSession session) {
		TasteInfoVO tVO = tDAO.tasteInfo(ml_no);
		
		List<ReviewVO> list = rvDAO.getReviewInfo(ml_no);
		int cnt = rvDAO.getReviewCnt(ml_no);
		double avg = 0;
		if(cnt != 0) {
			avg = rvDAO.getReviewAvg(ml_no);
		}
		List<String> rvimgs = tDAO.reviewImgs(ml_no);
		String sid = (String)session.getAttribute("SID");
		if(sid != null) {
			tVO.setM_id(sid);
			tVO.setFavorite(""+tDAO.checkfavorite(tVO));
		}
		mv.addObject("IMGS",rvimgs);
		mv.addObject("AVG", avg);
		mv.addObject("CNT",cnt);
		mv.addObject("RV_LIST",list);
		mv.addObject("TVO", tVO);
		mv.setViewName("ineatlist/detail/detailinfo");
		return mv;
	}

}
