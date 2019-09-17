package com.junwo.ockdong.cart.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.cart.model.dao.CartDAO;
import com.junwo.ockdong.cart.model.vo.Cart;
import com.junwo.ockdong.cart.model.vo.Payment;


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

	@Override
	public int insertPayment(HashMap<String, String[]> totalMap) {
		// TODO Auto-generated method stub
		return cDAO.insertPayment(totalMap);
	}

	@Override
	public int PaymentInsertDB(Payment p) {
		// TODO Auto-generated method stub
		return cDAO.PaymentInsertDB(p);
	}

	@Override
	public int delCartNum(HashMap<String, String[]> totalMap) {

		return cDAO.delCartNum(totalMap);
	}

	@Override
	public Payment SelectPayMem(int checkno) {
		// TODO Auto-generated method stub
		return cDAO.SelectPayMem(checkno);
	}

	@Override
	public int checkNum() {
		// TODO Auto-generated method stub
		return cDAO.plzPayNum();
	}

	@Override
	public ArrayList<Payment> PayList() {
		// TODO Auto-generated method stub
		return cDAO.selectPayList();
	}

	@Override
	public ArrayList<Payment> selectPayList(HashMap<String, String> search) {
		// TODO Auto-generated method stub
		return cDAO.selectPayListSearch(search);
	}

	@Override
	public int updateStatus(HashMap<String, String> ppcheck) {
		// TODO Auto-generated method stub
		return cDAO.updateStatus(ppcheck);
	}





	


}
