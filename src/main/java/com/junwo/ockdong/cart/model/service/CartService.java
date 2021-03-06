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

	int checkNum();

	ArrayList<Payment> PayList();

	ArrayList<Payment> selectPayList(HashMap<String, String> search);

	int updateStatus(HashMap<String, String> ppcheck);

	int insertPayProduct(PayProduct pp);

	int CartInsert(Cart c);

	int UpdateProductCount(Cart c);

	int CountPay();

	int PayMoney();

	int PayToday();

	int PayMonth();

	int MemberAll();

	int MemberBlack();

	int MemberSecession();

	int ProductCount();

	int ProductStop();

	int ProductSoldOut();

	ArrayList<PayProduct> selectBuyList(String modal);

	int UpdateCartCount(Cart cart);

	int ProductCountdo();

	int ProductCountsel();

	






}
