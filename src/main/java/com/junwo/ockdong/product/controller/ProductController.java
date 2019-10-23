package com.junwo.ockdong.product.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.product.Exception.ProductException;
import com.junwo.ockdong.product.model.service.ProductService;
import com.junwo.ockdong.product.model.vo.PictureList;
import com.junwo.ockdong.product.model.vo.Product;
import com.junwo.ockdong.product.model.vo.ProductAnswer;
import com.junwo.ockdong.product.model.vo.ProductQna;
import com.junwo.ockdong.product.model.vo.Productreview;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

	// 상품 관리 관리자 상품 등록하기
	@RequestMapping("insertProduct.do")
	public String insertProduct(@ModelAttribute Product p,
			@RequestParam(value = "thumbnailImg1") MultipartFile thumbnailImg1,
			@RequestParam(value = "thumbnailImg2", required = false) MultipartFile thumbnailImg2,
			@RequestParam(value = "thumbnailImg3", required = false) MultipartFile thumbnailImg3,
			@RequestParam(value = "thumbnailImg4", required = false) MultipartFile thumbnailImg4,
			HttpServletRequest request) throws ProductException {

		// 값 확인을 위해서 가지고 온다. 등록된 값 확인 한다.
		System.out.println(p); // 입력된 상품 내용 출력
		System.out.println("contgroller 사진 주소 값 : " + thumbnailImg1);
		System.out.println(thumbnailImg2);
		System.out.println(thumbnailImg3);
		System.out.println(thumbnailImg4);
		System.out.println("=================원래 이름=========================");

		ArrayList orign = new ArrayList();
		orign.add(thumbnailImg1.getOriginalFilename());
		orign.add(thumbnailImg2.getOriginalFilename());
		orign.add(thumbnailImg3.getOriginalFilename());
		orign.add(thumbnailImg4.getOriginalFilename());

		int size = 0;
		for (int i = 0; i < orign.size(); i++) {
			if (!orign.get(i).equals("")) {
				size += 1;
			}
		}
		System.out.println("size 크기 : " + size);

		System.out.println(thumbnailImg1.getOriginalFilename()); // 원래 이름 저장한다.
		System.out.println(thumbnailImg2.getOriginalFilename());
		System.out.println(thumbnailImg3.getOriginalFilename());
		System.out.println(thumbnailImg4.getOriginalFilename());
		System.out.println("==========================================");

		// 사진을 list 에 담아서 처리 한다. 추가후
		ArrayList<MultipartFile> list = new ArrayList<MultipartFile>(size);
		list.add(thumbnailImg1); // 메인
		list.add(thumbnailImg2); // 서브들
		list.add(thumbnailImg3);
		list.add(thumbnailImg4);

		PictureList pt; // 사진 객체

		ArrayList<String> renameList = saveproduct(list, request); // 리스트에 잇는 사진 이름 변경후 받아온다.

		ArrayList<PictureList> pList = new ArrayList<PictureList>(); // 사진 담을 객체

		// 출력 결과 이름이 중복으로 됨........ 사진 결과 중복 됨
		for (int i = 0; i < renameList.size(); i++) {
			System.out.println("saveproduct 후  : " + renameList);
		}

		// 메인 이미지 구분
		if (renameList != null) {
			for (int i = 0; i < size; i++) {
				pt = new PictureList();
				pt.setPt_realName(list.get(i).getOriginalFilename());
				pt.setPt_name(renameList.get(i));

				System.out.println("origin 이름 : " + pt.getPt_realName());
				if (i == 0) {
					pt.setPt_type(0);
				} else {
					pt.setPt_type(1);
				}
				pList.add(pt);
			}
		}

		// 출력 결과 이름이 중복으로 됨........ 사진 결과 중복 됨
		for (int i = 0; i < renameList.size(); i++) {
			System.out.println("변경된 이름? 출력 한다.  : " + renameList);
		}

		/*
		 * HashMap<String, Object> map = new HashMap<>(); // 해쉬맵으로 전달한다. 두개를 전달
		 * map.put("p", p); map.put("pList", pList);
		 */

		// DAO 두개로 전달 도전
		int result1 = pService.inProduct(p);
		int result2 = pService.inPicture(pList);

		int result3 = result1 + result2;
		/*
		 * for(int i = 0; i < map.size(); i++) { System.out.println(map.toString()); }
		 */
		// 등록하기
		/* int result = pService.insertProduct(map); */

		if (result3 == 2) {
			return "redirect:productList.do";
		} else {
			return "view/common/errorPage";
		}

	}
