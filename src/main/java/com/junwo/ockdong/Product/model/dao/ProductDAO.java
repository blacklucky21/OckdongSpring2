package com.junwo.ockdong.Product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.junwo.ockdong.Product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertProduct(Product p, ArrayList<MultipartFile> list) {
		return 0;
		/* return sqlSession.insert("insertProduct" , p , list); */
	}
	
}
