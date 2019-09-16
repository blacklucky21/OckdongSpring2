package com.junwo.ockdong.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	// 회원가입 시 아이디 중복확인
	@RequestMapping("dupid.do")
	@ResponseBody
	public String checkId(@RequestParam("userId") String userId, ModelAndView mv) {
		boolean isUsable = mService.checkId(userId) == 0 ? true: false;
		return isUsable + "";
	}
	// 회원가입 시 닉네임 중복확인
	@RequestMapping("dupnick.do")
	@ResponseBody
	public String checkNick(@RequestParam("nickName") String nickName, ModelAndView mv) {
		boolean isUsable = mService.checkNick(nickName) == 0 ? true: false;
		return isUsable + "";
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
	// id 찾기 결과
	@RequestMapping("idFindResult.me")
	public String findIdResult(@RequestParam("userName") String userName, 
							   @RequestParam("email") String email, 
							   ModelAndView mv){
		return "";
	}
	
	/*** PW찾기 ***/
	// 화면 이동
	@RequestMapping("passFind.me")
	public String findPwdView() {
		return "member/findPass";
	}
	
	/*** MyPage ***/
	// 마이페이지 화면 이동
	@RequestMapping("myPageView.me")
	public String myPageView() {
		return "myPage/member/myPage";
	}
	// 회원정보 변경 눌렀을 경우
	@RequestMapping("memberUpdate.me")
	public String memberUpdate(Model model, @ModelAttribute Member m,
							   @RequestParam("post") String post,
							   @RequestParam("address2") String address2,
							   @RequestParam("address3") String address3,
							   @RequestParam("address4") String address4) {
		m.setAddress(post + "/" + address2 + "/" + address3 + "/" + address4);
		
		int result = mService.memberUpdate(m);
		
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "myPage/member/myPage";
		}else {
			throw new MemberException("회원정보 수정 실패");
		}
	}
	
	// 구매 내역 화면 이동
	@RequestMapping("view_history.me")
	public String viewHistoryView() {
		return "myPage/buy/buyHistory";
	}
	
	// 내가 쓴 게시물 화면 이동
	@RequestMapping("reviewServletView.bo")
	public String myBoardView() {
		return "myPage/myBoard/myBoardView";
	}
	
	// 비밀번호 변경 화면 이동
	@RequestMapping("updatePwd_myPage.me")
	public String updatePwd_myPage(){
		return "myPage/updatePwd/updatePwd_myPage";
	}
	
	// 비밀번호 변경 눌렀을 경우
	@RequestMapping("updatePwd.me")
	public String memberPwdUpdate(HttpSession session,
								  @RequestParam("password") String password,
								  @RequestParam("newPwd1") String newPwd1) {
		Member m = (Member)session.getAttribute("loginUser");
		
		if(bCryptPasswordEncoder.matches(password, m.getPassword())) {
			
			m.setPassword(bCryptPasswordEncoder.encode(newPwd1));
			
			int result = mService.updatePwd(m);
			
			if(result > 0) {
				return "myPage/member/myPage";
			}else {
				throw new MemberException("비밀번호 변경 실패");
			}
			
		}else {
			throw new MemberException("비밀번호가 일치하지 않습니다.");
		}
	}
	
	// 회원탈퇴 화면 이동
	@RequestMapping("memberOutView.me")
	public String memberOutView() {
		return "myPage/memberOut/myPage_memberOut";
	}
	// 회원탈퇴 눌렀을 경우
	@RequestMapping("mdelete.me")
	public String deleteMember(@RequestParam("userId") String userId, SessionStatus status) {
		System.out.println("탈퇴했을 떄 : " + userId);
		int result = mService.deleteMember(userId);
		
		if(result > 0) {
			return "redirect:logout.me";
		}else {
			throw new MemberException("회원 탈퇴에 실패하였습니다.");
		}
	}
}
