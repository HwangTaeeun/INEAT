package com.ineat.oxo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ineat.oxo.dao.FileDAO;
import com.ineat.oxo.dao.MemberDAO;
import com.ineat.oxo.services.FileService;
import com.ineat.oxo.vo.FileVO;
import com.ineat.oxo.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class Member {
	@Autowired
	MemberDAO mDAO;
	@Autowired
	FileDAO fDAO;
	@Autowired
	MemberVO mVO;
	@Autowired
	FileService fileSrvc;

	/*회원 가입 및 로그인*/

	//로그인
	@RequestMapping("loginProc.eat")
	@ResponseBody
	public int login(HttpSession session, MemberVO mVO) {
		int cnt = mDAO.loginProc(mVO);
		if(cnt==1) {
			//로그인 성공
			session.setAttribute("SID", mVO.getId());
		}
		return cnt;
	}
	//로그아웃
	@RequestMapping("logout.eat")
	public ModelAndView logoutForm(HttpSession session,RedirectView rv, ModelAndView mv) {
		session.setAttribute("SID", null);
		rv.setUrl("/oxo/main.eat");
		mv.setView(rv);
		return mv;
	}
	
	//회원가입
	@RequestMapping("join.eat")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("member/join");
		return mv;
	}
	
	@RequestMapping("joinProc.eat")
	public ModelAndView joinProc(ModelAndView mv, RedirectView rv, HttpSession session, MemberVO mVO) {
		int cnt = mDAO.joinProc(mVO);
		if(cnt==1) {
			session.setAttribute("SID", mVO.getId());
			rv.setUrl("/oxo/main.eat");
		}else {
			//실패
			rv.setUrl("oxo/member/join.eat");
		}
		mv.setView(rv);
		return mv;
	}
	
	//아이디체크
	@RequestMapping("idCheck.eat")
	@ResponseBody
	public int idCheck(String id) {
		int cnt = mDAO.idCheck(id);
		return cnt;
	}
	
	//닉네임체크
	@RequestMapping("nnCheck.eat")
	@ResponseBody
	public int nnCheck(String nname) {
		int cnt = mDAO.nnCheck(nname);
		return cnt;
	}
	
	//전화번호체크
	@RequestMapping("telCheck.eat")
	@ResponseBody
	public int telCheck(String tel) {
		int cnt = mDAO.telCheck(tel);
		return cnt;
	}
	
	//이메일체크
	@RequestMapping("eCheck.eat")
	@ResponseBody
	public int eCheck(String email) {
		int cnt = mDAO.eCheck(email);
		return cnt;
	}
	
	
	/*회원 정보 관련*/
	//정보보기
	@RequestMapping("memInfo.eat")
	public ModelAndView memInfo(MemberVO mVO, ModelAndView mv, FileVO fVO, RedirectView rv, HttpSession session) {
		MemberVO memVO = mDAO.memInfo(mVO);
		memVO.setRdCode(mVO.getRdCode());
		fVO.setMid(mVO.getId());
		String sname = fDAO.getProf(fVO);
		mv.addObject("SNAME",sname);
		mv.addObject("DATA", memVO);
		/*
		rv.setUrl("/oxo/member/memInfo.eat");
		mv.setView(rv);
		*/
		mv.setViewName("member/memInfo");
		return mv;
	}
	
	//회원정보수정
	@RequestMapping("editProc.eat")
	public ModelAndView editProc(ModelAndView mv, MemberVO mVO, RedirectView rv, HttpSession session) {
		int result = mDAO.infoEdit(mVO);
		
		MultipartFile sfile = mVO.getsFile();
		
		String sid = (String)session.getAttribute("SID");
		String sname;
		
		if(sfile!=null) {
			sname = fileSrvc.singleUpProc(session, sfile);
			fDAO.memInfoPic(sfile, sname, sid);
		}else {
			sname = "member.png";
		}
		rv.setUrl("/oxo/member/memInfo.eat");
		mv.addObject("rdCode", -1);
		mv.addObject("id", mVO.getId());
		mv.addObject("PROF", sname);
		mv.setView(rv);
		return mv;
	}

	//아이디찾기
	@RequestMapping("idFind.eat")
	public ModelAndView idFind(ModelAndView mv) {
		mv.setViewName("/member/idFind");
		return mv;
	}
	
	@RequestMapping("idFindProc.eat")
	@ResponseBody
	public MemberVO idFindProc(MemberVO mVO) {
		MemberVO memVO = mDAO.idFind(mVO);
		

		return memVO;
	}
	
	//비밀번호찾기
	@RequestMapping("passFind.eat")
	public ModelAndView passFind(ModelAndView mv) {
		mv.setViewName("/member/passFind");
		return mv;
	}
	
	@RequestMapping("passFindProc.eat")
	public ModelAndView passFindProc (MemberVO mVO, ModelAndView mv, RedirectView rv) {
		
		String id= mVO.getId();
		String name= mVO.getName();
		String email = mVO.getEmail();
		String pw = null;
		String pwck= "pwck";
		String pwok = "pwok";
		try{
			pw = mDAO.passFind(mVO).getPw();
		} catch(Exception e) {
			pw = null;
		}
		
		
			if(pw != null){
				mVO.setContent("inEAT에서 보내는 메일입니다.\r\n"
						+id+"님의 비밀번호는 "+pw+" 입니다.\r\n"
						+"개인정보 보호를 위해 비밀번호 확인 후 변경해주세요.\r\n"
						+ "\r\n"
						+ "\r\n"
						+ "\r\n"
						+ "Copyright © INEAT Corp. All Rights Reserved.");
				mVO.setReceiver(email);
				mVO.setSubject(id+"님 비밀번호 찾기 메일입니다.");
				mDAO.sendEmail(mVO);
				rv.setUrl("/oxo/main.eat");
			} else {
				rv.setUrl("/oxo/member/passFind.eat");
				mv.addObject("msg",pwck);
			}

//		mv.addObject("EMAIL",email);
		mv.setView(rv);
		return mv;

	}

}

