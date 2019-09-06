package com.junwo.ockdong.cart.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.cart.model.vo.Cart;

@Repository("cDAO")
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public ArrayList<Cart> selectCartList(String loginUserId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList",loginUserId);
	}

}