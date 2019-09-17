package com.junwo.ockdong.myOwn.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.myOwn.model.dao.MyOwnDAO;
import com.junwo.ockdong.myOwn.model.vo.Ingredient;
import com.junwo.ockdong.myOwn.model.vo.MBLRecipe;

@Service
public class MyOwnServiceImp implements MyOwnService{
	
	@Autowired
	private MyOwnDAO moDAO;

	@Override
	public int insert(Ingredient in) {
		return moDAO.insert(in);
	}

	@Override
	public ArrayList<Ingredient> selectAll() {
		return moDAO.selectAll();
	}

	@Override
	public int deleteIn(int inNo) {
		return moDAO.deleteIn(inNo);
	}

	@Override
	public ArrayList<Ingredient> searchList(Map<String, String> search) {
		return moDAO.searchList(search);
	}

	@Override
	public Ingredient selectOne(int inNo) {
		return moDAO.selectOne(inNo);
	}

	@Override
	public int update(Ingredient in) {
		return moDAO.update(in);
	}

	@Override
	public int insertRecipe(Map<String, String> list) {
		return moDAO.insertRecipe(list);
	}

	@Override
	public ArrayList<MBLRecipe> getAllRecipe() {
		return moDAO.getAllRecipe();
	}

	@Override
	public MBLRecipe searchRecipeOne(String mblId) {
		return moDAO.searchRecipeOne(mblId);
	}

	@Override
	public int deleteRecipe(int mblId) {
		return moDAO.deleteRecipe(mblId);
	}

	@Override
	public ArrayList<MBLRecipe> getUserRecipe(String userId) {
		return moDAO.getUserRecipe(userId);
	}

	@Override
	public ArrayList<MBLRecipe> searchRecipeList(Map<String, String> search) {
		return moDAO.searchRecipeList(search);
	}

	@Override
	public int deleteMblRecipe(int mblId) {
		return moDAO.deleteMblRecipe(mblId);
	}

	@Override
	public MBLRecipe myRecipeDetail(int mblId) {
		return moDAO.myRecipeDetail(mblId);
	}

	@Override
	public MBLRecipe myMBLRecipe(String fileName) {
		return moDAO.myMBLRecipe(fileName);

	public int updateRecipe(MBLRecipe mblR) {
		return moDAO.updateRecipe(mblR);

	}

}
