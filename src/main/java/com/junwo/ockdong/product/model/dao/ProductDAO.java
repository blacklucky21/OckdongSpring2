package com.junwo.ockdong.product.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.product.model.vo.PictureList;
import com.junwo.ockdong.product.model.vo.Product;
import com.junwo.ockdong.product.model.vo.ProductAnswer;
import com.junwo.ockdong.product.model.vo.ProductQna;
import com.junwo.ockdong.product.model.vo.Productreview;

@Repository("pDAO")
public class ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

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
// =======================================	
	// 상품 상태 변경
	public int updatePsell(int p_Id) {
		// TODO Auto-generated method stub
		return sqlSession.update("productMapper.updatePsell",p_Id);
	}

	public int updatePsell2(int p_Id) {
		// TODO Auto-generated method stub
		return sqlSession.update("productMapper.updatePsell2",p_Id);
	}
// =======================================	
	
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
// ==============================================	
	// 메인 게시판에 걸거 가지고 가기
	public ArrayList selectList8() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("productMapper.selectList8"); 
		
	}

	public ArrayList pictureList() {
		return (ArrayList)sqlSession.selectList("productMapper.pictureList");
	}
	
	public ArrayList<Product> selectList8do() {
		return (ArrayList)sqlSession.selectList("productMapper.selectList8do");
	}


	public ArrayList<Product> selectList8sal() {
		return (ArrayList)sqlSession.selectList("productMapper.selectList8sal");
	}

// ===================================
	
	public ArrayList<Product> selectUpdate(int p_Id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("productMapper.selectUpdate");
	}

	// 객체 정보를 가지고 오기
	public Product selectProduct(int p_Id) {
		return sqlSession.selectOne("productMapper.updateProduct",p_Id);
	}

	public ArrayList<PictureList> selectPt(int p_Id) {
		return (ArrayList)sqlSession.selectList("productMapper.updatePicture",p_Id);
	}
//====================================================
	// 상품 수정하기
	public int updateProduct(Product p) {
		return sqlSession.update("productMapper.updateProduct",p);
	}

	public int updatePicture(ArrayList<PictureList> pList) {
		int result = 0;
		for(int i = 0; i < pList.size(); i++) {
			if(i == 0) {
				result = sqlSession.update("productMapper.updateMain",pList.get(0));
			}else {
				result = sqlSession.update("productMapper.updateSub",pList.get(i));
			}
		}
			
		return result;
	}
// ==========  상품 디테일 페이징   페이징 위해 갯수 가지고 가는 것분 =============================================

	public int listproduct() {
		return sqlSession.selectOne("productMapper.listproduct");
	}

	public int listdo() {
		return sqlSession.selectOne("productMapper.listdo");
	}

	public int listsal() {
		return sqlSession.selectOne("productMapper.listsal");
	}


	public ArrayList<Product> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("productMapper.select", null, rowBounds);
	}


	public ArrayList<Product> selectList2(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectType1", null, rowBounds);
	}

	public ArrayList<Product> selectList3(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectType2", null, rowBounds);
	}

	// 댓글 리스트 가지고 가기
	public ArrayList<Productreview> selectRelyList(int p_Id) {
		return (ArrayList)sqlSession.selectList("productMapper.selectReplyList",p_Id);
	}
	// 상세 페이지 댓글 등록
	public int insertReply(Productreview pv) {
		return sqlSession.insert("productMapper.insertReply" ,pv);
	}


	// 댓글 삭제
	public int deleteReply(Productreview pv) {
		return sqlSession.delete("productMapper.deleteReply",pv);
	}

	// 댓글 수정한다.
	public int updateReply(Productreview pv) {
		return sqlSession.update("productMapper.updateReply",pv);
	}


	// qna 등록
	public int insertQna(ProductQna pq) {
		return sqlSession.insert("productMapper.insertQna", pq);
	}

	// qna 리스트 읽어 가기
	public ArrayList<ProductQna> selectQnaList(int p_Id) {
		return (ArrayList)sqlSession.selectList("productMapper.selectQnaList" , p_Id);
	}

	// qna 삭제
	public int deleteQna(ProductQna pq) {
		return sqlSession.update("productMapper.deletedQna", pq);
	}

	public ArrayList<ProductQna> QnaAll() {
		return (ArrayList)sqlSession.selectList("productMapper.QnaAdminList");
	}


	public ArrayList<ProductQna> adminSearchQnA(String qnaStatus) {
		return (ArrayList)sqlSession.selectList("productMapper.adminSearchQnA", qnaStatus);
	}


	public int updateQna(ProductQna pq) {
		return sqlSession.update("productMapper.updateQna",pq);
	}


	public int insertAnswer(ProductAnswer pa) {
		return sqlSession.insert("productMapper.insertAnswer",pa);
	}


	public ProductAnswer selectAnswer(ProductAnswer pa) {
		return sqlSession.selectOne("productMapper.selectAnswer",pa);
	}


	public ProductAnswer selectAnswer2(ProductAnswer pa) {
		return sqlSession.selectOne("productMapper.selectAnswer2",pa);
	}


	public int updateQnaType(ProductQna pq) {
		return sqlSession.update("productMapper.updateQnaType",pq);
	}



	




	
	//==============================
}
