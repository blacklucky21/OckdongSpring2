package com.junwo.ockdong.myOwn.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.myOwn.model.vo.Ingredient;
import com.junwo.ockdong.myOwn.model.vo.MBLRecipe;

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

	public int deleteIn(int inNo) {
		return sqlSession.update("myOwnMapper.deleteIn", inNo);
	}

	public ArrayList<Ingredient> searchList(Map<String, String> search) {
		return (ArrayList)sqlSession.selectList("myOwnMapper.searchList", search);
	}

	public Ingredient selectOne(int inNo) {
		return sqlSession.selectOne("myOwnMapper.searchOne", inNo);
	}

	public int update(Ingredient in) {
		return sqlSession.update("myOwnMapper.updateIn", in);
	}

	public int insertRecipe(Map<String, String> list) {
		return sqlSession.update("myOwnMapper.insertRecipe", list);
	}

	public ArrayList<MBLRecipe> getAllRecipe() {
		return (ArrayList)sqlSession.selectList("myOwnMapper.getAllRecipe");
	}

	public MBLRecipe searchRecipeOne(String mblId) {
		return sqlSession.selectOne("myOwnMapper.searchRecipeOne", mblId);
	}

	public int deleteRecipe(int mblId) {
		return sqlSession.update("myOwnMapper.deleteRecipe", mblId);
	}

	public ArrayList<MBLRecipe> getUserRecipe(String userId) {
		return (ArrayList)sqlSession.selectList("myOwnMapper.getUserRecipe", userId);
	}

	public ArrayList<MBLRecipe> searchRecipeList(Map<String, String> search) {
		return (ArrayList)sqlSession.selectList("myOwnMapper.searchRecipeList", search);
				
	}

}
