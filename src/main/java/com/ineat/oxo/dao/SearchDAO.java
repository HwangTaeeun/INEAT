package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.SearchVO;
import com.ineat.oxo.vo.StoryBoardVO;
import com.ineat.oxo.vo.TasteInfoVO;

public class SearchDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<TasteInfoVO> searchM(SearchVO schVO) {
		return sqlSession.selectList("schSQL.tSearch", schVO);
	}
	
	public List<TasteInfoVO> moreResult(SearchVO schVO){
		return sqlSession.selectList("schSQL.moreResult", schVO);
	}
	
	public List<StoryBoardVO> searchS(SearchVO schVO) {
		return sqlSession.selectList("schSQL.sSearch", schVO);
	}
}
