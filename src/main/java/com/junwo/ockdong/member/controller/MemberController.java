package com.junwo.ockdong.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.junwo.ockdong.member.model.exception.MemberException;
import com.junwo.ockdong.member.model.service.MemberService;
import com.junwo.ockdong.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/*** Join ***/
	// 페이지 이동
	@RequestMapping("enrollView.me")
	public String enrollView() {
		return "member/joinAgree";
	}
	// 가입 하기 버튼 눌렀을 경우
	@RequestMapping("memberJoin.me")
	public String memberJoin(@ModelAttribute Member m,
							 @RequestParam("address1") String address1,
							 @RequestParam("address2") String address2,
							 @RequestParam("address3") String address3,
							 @RequestParam("address4") String address4) {
		String encPwd = bCryptPasswordEncoder.encode(m.getPassword());
		m.setPassword(encPwd);
		m.setAddress(address1 + "/" + address2 + "/" + address3 + "/" + address4);
		
		int result = mService.memberJoin(m);
		if(result > 0) {
			return "Main";
		}else {
			throw new MemberException("회원 가입에 실패하였습니다.");
		}
	}
	
	
}
