package com.junwo.ockdong.lbotm.controller;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	public ModelAndView lbotmDetail(@RequestParam("bNo") int bNo, @RequestParam("page") int page, ModelAndView mv, HttpSession session)
			throws lbotmException {
		lbotmService.addReadCount(bNo);
		lbotm lbotm = lbotmService.selectlbotm(bNo);
		Member loginUser = (Member)session.getAttribute("loginUser");

		if (lbotm != null) {
			mv.addObject("loginUser", loginUser);
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
		
		String text = l.getB_Content();
        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
        Matcher matcher = pattern.matcher(text);
  
        while(matcher.find()){
            System.out.println(matcher.group(1));
            l.setB_Src(matcher.group(1));
            
        }
        int result = lbotmService.lbotminsert(l);

		if (result > 0) {
			return "redirect:lbotmlist.do";
		} else {
			throw new lbotmException("게시글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping(value = "deletelbotm.do")
	public String delectlbotm(@RequestParam("bNo") int bNo) {
		lbotmService.deletelbotm(bNo);
		return "redirect:lbotmlist.do?";
	}
	
	// 게시물 update 페이지
	@RequestMapping("updatelbotmPage.do")
	public ModelAndView updatelbotmPage(@RequestParam("bNo") int bNo, @RequestParam("page") int page, ModelAndView mv) {
		lbotm lbotm = lbotmService.selectlbotm(bNo);

		mv.addObject("lbotm", lbotm).addObject("page", page).setViewName("lbotm/lbotmUpdate");

		return mv;
	}
	
	// 게시물 수정
	@RequestMapping("updatelbotm.do")
	public ModelAndView updatelbotm(ModelAndView mv, @ModelAttribute lbotm l, @RequestParam("page") Integer page) {

		int result = lbotmService.updatelbtom(l);

		if (result > 0) {
			mv.addObject("page", page).setViewName("redirect:lbotmdetail.do?bNo=" + l.getbNo());
		} else {
			throw new lbotmException("게시글 등록을 실패하였습니다.");
		}

		return mv;
	}
	
}
