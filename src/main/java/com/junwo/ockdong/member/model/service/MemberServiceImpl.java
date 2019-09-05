package com.junwo.ockdong.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.member.model.dao.MemberDAO;
import com.junwo.ockdong.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDAO;

	
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
		// TODO Auto-generated method stub
		
	}


}
