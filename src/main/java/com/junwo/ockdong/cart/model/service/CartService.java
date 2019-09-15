package com.junwo.ockdong.cart.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.junwo.ockdong.cart.model.vo.Cart;
import com.junwo.ockdong.cart.model.vo.PayProduct;
import com.junwo.ockdong.cart.model.vo.Payment;

public interface CartService {

	ArrayList<Cart> selectCartList(String loginUserId);

	int updateAmount(HashMap<String, String> amountMap);

	int deleteCart(String cNo);

	ArrayList<Cart> CartPayment(HashMap<String, String[]> totalMap);

	int insertPayment(HashMap<String, String[]> totalMap);


	int PaymentInsertDB(Payment p);

	int delCartNum(HashMap<String, String[]> totalMap);

	Payment SelectPayMem(int checkno);





}
