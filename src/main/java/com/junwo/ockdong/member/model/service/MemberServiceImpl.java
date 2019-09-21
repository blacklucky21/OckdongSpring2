package com.junwo.ockdong.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.cart.model.vo.Payment;
import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.lbotm.model.vo.lbotm;
import com.junwo.ockdong.member.model.dao.MemberDAO;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.product.model.vo.ProductQna;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public int memberJoin(Member m) {
		return mDAO.memberJoin(m);
	}


	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(m);
	}

	@Override
	public ArrayList<Member> SelectMemberList2(HashMap<String, String> search) {
		// TODO Auto-generated method stub
		return mDAO.memberSelectList2(search);
	}

	@Override
	public int MemberListCount() {
		// TODO Auto-generated method stub
		return mDAO.memberListCount();
	}

	@Override
	public ArrayList<Member> SelectMemberList() {
		// TODO Auto-generated method stub
		return mDAO.memberSelectList();
	}


	@Override
	public ArrayList<Member> SelectSecessionMemberList(HashMap<String, String> search) {
		
		return mDAO.memberSecessionList(search);
		
	}


	@Override
	public ArrayList<Member> SelectSecessionListFirst() {
		// TODO Auto-generated method stub
		return mDAO.memberScessionListFirst();
	}


	@Override
	public int deleteAdminMember(String memId) {
		// TODO Auto-generated method stub
		return mDAO.deleteAdminMember(memId);
	}


	@Override
	public ArrayList<Member> BlackListMember() {
		// TODO Auto-generated method stub
		return mDAO.BlackAdminList();
	}


	@Override
	public ArrayList<Member> BlackListSearch(HashMap<String, String> search) {
		// TODO Auto-generated method stub
		return mDAO.BlackListSearch(search);
	}


	@Override
	public int BlackListCancel(String memId) {


		
		return mDAO.BlackListCancel(memId);
		
	}



	@Override
	public int MemberListCount(char c) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteMember(String userId) {
		return mDAO.deleteMember(userId);
	}


	@Override
	public int updatePwd(Member m) {
		return mDAO.updatePwd(m);
	}


	@Override
	public int checkId(String userId) {
		return mDAO.checkId(userId);
	}

	@Override
	public int checkNick(String nickName) {
		return mDAO.checkNick(nickName);
	}

	@Override
	public int memberUpdate(Member m) {
		return mDAO.memberUpdate(m);
	}


	@Override
	public int getListCount() {
		return mDAO.getListCount();
	}


	@Override
	public ArrayList<lbotm> selectList(PageInfo pi) {
		return mDAO.selectList(pi);
	}


	@Override
	public ArrayList<Payment> myPaymentList(PageInfo pi) {
		return mDAO.myPaymentList(pi);
	}


	@Override
	public String findId(Member m) {
		return mDAO.findId(m);
	}


	@Override
	public int findPass(Member m) {
		return mDAO.findPass(m);
	}


	@Override
	public boolean send(String subject, String text, String from, String to) {
	      MimeMessage message = mailSender.createMimeMessage();

	      try {
	         MimeMessageHelper helper = new MimeMessageHelper(message, true);
	         helper.setSubject(subject);
	         helper.setText(text);
	         helper.setFrom(from);
	         helper.setTo(to);

	         mailSender.send(message);
	         return true;
	      } catch (MessagingException e) {
	         e.printStackTrace();
	      }

	      return false;
	}


	@Override
	public int getPaymentList(String userId) {
		return mDAO.getPaymentList(userId);
	}


	@Override
	public int getMyBoardList(String userId) {
		return mDAO.getMyBoardList(userId);
	}


	@Override
	public int getMyQnAList(String userId) {
		return mDAO.getMyQnAList(userId);
	}


	@Override
	public ArrayList<ProductQna> selectQnAList(PageInfo pi) {
		return mDAO.selectQnAList(pi);
	}







}
