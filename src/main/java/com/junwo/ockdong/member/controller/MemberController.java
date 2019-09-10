package com.junwo.ockdong.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	// 약관 페이지 이동
	@RequestMapping("enrollView.me")
	public String agreeView() {
		return "member/joinAgree";
	}
	// 가입 페이지 이동
	@RequestMapping("memberJoinView.me")
	public String insertView() {
		return "member/memberJoin";
	}
	// 가입 하기 버튼 눌렀을 경우
	@RequestMapping("memberJoin.me")
	public String memberJoin(@ModelAttribute Member m,
							 @RequestParam("post") String post,
							 @RequestParam("address2") String address2,
							 @RequestParam("address3") String address3,
							 @RequestParam("address4") String address4) {
		String encPwd = bCryptPasswordEncoder.encode(m.getPassword());
		m.setPassword(encPwd);
		m.setAddress(post + "/" + address2 + "/" + address3 + "/" + address4);
		
		int result = mService.memberJoin(m);
		
		
		if(result > 0) {
			return "Main";
		}else {
			throw new MemberException("회원 가입에 실패하였습니다.");
		}
	}
	
	/*** Login ***/
	@RequestMapping("loginView.me")
	public String loginView() {
		return "member/login";
	}
	@RequestMapping(value="login.me", method = RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		
	
		Member loginUser = mService.memberLogin(m);
		System.out.println("login member : " + loginUser);
		
		if(bCryptPasswordEncoder.matches(m.getPassword(), loginUser.getPassword())) {
			model.addAttribute("loginUser", loginUser);
		}else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
		return "Main";
	}
	
	
	/*** Logout ***/
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "Main";
	}
	
	/*** ID찾기 ***/
	// 화면 이동
	@RequestMapping("idFind.me")
	public String findIdView() {
		return "member/findId";
	}
	
	/*** PW찾기 ***/
	// 화면 이동
	@RequestMapping("passFind.me")
	public String findPwdView() {
		return "member/findPass";
	}
	
	/*** MyPage ***/
	// 화면 이동
	@RequestMapping("myPageView.me")
	public String myPageView() {
		return "myPage/myPage";

	}
	
}
