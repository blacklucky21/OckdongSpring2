package com.junwo.ockdong.admin.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.junwo.ockdong.member.model.service.MemberService;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.myOwn.model.service.MyOwnService;
import com.junwo.ockdong.myOwn.model.vo.Ingredient;

@Controller
public class AdminController {
	@Autowired
	private MemberService mService;

	@Autowired
	private MyOwnService moService;

	@RequestMapping("adminView.do")
	public String adminView() {

		return "admin/adminMain";
	}

	@RequestMapping("adminPaymentList.do")
	public String adminPaymentList() {

		return "admin/Payment/adminPayment";
	}

	@RequestMapping("productList.do")
	public String productList() {

		return "admin/products/productList";
	}

	// 관리자에서 로고 누를시 처음 화면으로 이동
	@RequestMapping("adminhome.do")
	public String adminHome() {
		return "admin/adminMain";
	}

	// 결제 통합리스트

	@RequestMapping("PayResultList.do")
	public String PayResultList() {

		return "admin/Payment/adminResultList";
	}

	@RequestMapping("adminWarnning.do")
	public String Warnninng() {

		return "admin/Payment/adminWarnningList";
	}

	// 나만의 도시락 관리 페이지
	@RequestMapping("mydo.do")
	public String mydoView() {
		return "admin/mydo/myOwn_lunch";
	}

	// 나만의 도시락 재료관리
	@RequestMapping("myIn.do")
	public ModelAndView myInView(ModelAndView mv) {
		
		ArrayList<Ingredient> inList = moService.selectAll();
		
		if(inList != null) {
			mv.addObject("inList", inList);
			mv.setViewName("admin/mydo/myOwn_Ingredients");
		}else {
			mv.setViewName("admin/adminMain");
		}
		return mv;
	}

	// 나만의 도시락 재료 등록 페이지 이동
	@RequestMapping("IngredientsInsert.do")
	public String IngredientsInsertView() {
		return "admin/mydo/myOwn_Ingredients_Insert";
	}

	// 나만의 도시락 재료 등록
	@RequestMapping("Ingredients_Insert.do")
	public String Ingredients_Insert(@ModelAttribute Ingredient in,
									 @RequestParam("inCategory") String inCategory,
									 @RequestParam("selected4") String selected4,
									 @RequestParam("selected5") String selected5,
									 @RequestParam(value = "ingredientImg", required = false) MultipartFile uploadFile,
									 HttpServletRequest request) {

		System.out.println(in);

		if (inCategory.equals("4찬")) {
			in.setInType(selected4);
			inCategory = inCategory + "\\" + selected4;
		} else {
			in.setInType(selected5);
			inCategory = inCategory + "\\" + selected5;
		}

		if (uploadFile != null && !uploadFile.isEmpty()) {
			// 저장할 경로를 지정하는 saveFile()메소드 생성

			String renameFileName = inSaveFile(uploadFile, request, inCategory);

			if (renameFileName != null) {
				in.setInOriginalFile(uploadFile.getOriginalFilename());
				in.setInRenameFile(renameFileName);
			}
		}

		System.out.println(in);

		int result = moService.insert(in);

		if (result > 0) {
			return "redirect:myIn.do";
		} else {
			return "redirect:IngredientsInsert.do";
		}

	}

	// 저장할 파일의 이름 만들기? + 확장자 명도 추가
	public String inSaveFile(MultipartFile file, HttpServletRequest request, String inCategory) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\img\\myOwn\\" + inCategory;
		File folder = new File(savePath);

		if (!folder.exists()) {// 해당 폴더가 없으면
			folder.mkdirs();// 만들어라
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String originalFile = file.getOriginalFilename();

		String renameFile = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originalFile.substring(originalFile.lastIndexOf(".") + 1);// 마지막은 확장자명 추가

		String renamePath = folder + "\\" + renameFile;

		try {
			file.transferTo(new File(renamePath));// 전달 받은 file이 rename명으로 저장
		} catch (Exception e) {
			e.printStackTrace();
		}

		return renameFile;
	}
	
