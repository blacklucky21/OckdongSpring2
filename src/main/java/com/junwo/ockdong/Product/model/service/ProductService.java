package com.junwo.ockdong.Product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.junwo.ockdong.Product.model.vo.Product;
import com.junwo.ockdong.common.PageInfo;

public interface ProductService {

	int getListCount(); // 전체 갯수 가지고 옴
	
	// 정수 값 바틍으로 페이징 처리 해준다.
	
	ArrayList<Product> selectList(PageInfo pi);

	// 리스트 가지고 가기
	ArrayList<Product> selectList();
	ArrayList<Product> selectList1();

	// 게시글 등록 /
	int insertProduct(HashMap<String, Object> map);
	
	
	
}
