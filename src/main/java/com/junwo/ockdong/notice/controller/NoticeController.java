package com.junwo.ockdong.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.notice.model.exception.NoticeException;
import com.junwo.ockdong.notice.model.service.NoticeService;
import com.junwo.ockdong.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService nService;
	
	@RequestMapping("nlist.do")
	public ModelAndView noticelist(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null	) {
			currentPage = page;
		}
		
		int listCount = nService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);	
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);	
			mv.addObject("pi", pi);
			mv.setViewName("notice/noticeList");
		} else {
			throw new NoticeException("게시글 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	// 게시판 상세보기 
	@RequestMapping("ndetail.do")
	public ModelAndView boardDetail(@RequestParam("nNo") int nNo, @RequestParam("page") int page, ModelAndView mv) throws NoticeException {
		nService.addReadCount(nNo);
		Notice notice = nService.selectNotice(nNo);
		
		if(notice != null) {
			mv.addObject("notice", notice).addObject("page", page).setViewName("notice/noticeDetail");
		} else {
			throw new NoticeException("게시글 상세보기에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping(value="boardWrite.do", method=RequestMethod.GET)
	public String write() {
		return "board/boardWrite";
	}

}
