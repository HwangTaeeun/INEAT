package com.ineat.oxo.dao;

import java.awt.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class DBsetDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int dbSet(String pic) {
		return sqlSession.insert("dbSQL.putPic", pic);
	}
}
