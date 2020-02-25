package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.ineat.oxo.vo.FileVO;
import com.ineat.oxo.vo.MemberVO;
import com.ineat.oxo.vo.ReviewVO;

//fDAO
public class FileDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	// sb 파일 정보 입력 전담 처리 함수
	public int sbFileAddProc(FileVO fVO) {
		return sqlSession.insert("sbSQL.sbFileAddProc", fVO);
	}

	// sb 수정에서 사진 올리기 함수
	public int sbInfoImgUp(FileVO fVO) {
		return sqlSession.insert("sbSQL.sbInfoImgUp", fVO);
	}

	public int rvFileaddProc(ReviewVO rvVO, String[] savename) {
		FileVO fVO = new FileVO();
		int cnt = 0;
		MultipartFile[] sfile = rvVO.getSfile();

		for (int i = 0; i < sfile.length; i++) {
			fVO.setSaveName(savename[i]);
			fVO.setOriName(sfile[i].getOriginalFilename());
			fVO.setDir("/upload/");
			fVO.setLen(sfile[i].getSize());
			cnt += sqlSession.insert("fSQL.rvFileaddProc", fVO);
		}

		return cnt;
	}

	public int rvFiledel(ReviewVO rvVO) {
		int cnt = 0;

		List<String> list = rvVO.getRf_savename();

		for (String savename : list) {
			cnt += sqlSession.delete("fSQL.rvFiledelete", savename);
		}
		return cnt;
	}

	
	// 회원정보수정 파일업로드 함수
	public void memInfoPic(MultipartFile sFile, String sname, String sid) {
		FileVO fVO = new FileVO();
		int ck = sqlSession.selectOne("fSQL.profCk",sid);	
		fVO.setMid(sid);
		fVO.setSaveName(sname);
		fVO.setOriName(sFile.getOriginalFilename());
		fVO.setDir("/profile/");
		fVO.setLen(sFile.getSize());
		if(ck==1) {
			sqlSession.update("fSQL.profUp", fVO);
		}else {
			sqlSession.insert("fSQL.memInfoPic", fVO);			
		}
	}
	//회원 사진보기 함수
	public String getProf(FileVO fVO) {
		System.out.println("###"+fVO.getMid());
		String result = sqlSession.selectOne("fSQL.getProf", fVO);
		System.out.println("*** dao result : " + result);
		return result;
	}
}
