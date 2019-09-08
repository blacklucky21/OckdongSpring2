package com.junwo.ockdong.cart.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	@Override
	public int updateAmount(HashMap<String, String> amountMap) {
		// TODO Auto-generated method stub
		return cDAO.updateAmount(amountMap);
	}

	@Override
	public int deleteCart(String cNo) {
		// TODO Auto-generated method stub
		return cDAO.deleteCart(cNo);
	}


	@Override
	public ArrayList<Cart> CartPayment(HashMap<String, String[]> totalMap) {
		// TODO Auto-generated method stub
		return cDAO.cartPayment(totalMap);
	}



}
