package com.junwo.ockdong.lbotm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.lbotm.model.exception.lbotmException;
import com.junwo.ockdong.lbotm.model.service.lbotmService;
import com.junwo.ockdong.lbotm.model.vo.lbotm;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.notice.model.exception.NoticeException;

@Controller
public class lbotmController {
	
	@Autowired
	lbotmService lbotmService;
	
	/*
	 * @Autowired lbotmService lbotmService;
	 * 
	 * @RequestMapping("blist.do") public String boastList() { return
	 * "lbotm/lbotmList"; }
	 * 
	 * @RequestMapping("binsert.do") public String boastInsert() { return
	 * "lbotm/lbotmInsert"; }
	 * 
	 * @RequestMapping("bdetail.do") public String boastDetail() { return
	 * "lbotm/lbotmDetail"; }
	 */	
	@RequestMapping("lbotmlist.do")
	public ModelAndView lbotmlist(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = lbotmService.getListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		

		ArrayList<lbotm> list = lbotmService.selectList(pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("lbotm/lbotmList");
		} else {
			throw new NoticeException("게시글 조회에 실패하였습니다.");
		}

		return mv;

	}
	
	@RequestMapping("lbotmdetail.do")
	public ModelAndView lbotmDetail(@RequestParam("bNo") int bNo, @RequestParam("page") int page, ModelAndView mv)
			throws lbotmException {
		lbotmService.addReadCount(bNo);
		lbotm lbotm = lbotmService.selectlbotm(bNo);

		if (lbotm != null) {
			mv.addObject("lbotm", lbotm).addObject("page", page).setViewName("lbotm/lbotmDetail");
		} else {
			throw new NoticeException("게시글 상세보기에 실패하였습니다.");
		}
		return mv;
	}
	
	// 글쓰기 버튼
	@RequestMapping(value = "lbotmWrite.do", method = RequestMethod.GET)
	public String write() {
		return "lbotm/lbotmWrite";	
	}
	
	// 게시글 작성처리
	@RequestMapping(value = "lbotminsert.do")
	public String lbotminsert(@SessionAttribute("loginUser") Member loginUser, @ModelAttribute lbotm l,
			HttpServletRequest request, HttpSession session) {
		l.setB_Nickname(loginUser.getNickName());
		
		int result = lbotmService.lbotminsert(l);
		
		if (result > 0) {
			return "redirect:lbotmlist.do";
		} else {
			throw new lbotmException("게시글 등록에 실패하였습니다.");
		}
	}

}
