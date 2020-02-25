package com.ineat.oxo.services;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.ineat.oxo.dao.FileDAO;
import com.ineat.oxo.dao.MemberDAO;
import com.ineat.oxo.util.FileUtil;
import com.ineat.oxo.vo.StoryBoardVO;
import com.ineat.oxo.vo.FileVO;
import com.ineat.oxo.vo.MemberVO;

public class FileService {
	Object dao;
	String spath;
	public void setDAO(Object dao) {
		this.dao = dao;
	};
	
	// 파일 업로드를 처리할 함수
	public String singleUpProc(HttpSession session, MultipartFile multi) {
		// 이 함수는 파일을 업로드 하기 위해서 컨트롤러에서 업로드할 파일의 정보를 받아와야 한다.
		// 그 정보는 MultipartFile 이라는 타입으로 전송이 될 것이고
		// 거기서 꺼내서 사용해야 한다.
		String tpath = "";
		// 저장이름을 기억할 변수
		String saveName = "";
		
		long len = 0;
		
		spath = session.getServletContext().getRealPath(tpath);
		// 실제 경로(real path) 출력
		spath = spath + "resources\\upload";
		System.out.println("spath : " + spath);
		/*
		String path = this.getClass().getResource("/").getPath();
		int idx = path.indexOf("/WEB-INF");
		path = path.substring(0, idx) + "/resources/upload";
		*/
			
		String rePath = spath.substring(0, spath.indexOf("\\source\\.metadata"));
		System.out.println("rePath: " + rePath);
		
		rePath = rePath + "\\source\\git\\ineat_g\\ineat_e\\src\\main\\webapp\\resources\\upload";
		System.out.println("rePath: " + rePath);
		
		// 먼저 클라이언트가 업로드한 원본 이름을 알아낸다.
		
		String oriName = "";
		try {
			oriName = multi.getOriginalFilename();
			
		}catch(Exception e) {
			return "";
		}
		
		// 이 라인이 실행된다는 의미는 업로드한 파일이 존재한다는 뜻이다.
		// 혹시 업로드할 파일 하고 중복되는 이름의 파일이 이미 존재하는지 검사해서
		// 있는 경우는 다른이름으로 저장을 해야 한다.
		
		// 저장할 이름이 생겼음으로 준비된 변수에 기억해 놓는다.
		saveName = FileUtil.rename(spath, oriName);
		
		// 이제 업로드할 파일을 우리의 정상적인 경로에 저장한다.
		// 이 이름은 이후 데이터베이스에 등록할 때 사용해야 한다.
		// 따라서 이름을 기억해 놓을 필요가 생겼다.
		
		/*
		FileInputStream fin = null; // 기본 스트림
		BufferedInputStream bin = null; // 보조 스트림(필터스트림)
		PrintStream ps = null; // 보조 스트림(기본스트림을 만들어서 사용한다.)
		*/
		
		try {
			File file = new File(spath, saveName);
			multi.transferTo(file);
			System.out.println("### dao upfile complete!!!");
			
			len = multi.getSize();
			
			// 작업 경로에 복사
			file = new File(rePath, saveName);
			multi.transferTo(file);
			
			/*
			fin = new FileInputStream(file);
			bin = new BufferedInputStream(fin);
			
			ps = new PrintStream(rePath + saveName);
			byte[] buff = new byte[1024];
			while(true) {
				int len1 = bin.read(buff);
				if(len1 == -1) {
					break;
				}
				ps.write(buff, 0, len1);
			}
			*/
			System.out.println("############ upload complete !!!");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			/*
			try{
				fin.close();
				bin.close();
				ps.close();
			}catch(Exception e){}
			 */
		}
		
		return saveName;
	}
	
	// 다중 파일 업로드 처리 함수
	
	public String[] uploadProc(HttpSession session, MultipartFile[] multi) {
		// 이 함수는 다중파일 업로드를 처리할 함수
		// 그런데 단일 파일을 처리할 함수를 이미 만들어 놓았다.
		// 따라서 위에서 만든 함수를 호출해서 반복처리만 해주면 될 것이다.
		
		String[] saveName = new String[multi.length];
		
		for(int i = 0; i < multi.length; i++) {
			System.out.println("오리지널 파일 네임  : "+multi[i].getOriginalFilename());
			saveName[i] = singleUpProc(session, multi[i]);
		}
		
		return saveName;
	}
/* =============================================================================================== */
	
	
	
	// sb 파일 업로드
	public int sbFileAddProc(HttpSession session, StoryBoardVO sbVO) {
		int cnt = 0;
		String savename = singleUpProc(session, sbVO.getsFile());
		
		FileVO fVO = new FileVO();
		
		fVO.setMid(sbVO.getMid());
		fVO.setOriName(sbVO.getsFile().getOriginalFilename());
		fVO.setSaveName(savename);
		fVO.setDir("\\upload");
		fVO.setLen(sbVO.getsFile().getSize());
		
		
		System.out.println("sbFileAddProc() bno: "+ fVO.getBno());
		System.out.println("sbFileAddProc() mid: "+ fVO.getMid());
		System.out.println("sbFileAddProc() oriName: "+ fVO.getOriName());
		System.out.println("sbFileAddProc() savename: " + savename);
		System.out.println("sbFileAddProc() dir: "+ fVO.getDir());
		System.out.println("sbFileAddProc() len: " + fVO.getLen());
		
		cnt = ((FileDAO)dao).sbFileAddProc(fVO);
		
		return cnt;
	}
	
	// sb 수정에서 사진 올리기
	public FileVO sbInfoImgUp(HttpSession session, StoryBoardVO sbVO) {
		String savename = singleUpProc(session, sbVO.getsFile());
		
		FileVO fVO = new FileVO();
		
		fVO.setBno(sbVO.getBno());
		fVO.setMid(sbVO.getMid());
		fVO.setOriName(sbVO.getsFile().getOriginalFilename());
		fVO.setSaveName(savename);
		fVO.setDir("\\upload");
		fVO.setLen(sbVO.getsFile().getSize());
		
		
		System.out.println("sbInfoImgUp() bno: "+ fVO.getBno());
		System.out.println("sbInfoImgUp() mid: "+ fVO.getMid());
		System.out.println("sbInfoImgUp() oriName: "+ fVO.getOriName());
		System.out.println("sbInfoImgUp() savename: " + savename);
		System.out.println("sbInfoImgUp() dir: "+ fVO.getDir());
		System.out.println("sbInfoImgUp() len: " + fVO.getLen());
		
		((FileDAO)dao).sbInfoImgUp(fVO);
		
		return fVO;
	}
}

