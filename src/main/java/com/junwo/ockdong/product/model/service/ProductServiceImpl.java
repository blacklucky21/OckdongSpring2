package com.junwo.ockdong.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.product.model.dao.ProductDAO;
import com.junwo.ockdong.product.model.vo.Product;

@Service("pService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO pDAO;
	 
	@Override
	public int getListCount() {
		
		return pDAO.getListCount();
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public ArrayList<Product> selectList() {

		return pDAO.productSelectList();
	}

	// 등록
	@Override
	public int insertProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return pDAO.insertProduct(map);
	}

	// 판매중인것만 가지고 가는 리스트
	@Override
	public ArrayList<Product> selectList1() {

		return pDAO.productSelectList1();
	}

	// 상품 리스트 검색한다.
	@Override
	public ArrayList<Product> searchList(Map<String, String> search) {
		return pDAO.searchList(search);
	}

	// 상품 삭제
	@Override
	public int deleteProduct(int p_Id) {
		return pDAO.deletedProduct(p_Id);
	}


}
