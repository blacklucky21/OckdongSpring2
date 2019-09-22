package com.junwo.ockdong.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.cart.model.vo.Payment;
import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.lbotm.model.vo.lbotm;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.notice.model.vo.Notice;
import com.junwo.ockdong.product.model.vo.ProductQna;
import com.sun.org.apache.regexp.internal.recompile;


@Repository("mDAO")
public class MemberDAO {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int memberJoin(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member memberLogin(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public ArrayList<Member> memberSelectList2(HashMap<String, String> search) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList2",search);
	}

	public int memberListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

	public ArrayList<Member> memberSelectList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList");
	}

	public ArrayList<Member> memberSecessionList(HashMap<String, String> search) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberSecession",search);
	}

	public ArrayList<Member> memberScessionListFirst() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberSecession2");
	}

	public int deleteAdminMember(String memId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteMemAdmin",memId);
	}

	public ArrayList<Member> BlackAdminList() {
		
		return (ArrayList)sqlSession.selectList("memberMapper.blackMemberList");
	}

	public ArrayList<Member> BlackListSearch(HashMap<String, String> search) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.blackMemberSearch",search);
	}

	public int BlackListCancel(String memId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.BlackListCancel",memId);
	}

	public int deleteMember(String userId) {
		return sqlSession.update("memberMapper.deleteMember",userId);
	}

	public int updatePwd(Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

	public int checkId(String userId) {
		return sqlSession.selectOne("memberMapper.checkId", userId);
	}
	
	public int checkNick(String nickName) {
		return sqlSession.selectOne("memberMapper.checkNick", nickName);
	}

	public int memberUpdate(Member m) {
		return sqlSession.update("memberMapper.memberUpdate", m);
	}

	public int getListCount() {
		return sqlSession.selectOne("memberMapper.getListCount");
	}
	
	public ArrayList<lbotm> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println(pi);
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", pi.getUserId(), rowBounds);
		
	}

	public ArrayList<Payment> myPaymentList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.myPaymentList", pi, rowBounds);
	}

	public String findId(Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int findPass(Member m) {
		return sqlSession.update("memberMapper.findPass", m);
	}

	public int getPaymentList(String userId) {
		return sqlSession.selectOne("memberMapper.getPaymentList", userId);
	}
	
	public Payment myPaymentDetailList(String p_id) {
		return sqlSession.selectOne("memberMapper.myPaymentDetailList", p_id);
	}

	public int getMyBoardList(String userId) {
		return sqlSession.selectOne("memberMapper.getMyBoardList", userId);
	}
	

	public int getMyQnAList(String userId) {
		return sqlSession.selectOne("memberMapper.getMyQnAList", userId);
	}

	public ArrayList<ProductQna> selectQnAList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectQnAList", pi.getUserId(), rowBounds);
	}

	/*
	 * public lbotm myBoardDetailView(int bNo) { return
	 * sqlSession.selectOne("memberMapper.myBoardDetailView", bNo); }
	 */

	public ProductQna myQnaDetailView(int qna_Id) {
		return sqlSession.selectOne("memberMapper.myQnaDetailView", qna_Id);
	}

	
		
}

	
