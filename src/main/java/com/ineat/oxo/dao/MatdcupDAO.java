package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.MatdcupVO;

//mcDAO
public class MatdcupDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List matList(){
		
		return sqlSession.selectList("mdSQL.matList"); 
	}
	
	public int insertCount(String winName) {
		
		System.out.println("dao===winName ======== " + winName);
		
		int cnt  = sqlSession.update("mdSQL.matWinCount", winName);
		
		System.out.println("dao===cnt ||   " + cnt);
		
		return cnt;
	}
	
	public List<MatdcupVO> getRanking() {
		List<MatdcupVO> list = sqlSession.selectList("mdSQL.ranking");
		
		System.out.println("DAO ======" + list.size());
		return list;
	}
}
