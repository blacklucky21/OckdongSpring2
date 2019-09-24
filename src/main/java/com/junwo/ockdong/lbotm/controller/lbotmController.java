package com.junwo.ockdong.lbotm.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.lbotm.model.exception.lbotmException;
import com.junwo.ockdong.lbotm.model.service.lbotmService;
import com.junwo.ockdong.lbotm.model.vo.lbotm;
import com.junwo.ockdong.lbotm.model.vo.lbotmComments;
import com.junwo.ockdong.member.model.vo.Member;

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
			throw new lbotmException("게시글 조회에 실패하였습니다.");
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
			throw new lbotmException("게시글 상세보기에 실패하였습니다.");
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
	
	@RequestMapping("lbotmTop.do")
	public void boardTopList(HttpServletResponse response) throws IOException {

		ArrayList<lbotm> list = lbotmService.lbotmTop();
		
		for(lbotm l : list) {
			l.setB_Title(URLEncoder.encode(l.getB_Title(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	// 좋아요 등록/삭제
//	@RequestMapping("like.do")
//	public String like(@SessionAttribute("loginUser") Member m, int bNo, HttpSession session) {
//		boardMarking bm = new boardMarking();
//		int likeCount = lbotmService.selectLike(bNo);
//		m = (Member)session.getAttribute("loginUser");
//		
//		bm.setBoard_no(bNo);
//		bm.setUserId(m.getUserId());
//		
//		
//		int check = -99;
//		
//		check = lbotmService.checkLike(bm);
//		
//		if(check == 0) {
//			int insert = lbotmService.insertLike(bm);
//		}else {
//			int delete = lbotmService.deleteLike(bm);
//		}
//	
//		return "redirect:view.do?board_no=" + board_no;
//	}
	
	/* ####### 댓글 가져오기 ####### */
	@RequestMapping("lbotmcommentList.do")
	public void lbotmgetCommentList(HttpServletResponse response, int bNo) throws Exception {
		ArrayList<lbotmComments> lList = lbotmService.lbotmselectCommentList(bNo);
		for(lbotmComments r : lList) {
			r.setLbotm_Content(URLEncoder.encode(r.getLbotm_Content(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(lList, response.getWriter());
	}
	
	/* 댓글 등록 */
	@RequestMapping("lbotminsertComment.do")
	@ResponseBody
	public String lbotminsertComment(HttpSession session, lbotmComments lc) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
	
		String userId = loginUser.getUserId();
		
		lc.setUserId(userId);
		System.out.println("sexss" + lc);
		int result = lbotmService.lbotminsertComment(lc);
		
		if(result > 0) {
			return "success";
		} else {
			throw new lbotmException("댓글 등록에 실패하였습니다.");
		}
	}
	
	// 댓글 delete
	@RequestMapping("lbotmdeleteComment.do")
	@ResponseBody
	public String lbotmdeleteComment(int cNo) {
		
		/* System.out.println("삭제:"+cNo); */
		int result = lbotmService.lbotmdeleteComment(cNo);
		System.out.println(result);
		
		if(result > 0) {
			return "success";
		} else {
			throw new lbotmException("댓글 등록에 실패하였습니다.");
		}
	}
	
	//댓글 수정
	@RequestMapping("lbotmModifyCommnet.do")
	@ResponseBody
	public String lbotmModifyCommnet(String Content,int cNo) {
		
		lbotmComments lc = new lbotmComments();
		lc.setLbotm_No(cNo);
		lc.setLbotm_Content(Content);
		
		int updateComent = lbotmService.lbotmupdateComment(lc);
		/* System.out.println(nc); */
		
		if(updateComent>0) {
		return "sucess";
		}else {
			throw new lbotmException("댓글 등록에 실패하였습니다.");
		}
		
	}
}
