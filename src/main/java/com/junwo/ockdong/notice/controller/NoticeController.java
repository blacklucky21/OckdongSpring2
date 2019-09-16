package com.junwo.ockdong.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.common.SearchCondition;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.notice.model.exception.NoticeException;
import com.junwo.ockdong.notice.model.service.NoticeService;
import com.junwo.ockdong.notice.model.vo.Comments;
import com.junwo.ockdong.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService nService;
	
	// 리스트 불러오기
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
	
	
	// 글쓰기 버튼
	@RequestMapping(value="boardWrite.do", method=RequestMethod.GET)
	public String write() {
		return "board/boardWrite";
	}
	
	//게시글 작성처리
	@RequestMapping(value="insert.do")
	public String insert(@SessionAttribute("loginUser") Member loginUser,
			@ModelAttribute Notice n, HttpServletRequest request) {
		n.setNickName(loginUser.getNickName());
		int result = nService.insertNoitce(n);
		
		if(result > 0) {
			return "redirect:nlist.do";
		} else {
			throw new NoticeException("공지사항 등록에 실패하였습니다.");
		}
	}
	
	// 게시글 삭제
	@RequestMapping(value="deleteNotice.do")
	public String deleteBoard(@RequestParam("nNo") int nNo) {
		
//		int result = nService.deleteNotice(nNo);
//		
//		if(result > 0) {
//			return "redirect:nlist.do";
//		} else {
//			throw new NoticeException("공지사항 등록에 실패하였습니다.");
//		}
		
		try {
			nService.deleteNotice(nNo);
			
			return "redirect:nlist.do?";
			
		} catch (NoticeException e) {
			return "common/errorPage";
		}

	}
	
	//게시물 update 페이지
	@RequestMapping("updateNoticePage.do")
	public ModelAndView updateBoardPage(@RequestParam("nNo") int nNo,
										@RequestParam("page") int page,
										ModelAndView mv) {
		Notice notice = nService.selectNotice(nNo);
		
		mv.addObject("notice", notice).addObject("page", page).setViewName("notice/noticeUpdate");
		
		return mv;
	}
	

	// 게시물 수정 페이지
	@RequestMapping("updateNotice.do")
	public ModelAndView updateNotice(ModelAndView mv, @ModelAttribute Notice n,
			@RequestParam("page") Integer page) {

		int result = nService.updateNotice(n);

		if (result > 0) {
			mv.addObject("page", page).setViewName("redirect:ndetail.do?nNo=" + n.getnNo());
		} else {
			throw new NoticeException("게시글 등록을 실패하였습니다.");
		}

		return mv;
	}
	
	// 게시판 검색
	@RequestMapping("searchBoard.do")
	public ModelAndView searchBoard(String searchType, String search, PageInfo pi,
								ModelAndView mv	) throws NoticeException {
		SearchCondition sc = new SearchCondition();
		List<HashMap<String, Object>> list;	
		
		if(searchType.equals("title")) {
			sc.setTitle(search);
		} 
		if(searchType.equals("content")) {
			sc.setContent(search);
		}
		if(searchType.equals("writer")) {
			sc.setWriter(search);
		}
		
		int currentPage = 1;
		
		if(pi.getCurrentPage() > 0) {
			currentPage = pi.getCurrentPage();
		}
		
		// 게시글 검색 개수
		int listCount = nService.searchBoardCount(sc);
		
		PageInfo info = Pagination.getPageInfo(currentPage, listCount);
		
		list = nService.searchList(info, sc);
		
		mv.setViewName("notice/noticeList");
		mv.addObject("list", list);
		mv.addObject("pi", info);
		mv.addObject("search", search);
		
		
		return mv;
		
	}
	
	@RequestMapping("insertComment.do")
	public String insertComment(@SessionAttribute("loginUser") Member m, Comments c, Model model) {
		c.setMem
	}

}
