package com.junwo.ockdong.product.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.notice.model.vo.PageInfo;
import com.junwo.ockdong.product.model.dao.ProductDAO;
import com.junwo.ockdong.product.model.vo.PictureList;
import com.junwo.ockdong.product.model.vo.Product;
import com.junwo.ockdong.product.model.vo.Productreview;

@Service("pService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO pDAO;
	 

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
// ===================================================
	// 메인에 상품과 사진 가지고 가기


	@Override
	public ArrayList selectList8(int i) {
		ArrayList list = null;
		if(i == 1) {
			list = pDAO.selectList8();
		}else {
			list = pDAO.pictureList();
		}
		
		return list;
	}
	
	@Override
	public ArrayList<Product> selectList8do() {
		return pDAO.selectList8do();
	}

	@Override
	public ArrayList<Product> selectList8sal() {
		return pDAO.selectList8sal();
	}
// ===================================================
	// 객체를 담아올 정보
	@Override
	public Product selectListUpdate(int p_Id) {
		// TODO Auto-generated method stub
		return pDAO.selectProduct(p_Id);
	}

	// 사진을 담아올 정보
	@Override
	public ArrayList<PictureList> selectPt(int p_Id) {
		return pDAO.selectPt(p_Id);
	}
	

// ===================================================
	// 상품 정보 수정하기
	@Override
	public int updateProduct(Product p) {
		// TODO Auto-generated method stub
		return pDAO.updateProduct(p);
	}

	// 사진 수정 하기
	@Override
	public int updatePicture(ArrayList<PictureList> pList) {
		// TODO Auto-generated method stub
		return pDAO.updatePicture(pList);
	}
// =======================================================================================
	// 페이징 하기 위해서 갯수 가지고 온다.
	@Override
	public int listproduct() {
		return pDAO.listproduct();
	}

	@Override
	public int listdo() {
		return pDAO.listdo(); // 도시락 타입
	}

	@Override
	public int listsal() {
		return pDAO.listsal(); // 샐러드 타입
	}

	// 페이징 처리 하기 위해서 리스트와 함게 가지고 간다.
	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		return pDAO.selectList(pi);
	}

	@Override
	public ArrayList<Product> selectList2(PageInfo pi) {
		return pDAO.selectList2(pi);
	}

	@Override
	public ArrayList<Product> selectList3(PageInfo pi) {
		return pDAO.selectList3(pi);
	}

	// 상세페이지 댓글 등록
	@Override
	public int insertReply(Productreview pv) {
		return pDAO.insertReply(pv);
	}

	// 상품 디테일 댓글 리스트 읽어가기
	@Override
	public ArrayList<Productreview> selectReplyList(int p_Id) {
		return pDAO.selectRelyList(p_Id);
	}



	





	
	

}
