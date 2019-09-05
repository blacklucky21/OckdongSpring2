package com.junwo.ockdong.myOwn.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.myOwn.model.vo.Ingredient;

@Repository
public class MyOwnDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insert(Ingredient in) {
		return sqlSession.insert("myOwnMapper.insertIngredient", in);
	}

	public ArrayList<Ingredient> selectAll() {
		return (ArrayList)sqlSession.selectList("myOwnMapper.selectAll");
	}

}
