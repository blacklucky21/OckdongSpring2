package com.junwo.ockdong.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String CartView(ModelAndView mv,	
			HttpServletRequest request,HttpSession session) {
		
		
		  Member m = (Member)session.getAttribute("loginUser");
		  String loginUserId = m.getUserId();
		  System.out.println("dd"+m.getUserId());
		  ArrayList<Cart> list = CartService.selectCartList(loginUserId);
			
		  
		  System.out.println("리스트:"+list);
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
		
		return "Payment/CartListView";
		
	}
	
	
	
}
