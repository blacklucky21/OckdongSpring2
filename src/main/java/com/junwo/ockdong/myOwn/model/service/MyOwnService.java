package com.junwo.ockdong.myOwn.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.myOwn.model.vo.Ingredient;
import com.junwo.ockdong.myOwn.model.vo.MBLRecipe;

public interface MyOwnService {

	int insert(Ingredient in);

	ArrayList<Ingredient> selectAll();

	int deleteIn(int inNo);

	ArrayList<Ingredient> searchList(Map<String, String> search);

	Ingredient selectOne(int inNo);

	int update(Ingredient in);

	int insertRecipe(Map<String, String> list);

	ArrayList<MBLRecipe> getAllRecipe();

	MBLRecipe searchRecipeOne(String mblId);

	int deleteRecipe(int mblId);

//	ArrayList<MBLRecipe> getUserRecipe(String userId);

	ArrayList<MBLRecipe> searchRecipeList(Map<String, String> search);

	int deleteMblRecipe(int mblId);

	MBLRecipe myRecipeDetail(int mblId);


	MBLRecipe myMBLRecipe(String fileName);

	int updateRecipe(MBLRecipe mblR);

	int getListCount(String userId);

	ArrayList<MBLRecipe> getUserRecipe(PageInfo pi, String userId);




}
