package com.junwo.ockdong.Product.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.junwo.ockdong.Product.model.vo.Product;
import com.junwo.ockdong.common.PageInfo;

public interface ProductService {

	int getListCount(); // 전체 갯수 가지고 옴
	
	// 정수 값 바틍으로 페이징 처리 해준다.
	
	ArrayList<Product> selectList(PageInfo pi);
	
	// 이후 게시글 등록 할수 있게 한다.
	
	int insertProduct(Product p, ArrayList<MultipartFile> list);
}
