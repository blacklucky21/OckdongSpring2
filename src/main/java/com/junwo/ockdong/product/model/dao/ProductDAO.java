package com.junwo.ockdong.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.product.model.vo.Product;

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

	// 상품 리스트 검색 한다.
	public ArrayList<Product> searchList(Map<String, String> search) {
		return (ArrayList)sqlSession.selectList("productMapper.searchList",search);
	}

	public int deletedProduct(int p_Id) {
		return sqlSession.update("productMapper.deletedProduct", p_Id);
	}
	
}
