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

}