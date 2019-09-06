package com.junwo.ockdong.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.member.model.vo.Member;


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

	
}
