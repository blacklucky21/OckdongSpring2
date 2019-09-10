package com.junwo.ockdong.myOwn.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.junwo.ockdong.myOwn.model.vo.Ingredient;

public interface MyOwnService {

	int insert(Ingredient in);

	ArrayList<Ingredient> selectAll();

	int deleteIn(int inNo);

	ArrayList<Ingredient> searchList(Map<String, String> search);

	Ingredient selectOne(int inNo);

	int update(Ingredient in);

}
