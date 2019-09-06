package com.junwo.ockdong.cart.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.cart.model.dao.CartDAO;
import com.junwo.ockdong.cart.model.vo.Cart;


@Service("CartService")
public class CartServiceImpl implements CartService{

	
	@Autowired
	private CartDAO cDAO;

	@Override
	public ArrayList<Cart> selectCartList(String loginUserId) {
		// TODO Auto-generated method stub
		return cDAO.selectCartList(loginUserId);
	}
}
