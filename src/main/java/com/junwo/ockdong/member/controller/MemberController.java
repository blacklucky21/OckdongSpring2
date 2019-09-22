package com.junwo.ockdong.member.controller;


import java.util.ArrayList;
import java.util.UUID;

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

import com.junwo.ockdong.cart.model.service.CartService;
import com.junwo.ockdong.cart.model.vo.PayProduct;
import com.junwo.ockdong.cart.model.vo.Payment;
import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.lbotm.model.vo.lbotm;
import com.junwo.ockdong.member.model.exception.MemberException;
import com.junwo.ockdong.member.model.service.MemberService;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.notice.model.exception.NoticeException;
import com.junwo.ockdong.product.model.vo.ProductQna;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private CartService CartService;
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
	public ModelAndView findIdResult(@RequestParam("userName") String userName, 
							   @RequestParam("email") String email, 
							   Member m, ModelAndView mv){
		m.setUserName(userName);
		m.setEmail(email);
		System.out.println(userName);
		System.out.println(email);
		
		String result = mService.findId(m);
		
		
		if(result != null) {
			mv.addObject("userId",result);
			mv.setViewName("member/findIdResult");
		}else {
			throw new MemberException("아이디 찾기 실패");
		}
		
		return mv;
	}
	
	/*** PW찾기 ***/
	// 화면 이동
	@RequestMapping("passFind.me")
	public String findPwdView() {
		return "member/findPass";
	}
	@RequestMapping("findPassBefore.me")
	public String findPassBefore() {
		return "member/findPassBefore";
	}
	// 비밀번호 찾기 결과
	@RequestMapping("passFindResult.me")
	@ResponseBody
	public String findPassResult(@RequestParam("userId") String userId, 
							   @RequestParam("email") String email,							 
							   Member m) {
		m.setUserId(userId);
		m.setEmail(email);
		
		String newPass = sendMail(m, email);
		
		m.setPassword(bCryptPasswordEncoder.encode(newPass));
		
		int result = mService.findPass(m);

		if(result > 0) {
			return newPass;
		}else {
			throw new MemberException("비밀번호 찾기 실패");
		}
	}
	
    public String sendMail(Member m, @RequestParam String email) {
       String randomCode = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
       randomCode = randomCode.substring(0, 6);
       String newPass = String.valueOf(randomCode);
       
       String subject = "회원 가입 승인번호 입니다.";
       StringBuilder sb = new StringBuilder();
       sb.append("회원가입 승인 번호는 ").append(newPass).append(" 입니다.");
       
       if(mService.send(subject, sb.toString(), "seok1721@gamil.com", email)) {
    	   return newPass;
       } else {
    	   return "fail";
       }
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
	public ModelAndView viewHistoryView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv,HttpSession session) {
		int currentPage = 1;
		Member m = (Member)session.getAttribute("loginUser");
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getPaymentList(m.getUserId());
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		pi.setUserId(m.getUserId());
		
		ArrayList<Payment> pList = mService.myPaymentList(pi);
		
		if(pList != null) {
			mv.addObject("list", pList);
			mv.addObject("pi", pi);
			mv.setViewName("myPage/buy/buyHistory");
		} else {
			throw new NoticeException("구매내역 조회에 실패 하였습니다.");
		}
		
		return mv;
	}
	
	// 구매 내역 디테일 뷰
	@RequestMapping("buyDetail.me")
	public ModelAndView buyDetailView(@ModelAttribute("initPayment") Payment payment,
										ModelAndView mv,HttpSession session){	
		
		
		System.out.println(payment.getP_id());
		String val = payment.getP_id();
		
		Payment paymentDetail = mService.myPaymentDetailList(payment.getP_id());	
		ArrayList<PayProduct> list = CartService.selectBuyList(val);
		if(paymentDetail != null) {
			mv.addObject("list", paymentDetail);
			mv.addObject("list2", list);
			mv.setViewName("myPage/buy/buyHistoryDetailView");
		} else {
			throw new NoticeException("구매내역 조회에 실패 하였습니다.");
		}	
		
		return mv;
	}
	
	// 내가 쓴 게시물 화면 이동
	@RequestMapping("reviewServletView.bo")
	public ModelAndView myBoardView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		
		int currentPage = 1;
		Member m = (Member)session.getAttribute("loginUser");
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMyBoardList(m.getUserId());
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		pi.setUserId(m.getUserId());
		
		ArrayList<lbotm> nList = mService.selectList(pi);
		System.out.println(nList);
		
		
		if(nList != null) {
			mv.addObject("list", nList);
			mv.addObject("pi", pi);
			mv.setViewName("myPage/myBoard/myBoardView");
		}else {
			throw new NoticeException("게시판 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	/*
	 * // 내가 쓴 게시물 디테일 뷰
	 * 
	 * @RequestMapping("myBoardDetailView.me") public ModelAndView
	 * myBoardDetailView(@ModelAttribute("initPayment") lbotm lBotm, ModelAndView
	 * mv, HttpSession session) {
	 * 
	 * 
	 * lbotm BoardDetail = mService.myBoardDetailView(lBotm.getbNo());
	 * 
	 * if (BoardDetail != null) { mv.addObject("list", BoardDetail);
	 * mv.setViewName("myPage/myBoard/myBoardDetailView"); } else { throw new
	 * NoticeException("게시글 조회에 실패 하였습니다."); }
	 * 
	 * return mv; }
	 */
	
	// 상품문의 화면 이동
	@RequestMapping("reviewListView.bo")
	public ModelAndView myQnAView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		
		int currentPage = 1;
		Member m = (Member)session.getAttribute("loginUser");
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMyQnAList(m.getUserId());
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		pi.setUserId(m.getUserId());
		
		ArrayList<ProductQna> nList = mService.selectQnAList(pi);
		System.out.println(nList);
		
		if(nList != null) {
			mv.addObject("list", nList);
			mv.addObject("pi", pi);
			mv.setViewName("myPage/productQnA/productQnAView");
		}else {
			throw new NoticeException("상품문의 조회에 실패하였습니다.");
		}
		
		
		return mv;
	}
	// 문의내역 디테일 뷰
	@RequestMapping("myQnaDetailView.me")
	public ModelAndView myQnaDetailView(@ModelAttribute("initPayment") ProductQna qna, 
										  ModelAndView mv,
										  HttpSession session) {


		ProductQna QnaDetail = mService.myQnaDetailView(qna.getQna_Id());

		if (QnaDetail != null) {
			mv.addObject("list", QnaDetail);
			mv.setViewName("myPage/productQnA/myQnaDetailView");
		} else {
			throw new NoticeException("게시글 조회에 실패 하였습니다.");
		}

		return mv;
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
