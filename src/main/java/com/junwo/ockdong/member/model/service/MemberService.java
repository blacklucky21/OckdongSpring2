package com.junwo.ockdong.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.junwo.ockdong.member.model.vo.Member;

public interface MemberService {

	int memberJoin(Member m);

<<<<<<< Updated upstream
=======
	
	Member memberLogin(Member m);


	ArrayList<Member> SelectMemberList2(HashMap<String, String> search);


	int MemberListCount();


	ArrayList<Member> SelectMemberList();






>>>>>>> Stashed changes
}