// ===========================================================================		

	// 사진 원래 사진 이름 변경하는 메소드
	public ArrayList<String> saveproduct(ArrayList<MultipartFile> list, HttpServletRequest request) {

		ArrayList<String> renamePaths = new ArrayList<String>();

		String root = request.getSession().getServletContext().getRealPath("resources"); // 경로를 찾다.
		String savePath = root + "\\img\\products"; // 경로에 이름으로 저장한다.

		// 파일 없으면 파일 만들고
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}

		// 여기서 한번에 중복된 이름으로 돌리는거 같음....
		for (int i = 0; i < list.size(); i++) {
			MultipartFile file = list.get(i);

			// 날짜 변경
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

			String originalFileName = file.getOriginalFilename();

			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + '.'
					+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

			String renamePath = folder + "\\" + renameFileName; // 경로에 변경된 이름 저장한다.
			// 넘어온 파일을 리스트로 저장
			renamePaths.add(renameFileName);

			System.out.println("이름 변경 된거 확인: " + renamePaths.get(i));
			try {
				file.transferTo(new File(renamePath));

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		System.out.println("==========================================");
		return renamePaths;

	}

//=====================================================================================================
	// 리스트 검색
	@RequestMapping("searchProduct.do")
	@ResponseBody
	public void searchProduct(HttpServletResponse response, String sContent, String type)
			throws JsonIOException, IOException {

		Map<String, String> search = new HashMap<String, String>();
		search.put("sContent", sContent); // 내용 즉 입력값
		search.put("type", type); // 타입 내용 인지 번호 인지

		System.out.println(sContent);
		System.out.println(type);

		ArrayList<Product> pList = pService.searchList(search);

		if (pList != null) {
			for (Product i : pList) {
				i.setP_name(URLEncoder.encode(i.getP_name(), "utf-8")); // 상품명
				i.setP_content(URLEncoder.encode(i.getP_content(), "utf-8")); // 상품설명
				i.setP_lunchtype(URLEncoder.encode(i.getP_lunchtype(), "utf-8")); // 타입

			}
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(pList, response.getWriter());

	}

// ===========================================================================	  
	// 상품 삭제
	@RequestMapping("deletedProduct.do")
	@ResponseBody
	public String deletedProduct(int p_Id) {
		System.out.println("p_Id : " + p_Id);

		int result = pService.deleteProduct(p_Id);

		if (result > 0) {
			System.out.println("삭제 완료");
			return "success";
		}
		return "success";
	}
// ===========================================================================	 		  

	// 상품 상태 변경
	@RequestMapping("updatePsell.do")
	@ResponseBody
	public String updatePsell(int p_Id, String selected) {
		System.out.println("넘어온 값 : " + p_Id);
		System.out.println("컨트롤에서 판매상태 값 : " + selected);
		int result = 0;
		// 상태가 판매 중지 일때
		if (selected.equals("판매중지")) {
			result = pService.updatePsell(p_Id);
		} else {
			// 판매중 일때
			result = pService.updatePsell2(p_Id);
		}
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}

	}

	/*
	 * @RequestMapping("startdo.do") public ModelAndView test(ModelAndView mv) {
	 * 
	 * System.out.println("1"); ArrayList pList = pService.selectList8(1); // 판매중인
	 * 상품만 가지고 오기
	 * System.out.println("===================== 메인 =======================");
	 * mv.addObject("pList", pList); mv.setViewName("Main"); return mv; }
	 * 
	 */
// ===============================================================	
	// 업데이트 폼 상품을 수정 하겠다.
	@RequestMapping("updatePro.do")
	public ModelAndView updatePro(ModelAndView mv, @RequestParam("p_Id") int p_Id) {
		System.out.println("번호 잘넘어 오는지 확인 : " + p_Id);

		Product p = pService.selectListUpdate(p_Id);
		System.out.println("=============================================");
		System.out.println("컨트롤러 상품 정보 : " + p.toString());

		ArrayList<PictureList> pt = pService.selectPt(p_Id);
		for (int i = 0; i < pt.size(); i++) {
			System.out.println("컨트롤러 사진 정보 : " + pt.get(i).toString());
		}

		System.out.println("수정 디테일 갈대 기존 값 : " + p);
		mv.addObject("p", p);
		mv.addObject("pt", pt);
		mv.setViewName("admin/products/productUpdate");
		/*
		 * 1. 뷰로 넘길 값이 Product 객체와 ArrayList이기 때문에 ModelAndView로 View로 넘기기 2. 뷰에 넘어온 값을
		 * 각 input 매칭 시키기 --------------------------업데이트 뷰 완성
		 * 
		 * 1. 뷰에서 controller로 넘어갈 때 (뷰에는 Product / PictureList 두 부분이 나뉘어져 있음) 해당 url을
		 * 처리할 메소드의 매개변수에 @ModelAttribute 사용해서 Product를
		 * 
		 * @RequestParam 이용해서 사진들을 넘겨주기 ==> 상품 등록 할 때에 대한 로직 참고 2. (spring 게시판 수정 부분 참고)
		 * 
		 */
		return mv;
	}
	
	// 메인에서 각각 디테일 폼으로 이동한다.
	@RequestMapping("productDetail.do")
	public ModelAndView detailform(ModelAndView mv, @RequestParam("p_Id") int p_Id) {
		System.out.println("번호 잘넘어 오는지 확인 : " + p_Id);
		
		Product p = pService.selectListUpdate(p_Id);
		System.out.println("=============================================");
		System.out.println("컨트롤러 상품 정보 : " + p.toString());

		ArrayList<PictureList> pt = pService.selectPt(p_Id);
		
		for (int i = 0; i < pt.size(); i++) {
			System.out.println("컨트롤러 사진 정보 : " + pt.get(i).toString());
		}

		mv.addObject("p", p);
		mv.addObject("pt", pt);
		mv.setViewName("admin/products/productDetail");
		return mv;
	}

// =============================================================================================================================================		  
	// 상품 수정 컨트롤러
	@RequestMapping("updatePo.do")
	public String updatepo(@ModelAttribute Product p,
			@RequestParam(value = "thumbnailImg1") MultipartFile thumbnailImg1,
			@RequestParam(value = "thumbnailImg2", required = false) MultipartFile thumbnailImg2,
			@RequestParam(value = "thumbnailImg3", required = false) MultipartFile thumbnailImg3,
			@RequestParam(value = "thumbnailImg4", required = false) MultipartFile thumbnailImg4,
			@RequestParam("title_name") String title_name,
			@RequestParam("title_realname") String title_realname,
			@RequestParam("title_type") int title_type,
			@RequestParam(value = "sub1_name", required = false) String sub1_name,
			@RequestParam(value = "sub1_realname", required = false) String sub1_realname,
			@RequestParam(value = "sub1_type", required = false) Integer sub1_type,
			@RequestParam(value = "sub2_name", required = false) String sub2_name,
			@RequestParam(value = "sub2_realname", required = false) String sub2_realname,
			@RequestParam(value = "sub2_type", required = false) Integer sub2_type,
			@RequestParam(value = "sub3_name", required = false) String sub3_name,
			@RequestParam(value = "sub3_realname", required = false) String sub3_realname,
			@RequestParam(value = "sub3_type", required = false) Integer sub3_type, HttpServletRequest request) {
		
		// 메인은 무조건 있기 때문에 문제 없음
		
		// 메인 수정
		if(!thumbnailImg1.isEmpty()){//사진 바뀜
			System.out.println("thumbnailImg1 수정됨");
			deleteFile(title_name, request);//기존 파일 삭제
			String productImgFileName1 = mkProductImgFile(thumbnailImg1, request);//수정될 이미지 파일 만들기 + 파일명 받아오기
			Map<String, String> picture = new HashMap<String, String>();// DB에 전달할 수정된 파일정보와 이전 파일명
			picture.put("oldName", title_name);
			picture.put("realName", thumbnailImg1.getOriginalFilename());
			picture.put("titleName", productImgFileName1);
			System.out.println("title_name : " + title_name);
			System.out.println("thumbnailImg1.getOriginalFilename() : " + thumbnailImg1.getOriginalFilename());
			System.out.println("productImgFileName : " + productImgFileName1);
			int result = pService.updateMainPicture(picture);// DB값에 저장된 이미지 파일명 변경 수정
			if(result > 0) {System.out.println("수정성공");}else {System.out.println("수정실패");}
		}
		
		//서브 1
		if(!thumbnailImg2.isEmpty() && sub1_name != null){//추가된 파일이 있으면서 기존에 이미지가 있는경우
			System.out.println("thumbnailImg2 수정됨");
			deleteFile(sub1_name, request);//기존 파일 삭제
			String productImgFileName2 = mkProductImgFile(thumbnailImg2, request);//수정될 이미지 파일 만들기 + 파일명 받아오기
			Map<String, String> picture = new HashMap<String, String>();// DB에 전달할 수정된 파일정보와 이전 파일명
			picture.put("oldName", sub1_name);
			picture.put("realName", thumbnailImg2.getOriginalFilename());
			picture.put("titleName", productImgFileName2);
			System.out.println("sub1_name : " + sub1_name);
			System.out.println("thumbnailImg2.getOriginalFilename() : " + thumbnailImg2.getOriginalFilename());
			System.out.println("productImgFileName2 : " + productImgFileName2);
			int result = pService.updateMainPicture(picture);// DB값에 저장된 이미지 파일명 변경 수정
			if(result > 0) {System.out.println("수정성공");}else {System.out.println("수정실패");}
			
		}else if(!thumbnailImg2.isEmpty() && sub1_name == null) {//추가된 파일이 있으면서 기존에 이미지가 없는경우
			System.out.println("thumbnailImg2 추가됨");
			System.out.println(p);
			String productImgFileName2 = mkProductImgFile(thumbnailImg2, request);//추가될 이미지 파일 만들기 + 파일명 받아오기
			PictureList pl = new PictureList();
			pl.setP_Id(p.getP_Id());
			pl.setPt_name(productImgFileName2);//방금 저장된 이미지파일명
			pl.setPt_realName(thumbnailImg2.getOriginalFilename());//실제 파일명
			
			int result = pService.insertMainPicture(pl);
			if(result > 0) {System.out.println("추가성공");}else {System.out.println("추가실패");}
		}
		
		//서브 2
		if(!thumbnailImg3.isEmpty() && sub2_name != null){//추가된 파일이 있으면서 기존에 이미지가 있는경우
			System.out.println("thumbnailImg3수정됨");
			deleteFile(sub2_name, request);//기존 파일 삭제
			String productImgFileName3 = mkProductImgFile(thumbnailImg3, request);//수정될 이미지 파일 만들기 + 파일명 받아오기
			Map<String, String> picture = new HashMap<String, String>();// DB에 전달할 수정된 파일정보와 이전 파일명
			picture.put("oldName", sub2_name);
			picture.put("realName", thumbnailImg3.getOriginalFilename());
			picture.put("titleName", productImgFileName3);
			System.out.println("sub2_name : " + sub2_name);
			System.out.println("thumbnailImg3.getOriginalFilename() : " + thumbnailImg3.getOriginalFilename());
			System.out.println("productImgFileName3 : " + productImgFileName3);
			int result = pService.updateMainPicture(picture);// DB값에 저장된 이미지 파일명 변경 수정
			if(result > 0) {System.out.println("수정성공");}else {System.out.println("수정실패");}
			
		}else if(!thumbnailImg3.isEmpty() && sub2_name == null) {//추가된 파일이 있으면서 기존에 이미지가 없는경우
			System.out.println("thumbnailImg3 추가됨");
			System.out.println(p);
			String productImgFileName3 = mkProductImgFile(thumbnailImg3, request);//추가될 이미지 파일 만들기 + 파일명 받아오기
			PictureList pl = new PictureList();
			pl.setP_Id(p.getP_Id());
			pl.setPt_name(productImgFileName3);//방금 저장된 이미지파일명
			pl.setPt_realName(thumbnailImg3.getOriginalFilename());//실제 파일명
			
			int result = pService.insertMainPicture(pl);
			if(result > 0) {System.out.println("추가성공");}else {System.out.println("추가실패");}
		}
		
		//서브 3
		if(!thumbnailImg4.isEmpty() && sub3_name != null){//추가된 파일이 있으면서 기존에 이미지가 있는경우
			System.out.println("thumbnailImg4 수정됨");
			deleteFile(sub3_name, request);//기존 파일 삭제
			String productImgFileName4 = mkProductImgFile(thumbnailImg4, request);//수정될 이미지 파일 만들기 + 파일명 받아오기
			Map<String, String> picture = new HashMap<String, String>();// DB에 전달할 수정된 파일정보와 이전 파일명
			picture.put("oldName", sub3_name);
			picture.put("realName", thumbnailImg4.getOriginalFilename());
			picture.put("titleName", productImgFileName4);
			int result = pService.updateMainPicture(picture);// DB값에 저장된 이미지 파일명 변경 수정
			System.out.println("sub3_name : " + sub3_name);
			System.out.println("thumbnailImg4.getOriginalFilename() : " + thumbnailImg4.getOriginalFilename());
			System.out.println("productImgFileName4 : " + productImgFileName4);
			if(result > 0) {System.out.println("수정성공");}else {System.out.println("수정실패");}
			
		}else if(!thumbnailImg4.isEmpty() && sub3_name == null) {//추가된 파일이 있으면서 기존에 이미지가 없는경우
			System.out.println("thumbnailImg4 추가됨");
			System.out.println(p);
			String productImgFileName4 = mkProductImgFile(thumbnailImg4, request);//추가될 이미지 파일 만들기 + 파일명 받아오기
			PictureList pl = new PictureList();
			pl.setP_Id(p.getP_Id());
			pl.setPt_name(productImgFileName4);//방금 저장된 이미지파일명
			pl.setPt_realName(thumbnailImg4.getOriginalFilename());//실제 파일명
			
			int result = pService.insertMainPicture(pl);
			if(result > 0) {System.out.println("추가성공");}else {System.out.println("추가실패");}
		}
		
		
		// 기존거 삭제만 한경우
		// 서브1
		if(sub1_realname != null) {
			if (sub1_realname.equals("c")) {
				deleteFile(sub1_name, request); // 변경된 이름
				int result = pService.deletePicture(sub1_name);
				if(result > 0) {System.out.println("삭제성공");}else {System.out.println("삭제실패");}
			}
		}
		
		
		// 서브2
		if(sub2_realname != null) {
			if (sub2_realname.equals("c")) {
				deleteFile(sub2_name, request); // 변경된 이름
				int result = pService.deletePicture(sub2_name);
				if(result > 0) {System.out.println("삭제성공");}else {System.out.println("삭제실패");}
			}
		}
		
		
		// 서브3
		if(sub3_realname != null) {
			if (sub3_realname.equals("c")) {
				deleteFile(sub3_name, request); // 변경된 이름
				int result = pService.deletePicture(sub3_name);
				if(result > 0) {System.out.println("삭제성공");}else {System.out.println("삭제실패");}
			}
		}
		
		System.out.println("수정 후 상품 내용 : " + p);
		int result = pService.updateProducts(p);
		
		return "redirect:productList.do";
		
	}
	
//    연장선        =================================================================
	// 수정 부분에서 사진만 삭제 했을 경우 기존에 있던 파일을 지워 준다.
	private void deleteFile(String realname, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources"); // 경로를 찾다.
		String savePath = root + "\\img\\products"; // 경로에 이름으로 저장한다.

		File f = new File(savePath + "\\" + realname);

		// 파일이 존재 하면 지워라
		if (f.exists()) {
			f.delete();
		}

		System.out.println("deleteFile 컨트롤러에서 불러 온 사진 이름 : " + realname);
	}
	// 사진을 추가 했을 경우
	public String mkProductImgFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\img\\products";
		File folder = new File(savePath);

		if (!folder.exists()) {// 해당 폴더가 없으면
			folder.mkdirs();// 만들어라
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

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

// ===============   리스트  ==============================================================================================================================		
	// 전체 가지고 오기
	@RequestMapping("listproduct.do")
	public ModelAndView listproduct(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}
		int listCount = pService.listproduct();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Product> list = pService.selectList(pi); // 총 갯수 세면서 객체 반환

		System.out.println("==== 페이징 리스트 가지고 오기 ====");
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list 로 출력 함 : " + list.get(i));
		}

		if (list != null) {
			mv.addObject("pi", pi);

			mv.addObject("list", list);
			mv.setViewName("admin/products/productAll");
		}

		return mv;
	}

	// 도시락 리스트 가기
	@RequestMapping("listdo.do")
	public ModelAndView listdo(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = pService.listdo(); // 도시락 타입만 가지고 오기

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Product> list = pService.selectList2(pi);
		
		System.out.println("도시락 페이지 수 : " + pi);
		System.out.println("리스트 사이즈 : " + list.size());
		System.out.println("==== 페이징 리스트 가지고 오기 ====");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);

			mv.setViewName("admin/products/productDo");
		}

		return mv;
	}

	// 샐러드 리스트 가기
	@RequestMapping("listsal.do")
	public ModelAndView listsal(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = pService.listsal();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	
		ArrayList<Product> list = pService.selectList3(pi);
		System.out.println("==== 페이징 리스트 가지고 오기 ====");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin/products/productSal");
		}

		return mv;
	}
