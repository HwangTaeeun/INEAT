package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.TasteInfoVO;

public class RecommendDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//맛집 가게명
	public List storeList() {
			
		return sqlSession.selectList("rSQL.storeList");
	}
	
	
	//메뉴가져오기
	public List menuList() {
		return sqlSession.selectList("rSQL.menuList");
	}
	
	//날씨로 추천하는 메뉴
	public TasteInfoVO weatherChoo(String dayCondition) {
		//System.out.println(dayCondition);
		return sqlSession.selectOne("rSQL.weatherChoo", dayCondition);
	}	
}
