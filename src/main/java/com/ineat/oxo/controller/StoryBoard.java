package com.ineat.oxo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ineat.oxo.dao.FileDAO;
import com.ineat.oxo.dao.StoryBoardDAO;
import com.ineat.oxo.services.FileService;
import com.ineat.oxo.util.PageUtil;
import com.ineat.oxo.vo.StoryBoardVO;

/**
 * 이 클래스는 storyboard 컨트롤러입니다.
 * @author	이태성
 * @since	2019.12.31
 * @version	v.1.0
 * @see		2019.12.31 - 클래스 제작 - 담당자: 이태성
 *
 */
@Controller
@RequestMapping("/storyboard/")
public class StoryBoard {
	@Autowired
	StoryBoardDAO sbDAO;
	
	@Autowired
	FileDAO fDAO;
	
	@Autowired
	FileService fileSrvc;
	
	// sb 출력
	@RequestMapping("storyBoard.eat")
	public ModelAndView storyBoard(ModelAndView mv, HttpSession session, PageUtil pUtil) {
		int nowPage = 1;
		
		// 게시물 전체 개수
		int totalCount = sbDAO.getTotalCnt();
		
		if(pUtil.getNowPage() == 0) {
			nowPage = 1;
		} else {
			nowPage = pUtil.getNowPage();
		}
		
		pUtil.setVar(nowPage, totalCount, 5, 10);
		
		List<StoryBoardVO> list = sbDAO.storyBoard(pUtil);
		mv.addObject("LIST", list);
		mv.addObject("PAGE", pUtil);
		
		String sid = (String) session.getAttribute("SID");
		session.setAttribute("SID", sid);
		return mv;
	}

	// sbInfo 출력
	@RequestMapping("storyBoardInfo.eat")
	public ModelAndView storyBoardInfo(ModelAndView mv, HttpSession session, StoryBoardVO sbVO) {
		
		// 조회수 함수 처리
		sbDAO.viewsCnt(sbVO.getBno());
		
		// 댓글 보기 함수 처리
		List<StoryBoardVO> list = sbDAO.sbCommentList(sbVO.getBno());
		mv.addObject("LIST", list);
		
		// 내용 불러오기
		sbVO = sbDAO.storyBoardInfo(sbVO);

		mv.addObject("DATA", sbVO);
		
		mv.setViewName("storyboard/storyBoardInfo");
		return mv;
	}
	
	// sbwrite 출력
	@RequestMapping("storyBoardWrite.eat")
	public ModelAndView storyBoardWrite(ModelAndView mv, HttpSession session) {
		
		String sid = (String) session.getAttribute("SID");
		session.setAttribute("SID", sid);
		
		return mv;
	}
	
