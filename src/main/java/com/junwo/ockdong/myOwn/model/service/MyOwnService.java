package com.junwo.ockdong.myOwn.model.service;

import java.util.ArrayList;

import com.junwo.ockdong.myOwn.model.vo.Ingredient;

public interface MyOwnService {

	int insert(Ingredient in);

	ArrayList<Ingredient> selectAll();

}
