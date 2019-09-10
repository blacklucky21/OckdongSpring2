package com.junwo.ockdong.product.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.product.model.vo.PictureList;
import com.junwo.ockdong.product.model.vo.Product;

public interface ProductService {

	int getListCount(); // 전체 갯수 가지고 옴
	
	// 정수 값 바틍으로 페이징 처리 해준다.
	ArrayList<Product> selectList(PageInfo pi);

	// 리스트 가지고 가기
	ArrayList<Product> selectList();
	ArrayList<Product> selectList1();


	// 상품 검색 리스트
	ArrayList<Product> searchList(Map<String, String> search);

	// 상품을 삭제 한다.
	int deleteProduct(int p_Id);

	// 상품 상태 변경 N 로
	int updatePsell(int p_Id);

	int updatePsell2(int p_Id);

	// 상품 등록 정보
	int inProduct(Product p);

	int inPicture(ArrayList<PictureList> pList);

	// 메인 화면 리스트 8개 가지고 가기
	// 사진이랑 리스트 다 가지고 온다.
	ArrayList selectList8(int i);


	// 정보 담아오기
	Product selectListUpdate(int p_Id);

	// 사진 담아오기
	ArrayList<PictureList> selectPt(int p_Id);



	




	
	
}
