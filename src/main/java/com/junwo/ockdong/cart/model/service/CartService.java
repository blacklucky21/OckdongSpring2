package com.junwo.ockdong.cart.model.service;

import java.util.ArrayList;

import com.junwo.ockdong.cart.model.vo.Cart;

public interface CartService {

	ArrayList<Cart> selectCartList(String loginUserId);

}
