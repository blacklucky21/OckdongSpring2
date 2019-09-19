package com.junwo.ockdong.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.junwo.ockdong.cart.model.vo.Payment;
import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.notice.model.vo.Notice;

public interface MemberService {

	int memberJoin(Member m);


	
	Member memberLogin(Member m);


	ArrayList<Member> SelectMemberList2(HashMap<String, String> search);


	int MemberListCount();


	ArrayList<Member> SelectMemberList();



	ArrayList<Member> SelectSecessionMemberList(HashMap<String, String> search);



	ArrayList<Member> SelectSecessionListFirst();



	int deleteAdminMember(String memId);



	ArrayList<Member> BlackListMember();



	ArrayList<Member> BlackListSearch(HashMap<String, String> search);



	int BlackListCancel(String memId);



	int MemberListCount(char c);



	int deleteMember(String userId);



	int updatePwd(Member m);



	int checkId(String userId);



	int memberUpdate(Member m);



	int checkNick(String nickName);



	int getListCount();



	ArrayList<Notice> selectList(PageInfo pi);



	ArrayList<Payment> myPaymentList(PageInfo pi);



	String findId(Member m);




	

}
