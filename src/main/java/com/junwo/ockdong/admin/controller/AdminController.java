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
//github.com/blacklucky21/OckdongSpring2.git
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.junwo.ockdong.Product.Exception.ProductException;
import com.junwo.ockdong.Product.model.service.ProductService;
import com.junwo.ockdong.Product.model.vo.Product;
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
	
	
	@Autowired
	private ProductService pService;

	
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
	
	//결제 통합리스트
	
	@RequestMapping("PayResultList.do")
	public String PayResultList() {
		
		return"admin/Payment/adminResultList";
	}
	
	@RequestMapping("adminWarnning.do")
	public String Warnninng() {
		
		return"admin/Payment/adminWarnningList";
	}
	
	// 메인 화면 로고 누르면 메인 화면으로 이동한다.
	@RequestMapping("main.do")
	public String main() {
		return "Main";
	}
	
	// 나만의 도시락 관리 페이지
	@RequestMapping("mydo.do")
	public String mydo() {
		return "admin/mydo/myOwn_lunch";
	}
	
	// 나만의 도시락 재료관리
	@RequestMapping("myIn")
	public String myIn() {
		return "admin/mydo/myOwn_Ingredients";
	}
	
	// 나만의 도시락 재료 등록
	@RequestMapping("IngredientsInsert.do")
	public String IngredientsInsert() {
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
		String savePath = root  + inCategory;
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
	public ModelAndView adminMemberList(@RequestParam(value="page",required=false)ModelAndView mv)  {	
		mv = new ModelAndView(); 
	
		
		ArrayList<Member> list = mService.SelectMemberList();
		
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/Member/adminMemberList");
			 	
		}else {
			
		
			
		}
		
		return mv;
		
		
	}
	
	
	
	@RequestMapping("adminMemberList2.do")
	public ModelAndView adminMemberList2(@RequestParam(value="page",required=false)ModelAndView mv,@RequestParam("searchInput")String searchInput
			,@RequestParam("searchForm")String searchForm,@RequestParam("startDatePicker")String startDatePicker,String endDatePicker)  {	
		mv = new ModelAndView(); 
		System.out.println(searchInput);
		System.out.println(searchForm);
		System.out.println(endDatePicker);
		System.out.println(startDatePicker);
		
		
		HashMap<String,String> search = new HashMap<String,String>();
		search.put("searchInput",searchInput);
		search.put("searchForm",searchForm);
		search.put("startDatePicker",startDatePicker);
		search.put("endDatePicker",endDatePicker);
		ArrayList<Member> list = mService.SelectMemberList2(search);
		//int listCount = mService.MemberListCount();
	
//		System.out.println(list);
		if(list !=null) {
			mv.addObject("list",list);
			
			mv.setViewName("admin/Member/adminMemberList");
			 	
		}else {
			
		
			
		}
		
		return mv;
		
		
	}
	
	//탈퇴 회원 리스트~~
	

	@RequestMapping("adminSecessionList.do")
	public ModelAndView adminSecession(@RequestParam(value="page",required=false)ModelAndView mv,@RequestParam("searchInput")String searchInput
			,@RequestParam("searchForm")String searchForm,@RequestParam("startDatePicker")String startDatePicker,String endDatePicker)  {	
		mv = new ModelAndView(); 
		System.out.println(searchInput);
		System.out.println(searchForm);
		System.out.println(endDatePicker);
		System.out.println(startDatePicker);
		
		
		HashMap<String,String> search = new HashMap<String,String>();
		search.put("searchInput",searchInput);
		search.put("searchForm",searchForm);
		search.put("startDatePicker",startDatePicker);
		search.put("endDatePicker",endDatePicker);
		ArrayList<Member> list = mService.SelectSecessionMemberList(search);
//		int listCount = mService.MemberListCount();
//		System.out.println(list);
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/Member/adminMemberSecession");
			 	
		}else {
			
		
			
		}
		
		return mv;
	}
	
