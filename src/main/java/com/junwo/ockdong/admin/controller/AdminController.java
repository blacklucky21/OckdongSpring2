package com.junwo.ockdong.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Spliterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//github.com/blacklucky21/OckdongSpring2.git
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.junwo.ockdong.cart.model.service.CartService;
import com.junwo.ockdong.cart.model.vo.Payment;
import com.junwo.ockdong.member.model.service.MemberService;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.myOwn.model.service.MyOwnService;
import com.junwo.ockdong.myOwn.model.vo.Ingredient;
import com.junwo.ockdong.myOwn.model.vo.MBLRecipe;
import com.junwo.ockdong.product.model.service.ProductService;
import com.junwo.ockdong.product.model.vo.Product;

@Controller
public class AdminController {
	@Autowired
	private MemberService mService;

	@Autowired
	private MyOwnService moService;

	@Autowired
	private ProductService pService;
	
	@Autowired
	private CartService cService;

	@RequestMapping("adminView.do")
	public String adminView() {

		return "admin/adminMain";
	}

	@RequestMapping("adminPaymentList.do")
	public ModelAndView adminPaymentList(ModelAndView mv) {

		ArrayList<Payment> list = cService.PayList();
		
		if (list != null) {
			mv.addObject("list", list);

			mv.setViewName("admin/Payment/adminPayment");
		}
		
		return mv;
	}
	//배송리스트
	@RequestMapping("adminPaymentList2.do")
	public ModelAndView adminPaymentList2(ModelAndView mv,
			@RequestParam("searchInput") String searchInput, @RequestParam("searchForm") String searchForm,
			@RequestParam("startDatePicker") String startDatePicker, String endDatePicker,
			@RequestParam(value="check",required=false)String check) {
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
		
		if(check!=null) {
		String checkBox[] = check.split(",");
		
		
		
		System.out.println("check"+check);
		
		for(int i=0;i<checkBox.length;i++) {
			
			switch(checkBox[i]) {
			
			case "ready" : search.put("ready",checkBox[i]);System.out.println(checkBox[i]);break;
			case "ing"   : search.put("ing",checkBox[i]);System.out.println(checkBox[i]);break;
			case "end" 	 : search.put("end",checkBox[i]);break;
			case "buyend": search.put("buyend",checkBox[i]);break;
			}
		}
		}
		ArrayList<Payment> list = cService.selectPayList(search);
		// int listCount = mService.MemberListCount();

//		System.out.println(list);
		if (list != null) {
			mv.addObject("list", list);

			mv.setViewName("admin/Payment/adminPayment");

		} else {

		}

		return mv;

	}

	// 상품 리스트 ~~
	@RequestMapping("productList.do")
	public ModelAndView productList(@RequestParam(value = "page", required = false) ModelAndView mv) {
		mv = new ModelAndView();

		ArrayList<Product> list = pService.selectList();
		ArrayList<Product> list2 = pService.selectList1();

		System.out.println(list2.size());

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("list2", list2);

			mv.setViewName("admin/products/productList");
		}

		return mv;
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

	// 메인 화면 로고 누르면 메인 화면으로 이동한다.
	@RequestMapping("main.do")
	public ModelAndView main(ModelAndView mv) {
		mv = new ModelAndView();

		System.out.println("1");
		ArrayList pList = pService.selectList8(1); // 판매중인 상품만 가지고 오기
		ArrayList pList2 = pService.selectList8do(); // 도시락 8개
		ArrayList pList3 = pService.selectList8sal(); // 샐러드 8개
		mv.addObject("pList", pList);
		mv.addObject("pList2", pList2);
		mv.addObject("pList3", pList3);

		mv.setViewName("Main");

		return mv;
	}

	// 나만의 도시락 관리 페이지
	@RequestMapping("mydo.do")
	public String mydo() {
		return "admin/mydo/myOwn_lunch";
	}