	// sbwrite 처리
	@RequestMapping("storyBoardWriteProc.eat")
	public ModelAndView storyBoardWriteProc(ModelAndView mv, RedirectView rv, HttpSession session, StoryBoardVO sbVO) {
		
		int cnt = sbDAO.storyBoardWriteProc(sbVO);
		
		// 업로드 할 파일 유무 확인
		if(cnt == 1 && sbVO.getsFile().getOriginalFilename() != "") {
			session.setAttribute("mid", sbVO.getMid());
			fileSrvc.setDAO(fDAO);
			fileSrvc.sbFileAddProc(session, sbVO);
			rv.setUrl("/oxo/storyboard/storyBoard.eat");
		}else if(cnt == 1) {
			rv.setUrl("/oxo/storyboard/storyBoard.eat");
		}else {
			rv.setUrl("/oxo/storyboard/storyBoardWrite.eat");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	// 좋아요 처리
	@RequestMapping("sbLike.eat")
	public ModelAndView sbLike(ModelAndView mv, HttpSession session, StoryBoardVO sbVO) {
		
		// 데이터가 있는지 먼저 확인
		int cnt = sbDAO.sbLike(sbVO);
		
		if(cnt == 1) {
			sbDAO.sbLikeU(sbVO);
		}else {
			int cnt2 = sbDAO.sbLikeHC(sbVO);
			
			if(cnt2 == 1) {
				
				sbDAO.sbLikeU2(sbVO);
			}else {
				
				int cnt3 = sbDAO.sbLikeZC(sbVO);
				
				if(cnt3 == 1) {
					
					sbDAO.sbLikeU2(sbVO);
				}else {
					
					sbDAO.sbLike2(sbVO);	
				}
			}
		}
		
		mv.addObject("DATA", sbVO);
		mv.setViewName("storyboard/sbInfoR");
		return mv;
		
	}
	
	// 싫어요 처리
	@RequestMapping("sbHate.eat")
	public ModelAndView sbHate(ModelAndView mv, HttpSession session, StoryBoardVO sbVO) {
		// 데이터가 있는지 먼저 확인
		int cnt = sbDAO.sbHate(sbVO);
		
		if(cnt == 1) {
			sbDAO.sbHateU(sbVO);
		}else {
			int cnt2 = sbDAO.sbHateLC(sbVO);
			
			if(cnt2 == 1) {
				sbDAO.sbHateU2(sbVO);
					
			}else {
				int cnt3 = sbDAO.sbHateZC(sbVO);
				
				if(cnt3 == 1) {
					sbDAO.sbHateU2(sbVO);
					
				}else {
					sbDAO.sbHate2(sbVO);	
				}
			}
		}
		
		mv.addObject("DATA", sbVO);
		mv.setViewName("storyboard/sbInfoR");
		return mv;
	}
	
	// 게시물 삭제 처리
	@RequestMapping("sbDelete.eat")
	public ModelAndView sbDelete(ModelAndView mv, RedirectView rv, HttpSession session, StoryBoardVO sbVO) {
		sbDAO.sbcmtDelete(sbVO);
		sbDAO.sblhDelete(sbVO);
		sbDAO.sbfileDelete(sbVO);
		sbDAO.sbDelete(sbVO);
		rv.setUrl("/oxo/storyboard/storyBoard.eat");
		
		mv.setView(rv);
		return mv;
	}
	
	// 수정시 상세보기
	@RequestMapping("sbViewDetail.eat")
	public @ResponseBody StoryBoardVO sbViewDetail(StoryBoardVO sbVO) {
		sbVO = sbDAO.sbViewDetail(sbVO);

		return sbVO;
	}
	
	// 게시물 수정 처리
	@RequestMapping("sbInfoEdit.eat")
	public @ResponseBody StoryBoardVO sbInfoEdit(StoryBoardVO sbVO) {
		sbVO.setCnt(sbDAO.sbInfoEdit(sbVO));

		return sbVO;
	}
	
	// 게시물 사진 삭제 처리
	@RequestMapping("sbInfoImgDelete.eat")
	public ModelAndView sbInfoImgDelete(ModelAndView mv, StoryBoardVO sbVO) {
		sbDAO.sbInfoImgDelete(sbVO);
		
		mv.addObject("DATA", sbVO);
		mv.setViewName("storyboard/sbInfoR");
		return mv;
	}

	// 수정에서 사진 올리기
	@RequestMapping("sbInfoImgUp.eat")
	public ModelAndView sbInfoImgUp(ModelAndView mv, StoryBoardVO sbVO, HttpSession session){
		fileSrvc.setDAO(fDAO);
		fileSrvc.sbInfoImgUp(session, sbVO);  
		
		mv.addObject("DATA", sbVO);
		mv.setViewName("storyboard/sbInfoR");
		return mv;
	}
	
	// 댓글 입력 함수 처리
	@RequestMapping("sbComment.eat")
	public ModelAndView sbComment(ModelAndView mv, HttpSession session, StoryBoardVO sbVO) {
		sbDAO.sbComment(sbVO);
		
		mv.addObject("DATA", sbVO);
		mv.setViewName("storyboard/sbInfoR");
		return mv;
	}
	
	// 댓글 수정시 상세 보기
	@RequestMapping("sbCmtView.eat")
	public @ResponseBody StoryBoardVO sbCmtView(StoryBoardVO sbVO) {
		sbVO = sbDAO.sbCmtView(sbVO);

		return sbVO;
	}
	
	// 댓글 수정 처리
	@RequestMapping("sbCmtEdit.eat")
	public @ResponseBody StoryBoardVO sbCmtEdit(StoryBoardVO sbVO) {
		sbVO.setCnt(sbDAO.sbCmtEdit(sbVO));

		return sbVO;
	}
	
	// 댓글 삭제 처리
	@RequestMapping("sbCmtOneDelete.eat")
	public ModelAndView sbCmtOneDelete(ModelAndView mv, RedirectView rv, HttpSession session, StoryBoardVO sbVO) {
		sbDAO.sbCmtOneDelete(sbVO);
		
		mv.addObject("DATA", sbVO);
		mv.setViewName("storyboard/sbInfoR");
		return mv;
	}
}