// ============================================================================================================================
	// 상품 관리 관리자 상품 등록하기
	@RequestMapping("insertProduct.do")
	public String insertProduct(@ModelAttribute Product p,
									  @RequestParam(value="thumbnailImg1" , required=true) MultipartFile thumbnailImg1 ,
									  @RequestParam(value="thumbnailImg2" , required=false) MultipartFile thumbnailImg2 ,
									  @RequestParam(value="thumbnailImg3" , required=false) MultipartFile thumbnailImg3 ,
									  @RequestParam(value="thumbnailImg4" , required=false) MultipartFile thumbnailImg4 ,
									  @RequestParam("p_lunchtype") String p_lunchtype,
									  HttpServletRequest request) throws ProductException {
		
		// 값 확인을 위해서 가지고 온다.
		System.out.println(p);
		System.out.println(thumbnailImg1);
		System.out.println(thumbnailImg2);
		System.out.println(thumbnailImg3);
		System.out.println(thumbnailImg4);
		
		System.out.println(thumbnailImg1.getOriginalFilename());
		System.out.println(thumbnailImg2.getOriginalFilename());
		System.out.println(thumbnailImg3.getOriginalFilename());
		System.out.println(thumbnailImg4.getOriginalFilename());
		
		ArrayList<MultipartFile> list = new ArrayList<MultipartFile>();
		list.add(thumbnailImg1);
		list.add(thumbnailImg2);
		list.add(thumbnailImg3);
		list.add(thumbnailImg4);
		
		saveproduct(list, request); // 리스트에 잇는 사진 이름 변경후 받아온다.
		
		// 사진 불러오기
		
		int result = pService.insertProduct(p, list);
		
		if(result > 0) {
			return "admin/products/productList";	
		}else {
			throw new ProductException("상품 등록에 실패했습니다.");
		}
		
		
		
	}
	
		// 사진 원래 사진 이름 변경하는 메소드
	  public ArrayList<String> saveproduct(ArrayList<MultipartFile> list, HttpServletRequest request) {

		  ArrayList<String> renamePaths = new ArrayList<String>();
		  
		  for(int i = 0; i < list.size(); i++) {
			  
			  MultipartFile file = list.get(i);
			  
			  String root = request.getSession().getServletContext().getRealPath("resources"); // 경로를 찾다.
			  String savePath = root + "\\img\\products"; // 경로에 이름으로 저장한다.
			  
			  // 파일 없으면 파일 만들고
			  File folder = new File(savePath);
			  if(!folder.exists()) {
				  folder.mkdir();
			  }
			  
			  // 날짜 변경
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			  
			  String originalFileName = file.getOriginalFilename();
			  String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + '.' +
					  							originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			  
			  String renamePath = folder + "\\" + renameFileName; // 경로에 변경된 이름 저장한다.
			  
			  renamePaths.add(renamePath);
			  
			  try {
				  file.transferTo(new File(renamePath));
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
		  }
		  
		  return renamePaths;
		  
	  }
	
	
	
// ============================================================================================================================
	
	@RequestMapping("adminSecession2.do")
public ModelAndView adminScessionMemberFirst(@RequestParam(value="page",required=false)ModelAndView mv)  {	
	mv = new ModelAndView(); 

	
	ArrayList<Member> list = mService.SelectSecessionListFirst();
	
	if(list !=null) {
		mv.addObject("list",list);
		mv.setViewName("admin/Member/adminMemberSecession");
		 	
	}else {
		
	
		
	}
	
	return mv;
	
	
}
	//회원 블랙 하기
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
	
	
	//블래리스트
	@RequestMapping("adminBlack.do")
	public ModelAndView BlackMemberList(@RequestParam(value="page",required=false)ModelAndView mv)  {	
		mv = new ModelAndView(); 

		
		ArrayList<Member> list = mService.BlackListMember();
		System.out.println(list);
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/Member/adminBlackList");
			 	
		}else {
			
		
			
		}
		
		return mv;
		
		
	}
	
	@RequestMapping("adminBlackListSearch.search")
	public ModelAndView BlackListSearch(@RequestParam(value="page",required=false)ModelAndView mv,@RequestParam("searchInput")String searchInput
			,@RequestParam("searchForm")String searchForm,@RequestParam("startDatePicker")String startDatePicker,String endDatePicker)  {	
		mv = new ModelAndView(); 
		System.out.println(searchInput);
		System.out.println(searchForm);
		System.out.println(endDatePicker);
		System.out.println(startDatePicker);
		
		
		HashMap<String,String> search = new HashMap<String,String>();
		search.put("searchInput",searchInput);
		search.put("searchForm",searchForm);
		search.put("startDatePicker",startDatePicker);
		search.put("endDatePicker",endDatePicker);
		ArrayList<Member> list = mService.BlackListSearch(search);
//		int listCount = mService.MemberListCount();
//		System.out.println(list);
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/Member/adminBlackList");
			 	
		}else {
			
		
			
		}
		
		return mv;
	}



}


