package com.junwo.ockdong.Product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.Product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	// 상품 정보 가지고 가기
	public ArrayList<Product> productSelectList() {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
	}

	// 상품 등록하기
	public int insertProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertProduct", map);
	}

	// 판매중인 리시트만 가져오기
	public ArrayList<Product> productSelectList1() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList1");
	}
	
}
