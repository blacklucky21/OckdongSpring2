package com.junwo.ockdong.product.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.product.model.vo.PictureList;
import com.junwo.ockdong.product.model.vo.Product;
import com.junwo.ockdong.product.model.vo.ProductAnswer;
import com.junwo.ockdong.product.model.vo.ProductQna;
import com.junwo.ockdong.product.model.vo.Productreview;

public interface ProductService {

	
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
	ArrayList selectList8(int i); // 딱 8개만 가지고 오기 때문에 사용 못함 메인에서 밖에 사용 못함
	ArrayList<Product> selectList8do(); // 도시락 8개
	ArrayList<Product> selectList8sal(); // 샐러드 8개

	// 정보 담아오기
	Product selectListUpdate(int p_Id);

	// 사진 담아오기
	ArrayList<PictureList> selectPt(int p_Id);

	
	// 상품 정보 수정하기
	int updateProduct(Product p);
	// 사진 수정
	int updatePicture(ArrayList<PictureList> pList);

	// =======================   전체 / 도시락 / 샐러드 가지고 오기
	int listproduct();  // 전체
	int listdo(); // 도시락

	int listsal();	// 샐러드

//	ArrayList<Product> selectList(PageInfo pi); // 상품 전체 가져가기 위한 메소드
//	
//	ArrayList<Product> selectList2(PageInfo pi); 
//	ArrayList<Product> selectList3(PageInfo pi);
	// ==========================================
		// 디테일 댓글 등록
	
	ArrayList<Productreview> selectReplyList(int p_Id); // 리스트 가지고 온다.
	int insertReply(Productreview pv); // 댓글 등록
	int deleteReply(Productreview pv); // 댓글 삭제
	int updateReply(Productreview pv); // 댓글 수정 한다.

	ArrayList<Product> selectList(PageInfo pi);
	ArrayList<Product> selectList2(PageInfo pi);
	ArrayList<Product> selectList3(PageInfo pi);
	
	
	int insertQna(ProductQna pq); // 문의글 생성
	ArrayList<ProductQna> selectQnaList(int p_Id); // 리스트 호출
	int deleteQna(ProductQna pq); // 삭제
	ArrayList<ProductQna> QnaAll();
	ArrayList<ProductQna> adminSearchQnA(String qnaStatus);
	int updateQna(ProductQna pq); // 문의 변경
	
	int insertAnswer(ProductAnswer pa); // 문의 답변
	ProductAnswer selectAnswer(ProductAnswer pa);
	ProductAnswer selectAnswer2(ProductAnswer pa);
	int updateQnaType(ProductQna pq); // qna 상태 변경
//<<<<<<< 최경천
	int updateMainPicture(Map<String, String> picture);
	int insertMainPicture(PictureList pl);
	int deletePicture(String sub3_name);
//=======
	int deleteAnswer(ProductAnswer pa); // 답글 삭제
	void updateQnaType2(ProductQna pq); // 답글 삭제시 답변 여부 다시 변경
	int AnswerUpdate(ProductAnswer pa); // 답변 수정
	int updateProducts(Product p); // 상품 변경
	int ProductCount(); // 답변 문의 안된거
	int ProductCountAll(); //모든 문의 사항
	ArrayList<ProductAnswer> selectQnaAnswer(int qna_Id); // 답장 가지고 오기
	ArrayList<ProductAnswer> answerAll();

	
	
	
	
	




	// =======================

	




	
	
}
