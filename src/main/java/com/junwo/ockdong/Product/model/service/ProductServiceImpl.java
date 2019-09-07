package com.junwo.ockdong.Product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.Product.model.dao.ProductDAO;
import com.junwo.ockdong.Product.model.vo.Product;
import com.junwo.ockdong.common.PageInfo;

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
	

}
