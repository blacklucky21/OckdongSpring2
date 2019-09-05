package com.junwo.ockdong.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.junwo.ockdong.myOwn.model.service.MyOwnService;
import com.junwo.ockdong.myOwn.model.vo.Ingredient;

@Controller
public class AdminController {

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

	// 메인 화면 로고 누르면 메인 화면으로 이동한다.
	@RequestMapping("main.do")
	public String main() {
		return "Main";
	}

	// 나만의 도시락 관리 페이지
	@RequestMapping("mydo.do")
	public String mydoView() {
		return "admin/mydo/myOwn_lunch";
	}

	// 나만의 도시락 재료관리
	@RequestMapping("myIn.do")
	public String myInView() {
		return "admin/mydo/myOwn_Ingredients";
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
									 @RequestParam(value="ingredientImg", required = false) MultipartFile uploadFile,
									 HttpServletRequest request) {
		
		System.out.println(in);
		
		if(inCategory.equals("4찬")) {
			in.setInType(selected4);
			inCategory = inCategory + "\\" + selected4;
		}else {
			in.setInType(selected5);
			inCategory = inCategory + "\\" + selected5;
		}
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			// 저장할 경로를 지정하는 saveFile()메소드 생성
			
			String renameFileName = inSaveFile(uploadFile, request, inCategory);
			
			if(renameFileName != null) {
				in.setInOriginalFile(uploadFile.getOriginalFilename());
				in.setInRenameFile(renameFileName);
			}
		}
		
		System.out.println(in);
		
		int result = moService.insert(in);
		
		if(result > 0) {
			return "redirect:myIn.do";
		}else {
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

}
