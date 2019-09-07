package com.junwo.ockdong.cart.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.junwo.ockdong.cart.model.vo.Cart;

public interface CartService {

	ArrayList<Cart> selectCartList(String loginUserId);

	int updateAmount(HashMap<String, String> amountMap);

	int deleteCart(String cNo);

}
