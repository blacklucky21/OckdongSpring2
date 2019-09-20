package com.junwo.ockdong.lbotm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.common.PaginationComment;
import com.junwo.ockdong.common.boardMarking;
import com.junwo.ockdong.lbotm.model.exception.lbotmException;
import com.junwo.ockdong.lbotm.model.service.lbotmService;
import com.junwo.ockdong.lbotm.model.vo.lbotm;
import com.junwo.ockdong.member.model.vo.Member;

@Controller
public class lbotmController {
	
	@Autowired
	lbotmService lbotmService;
	
	@RequestMapping("blist.do")
	public String boastList() {
		return "lbotm/lbotmList";
	}
	
	@RequestMapping("binsert.do")
	public String boastInsert() {
		return "lbotm/lbotmInsert";
	}
	
	@RequestMapping("bdetail.do")
	public String boastDetail() {
		return "lbotm/lbotmDetail";
	}
	
	@RequestMapping("home.do")
	public String homeList(Model model, PageInfo pi, int ct_Id, int nNo) {
		int currentPage = 1;
		
		if(pi.getCurrentPage() > 0) {
			currentPage = pi.getCurrentPage();
		}
		
		try {
			int listCount = lbotmService.selectBoardListCount(ct_Id);
			PageInfo info = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<lbotm> list = lbotmService.selectHomeList(info, ct_Id);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("ct_Id", ct_Id);
			
			return "lbotm/lbotmList";
		} catch (lbotmException e) {
			model.addAttribute("msg", e.getMessage());
			return "commom/errorPage";
		}
	}

}
