package com.junwo.ockdong.myOwn.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.myOwn.model.dao.MyOwnDAO;
import com.junwo.ockdong.myOwn.model.vo.Ingredient;

@Service
public class MyOwnServiceImp implements MyOwnService{
	
	@Autowired
	private MyOwnDAO moDAO;

	@Override
	public int insert(Ingredient in) {
		return moDAO.insert(in);
	}

}
