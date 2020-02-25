package com.ineat.oxo.dao;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.ineat.oxo.vo.MemberVO;

//mDAO
public class MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//로그인처리
	public int loginProc(MemberVO mVO) {
		int cnt = sqlSession.selectOne("mSQL.Login", mVO);
		return cnt;
	}
	
	//회원가입
	public int joinProc(MemberVO mVO) {
		return sqlSession.insert("mSQL.Join", mVO);
	}
	
	//아이디체크
	public int idCheck(String id) {
		return sqlSession.selectOne("mSQL.idCk",id);
	}
	
	//닉네임체크
	public int nnCheck(String nname) {
		return sqlSession.selectOne("mSQL.nnCk", nname);
	}
	
	//전화번호체크
	public int telCheck(String tel) {
		return sqlSession.selectOne("mSQL.telCk", tel);
	}
	
	//이메일체크
	 public int eCheck(String email) {
		 return sqlSession.selectOne("mSQL.eCk", email);
	 }
	 
	 public MemberVO memInfo(MemberVO mVO) {
		 return sqlSession.selectOne("mSQL.memInfo", mVO);
	 }
	 //회원정보수정
	 public int infoEdit(MemberVO mVO) {
		 return sqlSession.update("mSQL.editInfo", mVO);
	 }
	 
	 //아이디찾기
	 public MemberVO idFind(MemberVO mVO) {
		 return sqlSession.selectOne("mSQL.idFind", mVO);
	 }
	 
	 //비번찾기
	 
	 public MemberVO passFind(MemberVO mVO) {
		 return sqlSession.selectOne("mSQL.passFind",mVO);
	 }
	  @Autowired
      protected JavaMailSender  mailSender;
	  
	  public void sendEmail(MemberVO mVO) {
		  MimeMessage msg = mailSender.createMimeMessage();
		  try {
			  msg.setSubject(mVO.getSubject());
			  msg.setText(mVO.getContent());
			  msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(mVO.getReceiver()));
		  }catch (MessagingException e) {
			System.out.println("MessaginException");
			e.printStackTrace();
		}
		  try {
			mailSender.send(msg);
		} catch (MailException e) {
		System.out.println("MailException 발생");
		}
	  }



}