	// 나만의 도시락 재료관리
	@RequestMapping("myIn.do")
	public ModelAndView myInView(ModelAndView mv) {

		ArrayList<Ingredient> inList = moService.selectAll();

		if (inList != null) {
			mv.addObject("inList", inList);
			mv.setViewName("admin/mydo/myOwn_Ingredients");
		} else {
			mv.setViewName("admin/adminMain");
		}
		return mv;
	}

	// 나만의 도시락 재료 디테일
	@RequestMapping("myInDetail.do")
	public ModelAndView myInDetail(ModelAndView mv, @RequestParam("inNo") int inNo) {
		System.out.println("inNo : " + inNo);
		Ingredient ingredient = moService.selectOne(inNo);

		if (ingredient != null) {
			mv.addObject("ingredient", ingredient);
			mv.setViewName("admin/mydo/myOwn_Ingredients_detail");
		} else {
			mv.setViewName("admin/adminMain");
		}

		return mv;
	}

	// 나만의 도시락 재료 등록
	@RequestMapping("IngredientsInsert.do")
	public String IngredientsInsert() {
		return "admin/mydo/myOwn_Ingredients_Insert";
	}

	// 나만의 도시락 재료 등록
	@RequestMapping("Ingredients_Insert.do")
	public String Ingredients_Insert(@ModelAttribute Ingredient in, @RequestParam("inCategory") String inCategory,
			@RequestParam("selected4") String selected4, @RequestParam("selected5") String selected5,
			@RequestParam(value = "ingredientImg", required = false) MultipartFile uploadFile,
			HttpServletRequest request) {
		System.out.println("Ingredients_Insert.do안에 들어옴");
		System.out.println("sysout In" + in);

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
		
		System.out.println("result 끝남");
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

	// 수정하기
	@RequestMapping("Ingredients_Update.do")
	public String ingredientUpdate(@ModelAttribute Ingredient in, @RequestParam("inCategory") String inCategory,
			@RequestParam("selected4") String selected4, @RequestParam("selected5") String selected5,
			@RequestParam(value = "ingredientImg", required = false) MultipartFile uploadFile,
			@RequestParam("nOldCateAndType") String nOldCateAndType, HttpServletRequest request) {

		System.out.println(in);
		System.out.println(uploadFile);

		if (inCategory.equals("4찬")) {
			in.setInType(selected4);
			inCategory = inCategory + "\\" + selected4;
		} else {
			in.setInType(selected5);
			inCategory = inCategory + "\\" + selected5;
		}

		if (uploadFile != null && !uploadFile.isEmpty()) {
			// 저장할 경로를 지정하는 saveFile()메소드 생성
			System.out.println(uploadFile);

			String renameFileName = inUpdateFile(uploadFile, request, inCategory, nOldCateAndType, in);

			if (renameFileName != null) {
				in.setInOriginalFile(uploadFile.getOriginalFilename());
				in.setInRenameFile(renameFileName);
			}
		} else {
			System.out.println("uploadFile 비어있음");
		}

		System.out.println("moService들어가기 전" + in);

		int result = moService.update(in);

		if (result > 0) {
			return "redirect:myIn.do";
		} else {
			return "redirect:IngredientsInsert.do";
		}
	}

	// 이미지 파일 삭제하고 업데이트 하기
	public String inUpdateFile(MultipartFile file, HttpServletRequest request, String inCategory,
			String nOldCateAndType, Ingredient in) {
		System.out.println("이미지 업데이트로 들어옴");
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

		// 삭제를 위한 방법
		System.out.println(nOldCateAndType);
		String removePath = root + "\\img\\myOwn\\" + nOldCateAndType;
		System.out.println(removePath);
		File removeFolder = new File(removePath);
		String removeFilePath = removeFolder + "\\" + in.getInRenameFile();

		System.out.println("try문 들어가기 전");

		try {
			File removeFile = new File(removeFilePath);
			if (removeFile.exists()) {
				if (removeFile.delete()) {
					System.out.println("기존 파일 삭제 성공");
				} else {
					System.out.println("기존 파일 삭제 실패");
				}
			} else {
				System.out.println("없는 파일");
			}
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

		if (result > 0) {
			System.out.println("성공");
			return "success";
		} else {
			System.out.println("실패");
			return "fail";
		}
	}

	// 재료 리스트에서 검색하기 타입이랑 내용 받아옴
	@RequestMapping("searchIn.do")
	public void searchIngredient(HttpServletResponse response, String sContent, String type)
			throws JsonIOException, IOException {

		Map<String, String> search = new HashMap<String, String>();
		search.put("sContent", sContent);
		search.put("type", type);

		ArrayList<Ingredient> inList = moService.searchList(search);
		if (inList != null) {
			for (Ingredient i : inList) {
				i.setInName(URLEncoder.encode(i.getInName(), "utf-8"));
				i.setInOriginalFile(URLEncoder.encode(i.getInOriginalFile(), "utf-8"));
				i.setInType(URLEncoder.encode(i.getInType(), "utf-8"));
			}
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(inList, response.getWriter());

	}

	@RequestMapping("recipeDetail.do")
	public ModelAndView recipeDetail(ModelAndView mv, @RequestParam("mblId") String mblId) {

		System.out.println(mblId);

		MBLRecipe mblR = moService.searchRecipeOne(mblId);

		System.out.println(mblR);

		String[] list = mblR.getNumbers().split("/");

		Ingredient in = null;

		Ingredient rice = null;
		Ingredient sub1 = null;
		Ingredient sub2 = null;
		Ingredient soup = null;
		Ingredient main = null;

		for (int i = 0; i < list.length; i++) {
			in = moService.selectOne(Integer.parseInt(list[i]));

			switch (in.getInType()) {
			case "1_밥":
			case "5_밥":
				rice = in;
				break;
			case "2_서브1":
			case "7_서브1":
				sub1 = in;
				break;
			case "3_서브2":
			case "8_서브2":
				sub2 = in;
				break;
			case "4_메인":
			case "6_메인":
				main = in;
				break;
			case "9_수프":
				soup = in;
				break;

			}

		}

		mv.addObject("rice", rice);
		mv.addObject("sub1", sub1);
		mv.addObject("sub2", sub2);
		mv.addObject("main", main);
		mv.addObject("soup", soup);
		mv.addObject("mbl", mblR);
		mv.setViewName("admin/mydo/myOwn_RecipeOne");
		return mv;
	}

	@RequestMapping("recipeDelete.do")
	@ResponseBody
	public String recipeDelete(int mblId) {
		System.out.println("mblId : " + mblId);
		int result = moService.deleteMblRecipe(mblId);

		if (result > 0) {
			System.out.println("성공");
			return "success";
		} else {
			System.out.println("실패");
			return "fail";
		}
	}
	@RequestMapping("myOwnRecipeDel.do")
	public String myOwnRecipeDel(@RequestParam("mblId") int mblId) throws Exception {
		
		int result = moService.deleteMblRecipe(mblId);
		
		if(result > 0) {
			return "redirect:allRecipe.do";
		}else {
			throw new Exception("레시피 삭제 중에 에러발생");
		}
	}

	@RequestMapping("searchRecipe.do")
	public void searchRecipe(HttpServletResponse response, String sContent, String type)
			throws JsonIOException, IOException{
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("sContent", sContent);
		search.put("type", type);

		ArrayList<MBLRecipe> rList = moService.searchRecipeList(search);
		if (rList != null) {
			for (MBLRecipe r : rList) {
				r.setMblTitle(URLEncoder.encode(r.getMblTitle(), "utf-8"));
				r.setMblFileName(URLEncoder.encode(r.getMblFileName(), "utf-8"));
				r.setMblType(URLEncoder.encode(r.getMblType(), "utf-8"));
			}
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
	}
	
	@RequestMapping("myRecipeDetail.do")
	public ModelAndView myRecipeDetail(ModelAndView mv, @RequestParam("mblId") int mblId) {
		System.out.println("mblId : " + mblId);
		MBLRecipe mblR = moService.myRecipeDetail(mblId);
		
		String[] list = mblR.getNumbers().split("/");
		for(int i=0; i<list.length; i++) {
			System.out.println("list[" + i + "] : " + list[i]);
		}
		System.out.println(list.length);
		Ingredient in = null;
		
		Ingredient rice = null;
		Ingredient sub1 = null;
		Ingredient sub2 = null;
		Ingredient soup = null;
		Ingredient main = null;

		for (int i = 0; i < list.length; i++) {
			in = moService.selectOne(Integer.parseInt(list[i]));
			System.out.println(in);
			switch (in.getInType()) {
			case "1_밥":
			case "5_밥":
				rice = in;
				break;
			case "2_서브1":
			case "7_서브1":
				sub1 = in;
				break;
			case "3_서브2":
			case "8_서브2":
				sub2 = in;
				break;
			case "4_메인":
			case "6_메인":
				main = in;
				break;
			case "9_수프":
				soup = in;
				break;

			}

		}

		mv.addObject("rice", rice);
		mv.addObject("sub1", sub1);
		mv.addObject("sub2", sub2);
		mv.addObject("main", main);
		mv.addObject("soup", soup);
		mv.addObject("mbl", mblR);
		mv.setViewName("admin/mydo/myOwn_Recipe_detail");
		return mv;
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
		// int listCount = mService.MemberListCount();

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
		ArrayList<Member> list = mService.SelectSecessionMemberList(search);
//		int listCount = mService.MemberListCount();
//		System.out.println(list);
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/Member/adminMemberSecession");

		} else {

		}

		return mv;
	}

	@RequestMapping("adminSecession2.do")
	public ModelAndView adminScessionMemberFirst(@RequestParam(value = "page", required = false) ModelAndView mv) {
		mv = new ModelAndView();

		ArrayList<Member> list = mService.SelectSecessionListFirst();

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/Member/adminMemberSecession");

		} else {

		}

		return mv;

	}

	// 회원 블랙 하기
	@RequestMapping("deleteAdminMem.del")
	public String deleteAdminMem(String MemId) {

		mService.deleteAdminMember(MemId);

		return "redirect:/adminMemberList.do";
	}

	// 블랙리스트 해제 하기
	@RequestMapping("blackListMemberCancel.cancel")
	public String BlackListCancel(String MemId) {

		mService.BlackListCancel(MemId);

		return "redirect:/adminBlack.do";
	}

	// 블래리스트
	@RequestMapping("adminBlack.do")
	public ModelAndView BlackMemberList(@RequestParam(value = "page", required = false) ModelAndView mv) {
		mv = new ModelAndView();

		ArrayList<Member> list = mService.BlackListMember();
		System.out.println(list);
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/Member/adminBlackList");

		} else {

		}

		return mv;

	}

	@RequestMapping("adminBlackListSearch.search")
	public ModelAndView BlackListSearch(@RequestParam(value = "page", required = false) ModelAndView mv,
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
		ArrayList<Member> list = mService.BlackListSearch(search);
//		int listCount = mService.MemberListCount();
//		System.out.println(list);
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/Member/adminBlackList");
		} else {
		}

		return mv;
	}
	
	@RequestMapping("inputPid.do")
	public void inputPid(String id,String check) {
		
		HashMap<String, String> ppcheck = new HashMap<String, String>();
		
		ppcheck.put("id", id);
		ppcheck.put("check", check);
		System.out.println("cc"+id);
		System.out.println("dd"+check);
		int gg = cService.updateStatus(ppcheck);
		
		//return "redirect:adminPaymentList.do";
		
	}

}
