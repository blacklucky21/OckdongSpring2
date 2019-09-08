package com.junwo.ockdong.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.product.model.dao.ProductDAO;
import com.junwo.ockdong.product.model.vo.PictureList;
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

	// 상품 상태 변경 N로
	@Override
	public int updatePsell(int p_Id) {
		// TODO Auto-generated method stub
		return pDAO.updatePsell(p_Id);
	}
	// 상태 변경 Y 로
	@Override
	public int updatePsell2(int p_Id) {
		// TODO Auto-generated method stub
		return pDAO.updatePsell2(p_Id);
	}
	
//	 ================== 여기  2개 추가해봄 =========
	@Override
	public int inProduct(Product p) {
		// TODO Auto-generated method stub
		return pDAO.inProduct(p);
	}

	@Override
	public int inPicture(ArrayList<PictureList> pList) {
		// TODO Auto-generated method stub
		return pDAO.inPicture(pList);
	}


}
