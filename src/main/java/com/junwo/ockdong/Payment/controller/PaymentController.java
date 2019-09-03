package com.junwo.ockdong.Payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
	
	
	@RequestMapping("CartView.do")
	public String CartView() {
		
		
		return"Payment/CartListView";
		
		
	}
	
	@RequestMapping("CartSelectPayment.do")
	public String CartSelectView() {
		
		return"Payment/CartPaymentView";
	}
	
	
	@RequestMapping("CartAllPayment.do")
	public String CartAllView() {
		
		return"Payment/CartPaymentView";
	}
	
	@RequestMapping("paymentResult.do")
	public String CartResult() {
		
		return"Payment/PaymentResultView";
	}
	
}
