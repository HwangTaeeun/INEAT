package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.ReviewVO;
import com.ineat.oxo.vo.TasteInfoVO;

//tDAO
public class TasteInfoDAO {
	@Autowired SqlSessionTemplate sqlSession;
	
	
	public List<TasteInfoVO> selectList() {
		List<TasteInfoVO> list = sqlSession.selectList("tSQL.selectlist");
		
		return list;
	}
	
	public List<TasteInfoVO> moreList(TasteInfoVO tVO){
		List<TasteInfoVO> list = sqlSession.selectList("tSQL.morelist",tVO);
		return list;
	}
	
	public List<TasteInfoVO> tagList(TasteInfoVO tVO){
		List<TasteInfoVO> list = sqlSession.selectList("tSQL.taglist",tVO);
		return list;
	}
	
	public TasteInfoVO tasteInfo(int ml_no) {
		sqlSession.update("tSQL.upcount", ml_no);
		TasteInfoVO tVO = sqlSession.selectOne("tSQL.tasteInfo", ml_no);
		tVO.setFvrcnt(sqlSession.selectOne("tSQL.getfvrcnt", ml_no));
		return tVO;
	}
	
	public List<String> reviewImgs(int ml_no){
		return sqlSession.selectList("tSQL.reviewimgs", ml_no);
	}
	
	public int checkfavorite(TasteInfoVO tVO) {
		return sqlSession.selectOne("tSQL.checkfavorite", tVO);
	}
	
	public int favoriteProc(TasteInfoVO tVO) {
		int cnt = sqlSession.selectOne("tSQL.checkfavorite", tVO);
		
		System.out.println(tVO.getMl_no());
		System.out.println(tVO.getM_id());
		if(cnt == 1) {
			sqlSession.delete("tSQL.favoriteDel", tVO );
			cnt = 0;
		}else {
			sqlSession.insert("tSQL.favoriteIn", tVO);
			cnt = 1;
		}
		return cnt;
	}
}