	// 재료 리스트에서 선택한 재료 삭제하기
	@RequestMapping("ingredientDelete.do")
	@ResponseBody
	public String ingredientDel(int inNo) {
		System.out.println("inNo : " + inNo);
		int result = moService.deleteIn(inNo);
		
		if(result > 0) {
			System.out.println("성공");
			return "success";
		}else {
			System.out.println("실패");
			return "fail";
		}
		
	}
	
	// 재료 리스트에서 검색하기 타입이랑 내용 받아옴
	@RequestMapping("searchIn.do")
	public void searchIngredient(HttpServletResponse response, String sContent, String type) throws JsonIOException, IOException {
		
		Map<String, String> search = new HashMap<String, String>();
		search.put( "sContent", sContent );
		search.put( "type", type );
		
		ArrayList<Ingredient> inList = moService.searchList(search);
		if(inList != null) {
			for(Ingredient i : inList) {
				i.setInName(URLEncoder.encode(i.getInName(), "utf-8"));
				i.setInOriginalFile(URLEncoder.encode(i.getInOriginalFile(), "utf-8"));
				i.setInType(URLEncoder.encode(i.getInType(), "utf-8"));
			}
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(inList, response.getWriter());
		
	}

	// 상품관리 상품등록
	@RequestMapping("productsInsert.do")
	public String productsInert() {
		return "admin/products/productInsert";
	}

	// 상품 문의
	@RequestMapping("productInquiry.do")
	public String productInquiry() {
		return "admin/products/productInquiry";
	}

	// 회원리스트~~
	@RequestMapping("adminMemberList.do")
	public ModelAndView adminMemberList(@RequestParam(value = "page", required = false) ModelAndView mv) {
		mv = new ModelAndView();

		ArrayList<Member> list = mService.SelectMemberList();

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/Member/adminMemberList");

		} else {

		}

		return mv;

	}

	@RequestMapping("adminMemberList2.do")
	public ModelAndView adminMemberList2(@RequestParam(value = "page", required = false) ModelAndView mv,
			@RequestParam("searchInput") String searchInput, @RequestParam("searchForm") String searchForm,
			@RequestParam("startDatePicker") String startDatePicker, String endDatePicker) {
		mv = new ModelAndView();
		System.out.println(searchInput);
		System.out.println(searchForm);
		System.out.println(endDatePicker);
		System.out.println(startDatePicker);

		HashMap<String, String> search = new HashMap<String, String>();
		search.put("searchInput", searchInput);
		search.put("searchForm", searchForm);
		search.put("startDatePicker", startDatePicker);
		search.put("endDatePicker", endDatePicker);
		ArrayList<Member> list = mService.SelectMemberList2(search);
//		int listCount = mService.MemberListCount();
//		System.out.println(list);
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/Member/adminMemberList");

		} else {

		}

		return mv;

	}

	// 탈퇴 회원 리스트~~

	@RequestMapping("adminSecessionList.do")
	public ModelAndView adminSecession(@RequestParam(value = "page", required = false) ModelAndView mv,
			@RequestParam("searchInput") String searchInput, @RequestParam("searchForm") String searchForm,
			@RequestParam("startDatePicker") String startDatePicker, String endDatePicker) {
		mv = new ModelAndView();
		System.out.println(searchInput);
		System.out.println(searchForm);
		System.out.println(endDatePicker);
		System.out.println(startDatePicker);

		HashMap<String, String> search = new HashMap<String, String>();
		search.put("searchInput", searchInput);
		search.put("searchForm", searchForm);
		search.put("startDatePicker", startDatePicker);
		search.put("endDatePicker", endDatePicker);
		ArrayList<Member> list = mService.SelectMemberList2(search);
//		int listCount = mService.MemberListCount();
//		System.out.println(list);
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/Member/adminMemberSecession");

		} else {

		}

		return mv;
	}

}
