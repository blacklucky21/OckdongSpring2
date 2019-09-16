package com.junwo.ockdong.cart.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.cart.model.vo.Cart;
import com.junwo.ockdong.cart.model.vo.PayProduct;
import com.junwo.ockdong.cart.model.vo.Payment;

@Repository("cDAO")
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public ArrayList<Cart> selectCartList(String loginUserId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList",loginUserId);
	}


	
	public int updateAmount(HashMap<String, String> amountMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("cartMapper.updateAmount",amountMap);
	}


	public int deleteCart(String cNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cartMapper.delCart",cNo);
	}


	public ArrayList<Cart> cartPayment(HashMap<String, String[]> totalMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("cartMapper.cartPaymentList",totalMap);
	}


	public int insertPayment(HashMap<String, String[]> totalMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cartMapper.insertPayment",totalMap);
	}


	public int PaymentInsertDB(Payment p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cartMapper.PaymentInsertDB",p);
	}


	public int delCartNum(HashMap<String, String[]> totalMap) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cartMapper.delCartNum",totalMap);
	}


	public Payment SelectPayMem(int checkno) {
		// TODO Auto-generated method stub
		return (Payment)sqlSession.selectOne("cartMapper.selectPayMem",checkno);
	}


	public int plzPayNum() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cartMapper.PayNum");
	}








	
}
