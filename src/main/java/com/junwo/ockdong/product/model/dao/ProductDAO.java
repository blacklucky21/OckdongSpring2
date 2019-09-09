package com.junwo.ockdong.product.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.product.model.vo.PictureList;
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


	// 판매중인 리시트만 가져오기
	public ArrayList<Product> productSelectList1() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList1");
	}

	// 상품 리스트 검색 한다.
	public ArrayList<Product> searchList(Map<String, String> search) {
		return (ArrayList)sqlSession.selectList("productMapper.searchList",search);
	}

	// 상품 삭제
	public int deletedProduct(int p_Id) {
		return sqlSession.update("productMapper.deletedProduct", p_Id);
	}
	
	// 상품 상태 변경
	public int updatePsell(int p_Id) {
		// TODO Auto-generated method stub
		return sqlSession.update("productMapper.updatePsell",p_Id);
	}

	public int updatePsell2(int p_Id) {
		// TODO Auto-generated method stub
		return sqlSession.update("productMapper.updatePsell2",p_Id);
	}

	//============================================= 등록 추가
	
	public int inProduct(Product p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("productMapper.inProduct",p);
	}

	
	public int inPicture(ArrayList<PictureList> pList) {
		// TODO Auto-generated method stub
		int result = 0;
		for(int i = 0; i < pList.size(); i++) {
			if(i == 0) {
				result = sqlSession.insert("productMapper.insertMain",pList.get(0));
			}else {
				result = sqlSession.insert("productMapper.insertSub",pList.get(i));
			}
		}
		
		return result;
	}
	// 메인 게시판에 걸거 가지고 가기


	public ArrayList selectList8() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("productMapper.selectList8");
	}

	public ArrayList pictureList() {
		return (ArrayList)sqlSession.selectList("productMapper.pictureList");
	}
	
	
}
