package com.junwo.ockdong.admin.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.member.model.service.MemberService;
import com.junwo.ockdong.member.model.vo.Member;


@Controller
public class AdminController {
	@Autowired
	private MemberService mService;
	
	@RequestMapping("adminView.do")
	public String adminView() {

		return "admin/adminMain";
	}

	@RequestMapping("adminPaymentList.do")
	public String adminPaymentList() {

		return "admin/Payment/adminPayment";
	}

	@RequestMapping("productList.do")
	public String productList() {
		
		
		return "admin/products/productList";
	}
	
	// 관리자에서 로고 누를시 처음 화면으로 이동
	@RequestMapping("adminhome.do")
	public String adminHome() {
		return "admin/adminMain";
	}
	
	//결제 통합리스트
	
	@RequestMapping("PayResultList.do")
	public String PayResultList() {
		
		return"admin/Payment/adminResultList";
	}
	
	@RequestMapping("adminWarnning.do")
	public String Warnninng() {
		
		return"admin/Payment/adminWarnningList";
	}
	
	// 메인 화면 로고 누르면 메인 화면으로 이동한다.ㄴ
	@RequestMapping("main.do")
	public String main() {
		return "Main";
	}
	
	// 나만의 도시락 관리 페이지
	@RequestMapping("mydo.do")
	public String mydo() {
		return "admin/mydo/myOwn_lunch";
	}
	
	// 나만의 도시락 재료관리
	@RequestMapping("myIn")
	public String myIn() {
		return "admin/mydo/myOwn_Ingredients";
	}
	
	// 나만의 도시락 재료 등록
	@RequestMapping("IngredientsInsert.do")
	public String IngredientsInsert() {
		return "admin/mydo/myOwn_Ingredients_Insert";
	}
	
	// 상품관리 상품등록
	@RequestMapping("productsInsert.do")
	public String productsInert() {
		return "admin/products/productInsert";
	}
	
	// 상품 문의
	@RequestMapping("productInquiry.do")
	public String productInquiry() {
		return "admin/products/productInquiry";
	}
	
	// 회원리스트~~
		@RequestMapping("adminMemberList.do")
	public ModelAndView adminMemberList(@RequestParam(value="page",required=false)ModelAndView mv)  {	
		mv = new ModelAndView(); 
	
		
		ArrayList<Member> list = mService.SelectMemberList();
		
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/Member/adminMemberList");
			 	
		}else {
			
		
			
		}
		
		return mv;
		
		
	}
	
	
	
	@RequestMapping("adminMemberList2.do")
	public ModelAndView adminMemberList2(@RequestParam(value="page",required=false)ModelAndView mv,@RequestParam("searchInput")String searchInput
			,@RequestParam("searchForm")String searchForm,@RequestParam("startDatePicker")String startDatePicker,String endDatePicker)  {	
		mv = new ModelAndView(); 
		System.out.println(searchInput);
		System.out.println(searchForm);
		System.out.println(endDatePicker);
		System.out.println(startDatePicker);
		
		
		HashMap<String,String> search = new HashMap<String,String>();
		search.put("searchInput",searchInput);
		search.put("searchForm",searchForm);
		search.put("startDatePicker",startDatePicker);
		search.put("endDatePicker",endDatePicker);
		ArrayList<Member> list = mService.SelectMemberList2(search);
//		int listCount = mService.MemberListCount();
//		System.out.println(list);
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/Member/adminMemberList");
			 	
		}else {
			
		
			
		}
		
		return mv;
		
		
	}
	
	//탈퇴 회원 리스트~~
	

	@RequestMapping("adminSecessionList.do")
	public ModelAndView adminSecession(@RequestParam(value="page",required=false)ModelAndView mv,@RequestParam("searchInput")String searchInput
			,@RequestParam("searchForm")String searchForm,@RequestParam("startDatePicker")String startDatePicker,String endDatePicker)  {	
		mv = new ModelAndView(); 
		System.out.println(searchInput);
		System.out.println(searchForm);
		System.out.println(endDatePicker);
		System.out.println(startDatePicker);
		
		
		HashMap<String,String> search = new HashMap<String,String>();
		search.put("searchInput",searchInput);
		search.put("searchForm",searchForm);
		search.put("startDatePicker",startDatePicker);
		search.put("endDatePicker",endDatePicker);
		ArrayList<Member> list = mService.SelectSecessionMemberList(search);
//		int listCount = mService.MemberListCount();
//		System.out.println(list);
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/Member/adminMemberSecession");
			 	
		}else {
			
		
			
		}
		
		return mv;
	}
	
	
	@RequestMapping("adminSecession2.do")
public ModelAndView adminScessionMemberFirst(@RequestParam(value="page",required=false)ModelAndView mv)  {	
	mv = new ModelAndView(); 

	
	ArrayList<Member> list = mService.SelectSecessionListFirst();
	
	if(list !=null) {
		mv.addObject("list",list);
		mv.setViewName("admin/Member/adminMemberSecession");
		 	
	}else {
		
	
		
	}
	
	return mv;
	
	
}


}