// =============================================================================================================================================		
	// 댓글 리스트 가져오기
	@RequestMapping("pvList.do")
	public void getReplyList(HttpServletResponse response, @RequestParam("p_Id") int p_Id) throws JsonIOException, IOException {
		ArrayList<Productreview> pvList = pService.selectReplyList(p_Id); // 게시판의 댓글 가지고온다.
		

		for(Productreview pv : pvList) {
			pv.setPv_reviewContent(URLEncoder.encode(pv.getPv_reviewContent(),"utf-8"));
			pv.setPv_user(URLEncoder.encode(pv.getPv_user(),"utf-8"));
			System.out.println(pvList);
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		gson.toJson(pvList, response.getWriter());
	}
	
	//	상품 디테일에서 댓글 등록
	@RequestMapping("addReply.do")
	@ResponseBody
	public String addReply(Productreview pv, HttpSession session) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String pv_User = loginUser.getNickName(); // 작성자 닉네임으로 할거임
		
		
		pv.setPv_user(pv_User);
		
		System.out.println(pv); // 잘나오는지 확인 한다.
		
		int result = pService.insertReply(pv); // 서비스단에 넘겨준다.
		
		if(result > 0) {
			return "success";
		}else {
			throw new Exception("댓글 등록 실패");
		}
		
		
	}
	// 댓글 수정
	@RequestMapping("updateReply.do")
	@ResponseBody
	public String updateReply(@ModelAttribute Productreview pv,HttpSession session) throws Exception {
		
		System.out.println("업데이트 pv 객체 : " + pv);
		/* pv.setPv_reviewContent(pv_reviewContent); */// 변경 된거를 집어 넣어 준다.
		
		int result = pService.updateReply(pv);
		
		if(result > 0) {
			return "success";
		}else {
			throw new Exception("댓글 등록 실패");
		}
	}
	
	// 댓글 삭제
	@RequestMapping("deletedPv.do")
	@ResponseBody
	public String deletePv(Productreview pv, HttpSession session) throws Exception{
		
		System.out.println("delete 넘어온 댓글 번호  : " + pv);
		
		int result = pService.deleteReply(pv);
		
		if(result > 0) {
			return "success";
		}else {
			throw new Exception("댓글 등록 실패");		
		}
	}
	
	
	// qna 댓글 등록
	@RequestMapping("addQna.do")
	@ResponseBody
	public String insertQna(ProductQna pq,HttpSession session) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String qna_user = loginUser.getNickName(); // 작성자 이름 넣어주기
		
		pq.setQna_user(qna_user); // 작성자를 넣어준다.
		
		System.out.println("상품문의  객체 : " + pq);
		
		int result = pService.insertQna(pq);
		
		if(result > 0) {
			return "success";
		}else {
			throw new Exception("댓글 등록 실패");
		}
		
	}
	
	
	//qna 리스트 호출 디테일 들어오자마자 시작됨
	@RequestMapping("qnaList.do")
	public void getQnaList(HttpServletResponse response, @RequestParam("p_Id") int p_Id) throws JsonIOException, IOException {
		System.out.println("=================================== qnaList.do =====================================");
		ArrayList<ProductQna> pqList = pService.selectQnaList(p_Id);
		ArrayList<ProductQna> encoding = new ArrayList<ProductQna>();
		
		ArrayList<ProductAnswer> paList = pService.answerAll();
		
		System.out.println(pqList.size());
		System.out.println(paList.size());
		
		for(ProductQna pq : pqList) {
			pq.setQna_user(URLEncoder.encode(pq.getQna_user(),"utf-8"));
			pq.setQna_content(URLEncoder.encode(pq.getQna_content(),"utf-8"));
			/*pq.setAnswer_content(URLEncoder.encode(pq.getAnswer_content(),"utf-8"));*/

			if(pq.getQna_answer().equals("Y")) {
				
				for(ProductAnswer pa : paList) {
					if(pa.getQna_Id() == pq.getQna_Id()) {
						System.out.println(pa);
						System.out.println(pq);
						pq.setAnswer_content(URLEncoder.encode(pa.getAnswer_content(),"utf-8"));
						pq.setAnswer_createDate(pa.getAnswer_createdate());
						break;
					}
				}
			}else {
				System.out.println("답글없음");
				System.out.println(pq);
			}
			encoding.add(pq);
		}
		
		for(ProductQna qna : encoding) {
			System.out.println(qna);
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		gson.toJson(encoding, response.getWriter());
	}
	
	// qna 삭제
	@RequestMapping("deletedQna.do")
	@ResponseBody
	public String deleteQna(ProductQna pq, HttpSession session) throws Exception {
		
		System.out.println("deleteQna : " + pq);
		
		int result = pService.deleteQna(pq);
		
		if(result > 0) {
			return "success";
			
		}else {
			throw new Exception("상품 등록 실패");	
		}
		
		
	}
	
	
	// qna 문의 수정
	@RequestMapping("updateQna.do")
	@ResponseBody
	public String updateQna(@ModelAttribute ProductQna pq, HttpSession session) throws Exception {
		
		System.out.println("상품 문의 객체 확인 : " + pq);
		
		int result = pService.updateQna(pq);
		
		if(result > 0) {
			
			return "success";
		}else {
			throw new Exception("댓글 등록 실패");
		}
		
		
	}
	
	// 상품 답변
	@RequestMapping("addAnswer.do")
	@ResponseBody
	public void addAnswer(ProductAnswer pa, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
		
		System.out.println("pa 컨트롤러 출력 한다. : " + pa);
		
		int result = pService.insertAnswer(pa);
		
		if(result > 0) {
			ProductAnswer pan = pService.selectAnswer2(pa);
			
			pan.setQna_user(URLEncoder.encode(pan.getQna_user(), "utf-8"));
			pan.setQna_content(URLEncoder.encode(pan.getQna_content(),"utf-8"));
			pan.setAnswer_content(URLEncoder.encode(pan.getAnswer_content(),"utf-8"));

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			gson.toJson(pan, response.getWriter());
		}
		
	}
	
	// 답글 달린후 답변 상태 변경 해준다.
	@RequestMapping("updateQnaType.do")
	@ResponseBody
	public String updateQnaType(ProductQna pq, HttpServletResponse response,HttpSession session) throws Exception {
		System.out.println(pq);
		
		System.out.println("qna 상태 수정 결과 : "+ pq);
		int result = pService.updateQnaType(pq);
		
		if(result > 0) {
			return "success";
		}else {
			throw new Exception("수정 실패");
		}
	}
	
	// 문의 답글을 삭제 하겠습니다.
	@RequestMapping("deleteAnswer.do")
	@ResponseBody
	public String deleteAnswer(ProductAnswer pa,  HttpServletResponse response,HttpSession session,ProductQna pq) throws Exception {
		
		int result = pService.deleteAnswer(pa);
		if(result > 0) {
			pService.updateQnaType2(pq);
			return "success";
		}else {
			throw new Exception("삭제에 실패 했습니다.");
		}
	}
	
	@RequestMapping("updateQnaType2.do")
	@ResponseBody
	public void updateType2(ProductQna pq,HttpServletResponse response,HttpSession session ) {
		 pService.updateQnaType2(pq);
	}
	
	@RequestMapping("AnswerUpdate.do")
	@ResponseBody
	public void AnswerUpdate(ProductAnswer pa,  HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
	
		System.out.println("수정 버튼 눌림 : "+pa);
		int result = pService.AnswerUpdate(pa);
		
		if(result > 0) {
			System.out.println("컨트롤 일로 오냐?");
			ProductAnswer pan = pService.selectAnswer2(pa);
			
			pan.setQna_user(URLEncoder.encode(pan.getQna_user(), "utf-8"));
			pan.setQna_content(URLEncoder.encode(pan.getQna_content(),"utf-8"));
			pan.setAnswer_content(URLEncoder.encode(pan.getAnswer_content(),"utf-8"));

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			gson.toJson(pan, response.getWriter());
		}else {
			System.out.println("안됨?");
		}
	}
	
	
	
	
}







