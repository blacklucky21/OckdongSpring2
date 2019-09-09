package com.junwo.ockdong.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.common.PaginationComment;
import com.junwo.ockdong.common.boardMarking;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.notice.model.exception.NoticeException;
import com.junwo.ockdong.notice.model.service.NoticeService;
import com.junwo.ockdong.notice.model.vo.Notice;
import com.junwo.ockdong.notice.model.vo.PageInfo;

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
	
//	//게시글 상세보기(댓글 포함), 조회수 증가 처리
//		@RequestMapping(value="view.do")
//		public ModelAndView view(int board_no, HttpSession session, PageInfo pi, Member member) {
//			ModelAndView mv = new ModelAndView();
//			//게시글 상세보기(제목, 내용, 작성자, 날짜, 댓글수, 조회수) 
//			HashMap<String, Object> detail;
//			//댓글 조회(작성자, 내용, 날짜)
//			List<HashMap<String, Object>> commentList;
//			
//			try {
//				//조회수 증가처리
//				/*boardService.increaseViewCnt(board_no, session);*/
//				
//				//좋아요 수
//				int likeCount = NoticeService.selectLike(board_no);
//				
//				//댓글 페이징
//				int currentPage = 1;
//				
//				if(pi.getCurrentPage() > 0) {
//					currentPage = pi.getCurrentPage();
//				}
//				
//				int listCount = NoticeService.commentListCount(board_no);
//				
//				PageInfo info = PaginationComment.getPageInfo(currentPage, listCount);
//				
//				Member m = (Member) session.getAttribute("loginUser");
//				
//				if(m != null) {
//					boardMarking bm = new boardMarking();
//					bm.setBoard_no(board_no);
//					bm.setMember_no(m.getUserId());
//					
//					int check1 = - 99;
//					int check2 = - 99;
//					
//					check1 = boardService.checkBookMark(bm);
//					check2 = boardService.checkLike(bm);
//					
//					mv.addObject("check1", check1);
//					mv.addObject("check2", check2);
//					
//				}
//				
//				//상세보기 board_no값 넘겨줌
//				detail = boardService.detail(board_no);
//				commentList = boardService.commentList(board_no, info);
//				
//				//뷰 이름
//				mv.setViewName("board/boardPage");
//				//뷰에 전달할 데이터
//				mv.addObject("detail", detail);
//				mv.addObject("commentList", commentList);
//				mv.addObject("likeCount", likeCount);
//				mv.addObject("listCount", listCount);
//				mv.addObject("pi", info);
//				//mv.addObject("file", file);
//				
//				return mv;
//				
//			} catch (BoardException e) {
//				mv.setViewName("board/boardPage");
//				mv.addObject("errorMessgae", "상세보기 조회 실패");
//				
//				return mv;
//			}

}
