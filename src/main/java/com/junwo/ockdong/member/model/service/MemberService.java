package com.junwo.ockdong.member.model.service;

import com.junwo.ockdong.member.model.vo.Member;

public interface MemberService {

	int memberJoin(Member m);

	Member memberLogin(Member m);

}
