package com.junwo.ockdong.member.model.service;

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
}
