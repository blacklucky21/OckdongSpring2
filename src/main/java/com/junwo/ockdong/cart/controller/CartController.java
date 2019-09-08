package com.junwo.ockdong.cart.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.cart.model.service.CartService;
import com.junwo.ockdong.cart.model.vo.Cart;
import com.junwo.ockdong.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class CartController {

	
	@Autowired
	private CartService CartService;
	
	
	@RequestMapping("CartView.do")
	public ModelAndView CartView(ModelAndView mv,	
			HttpServletRequest request,HttpSession session) {
		
		
		  Member m = (Member)session.getAttribute("loginUser");
		  String loginUserId = m.getUserId();
		  System.out.println("dd"+m.getUserId());
		  ArrayList<Cart> list = CartService.selectCartList(loginUserId);
			
		  
		  System.out.println("리스트:"+list);
		  

		
		// 리스트 출력@@@@@@@@@@@@@@@@
			if(list !=null) {
				mv.addObject("list",list);
				mv.setViewName("Payment/CartListView");
				 	
			}else { 
				
			
				
			}
			
			return mv;
			
			
		  
//		if(reloadFile !=null && !reloadFile.isEmpty()) {
//			if(b.getRenameFileName()!=null) {
//				deleteFile(b.getRenameFileName(),request);
//			}
//			String renameFileName = saveFile(reloadFile,request);
//			
//			if(renameFileName !=null) {
//				b.setOriginalFileName(reloadFile.getOriginalFilename());
//				b.setRenameFileName(renameFileName);
//			}
//			
//			int result = bService.updateBoard(b);
//			
//			if(result >0) {
//				mv.addObject("page",page)
//				  .setViewName("redirect:bdetail.do?bId="+b.getbId());
//			}else {
//				throw new BoardException("게시글 등록을 실패하였습니다.");
//			}
//		}
		
	
		
	}
	
/*	
	@RequestMapping("CartSelectPayment.do")
	public String CartSelect(ModelAndView mv,	
			HttpServletRequest request,HttpSession session) {
		
		
		return null;
	}
	*/
	
	

	@RequestMapping("CartAmountUpdate.do")
	public String CartAmount(String no,String amount) {
		
		
		System.out.println(no);
		System.out.println(amount);
		
		HashMap<String,String> amountMap = new HashMap<String,String>();
		
		amountMap.put("no",no);
		amountMap.put("amount",amount);
		int updateAmount = CartService.updateAmount(amountMap);
		
	
		
		return "redirect:CartView.do";
		
	}
	
	@RequestMapping("CartDelete.del")
	public String CartDelete(String cNo) {

		
		System.out.println(cNo);
		
		String[] checkcNo =	 cNo.split(",");
		for(String c:checkcNo) {
			if(!c.equals("null")) {
				int dCart= CartService.deleteCart(c) ;
			}
		}
	
		
		
		
		return "redirect:CartView.do";
		
	}
	
	
	
	@RequestMapping("CartAllPayment.do")
	public ModelAndView CartAll(@RequestParam("totalArr") String[] totalArr,ModelAndView mv,	
			HttpServletRequest request,HttpSession session) {
		
		for(String i:totalArr) {
			
			System.out.println(i);
			
			
		}
		
		  Member m = (Member)session.getAttribute("loginUser");
		  String loginUserId = m.getUserId();
		  System.out.println("dd"+m.getUserId());

		
			
			HashMap<String,String[]> totalMap = new HashMap<String,String[]>();
			
			totalMap.put("totalArr",totalArr);
			
			ArrayList<Cart> list = CartService.CartPayment(totalMap);
		
			System.out.println(list);
			
			
			if(list !=null) {
				mv.addObject("list",list);
				mv.addObject("member",m);
				mv.setViewName("Payment/CartPaymentView");
				 	
			}else { 
				
			
				
			}
			
			return mv;
	}
	

	
	
	
}
