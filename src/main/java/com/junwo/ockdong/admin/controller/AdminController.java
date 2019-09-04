package com.junwo.ockdong.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

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
	
	
}







