package com.junwo.ockdong.myOwn.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.Pagination;
import com.junwo.ockdong.member.model.vo.Member;
import com.junwo.ockdong.myOwn.model.service.MyOwnService;
import com.junwo.ockdong.myOwn.model.vo.Ingredient;
import com.junwo.ockdong.myOwn.model.vo.MBLRecipe;

@Controller
public class MyOwnController {

	@Autowired
	private MyOwnService service;

	@RequestMapping("myOwn4.do")
	public ModelAndView myOwn4(ModelAndView mv) {

		ArrayList<Ingredient> AllList = service.selectAll();

		ArrayList<Ingredient> riceList = new ArrayList<Ingredient>();
		ArrayList<Ingredient> mainList = new ArrayList<Ingredient>();
		ArrayList<Ingredient> sub1List = new ArrayList<Ingredient>();
		ArrayList<Ingredient> sub2List = new ArrayList<Ingredient>();

		for (Ingredient i : AllList) {
			switch (i.getInType()) {
			case "1_밥":
				riceList.add(i);
				break;
			case "4_메인":
				mainList.add(i);
				break;
			case "2_서브1":
				sub1List.add(i);
				break;
			case "3_서브2":
				sub2List.add(i);
				break;
			}
		}

		mv.addObject("riceList", riceList);
		mv.addObject("mainList", mainList);
		mv.addObject("sub1List", sub1List);
		mv.addObject("sub2List", sub2List);
		mv.setViewName("myOwn/myOwn4");

		return mv;
	}

	@RequestMapping("myOwn5.do")
	public ModelAndView myOwn5(ModelAndView mv) {

		ArrayList<Ingredient> AllList = service.selectAll();

		ArrayList<Ingredient> riceList = new ArrayList<Ingredient>();
		ArrayList<Ingredient> mainList = new ArrayList<Ingredient>();
		ArrayList<Ingredient> sub1List = new ArrayList<Ingredient>();
		ArrayList<Ingredient> sub2List = new ArrayList<Ingredient>();
		ArrayList<Ingredient> soupList = new ArrayList<Ingredient>();

		for (Ingredient i : AllList) {
			switch (i.getInType()) {
			case "5_밥":
				riceList.add(i);
				break;
			case "6_메인":
				mainList.add(i);
				break;
			case "7_서브1":
				sub1List.add(i);
				break;
			case "8_서브2":
				sub2List.add(i);
				break;
			case "9_수프":
				soupList.add(i);
				break;
			}
		}

		mv.addObject("riceList", riceList);
		mv.addObject("mainList", mainList);
		mv.addObject("sub1List", sub1List);
		mv.addObject("sub2List", sub2List);
		mv.addObject("soupList", soupList);
		mv.setViewName("myOwn/myOwn5");

		return mv;

	}

	//결제 페이지로 이동dddd


	@RequestMapping("myOwnInsert.do")
	public ModelAndView myOwnInsert(ModelAndView mv,
			@RequestParam("imgSrc") String imgSrc,
			@RequestParam("selectedRice") int rice,
			@RequestParam(value = "selectedSoup", required = false) String soup,
			@RequestParam("selectedMain") int main,
			@RequestParam("selectedSub1") int sub1,
			@RequestParam("selectedSub2") int sub2,
			HttpServletRequest request,
			HttpSession session) throws IOException {

		Member m = (Member) session.getAttribute("loginUser");

		System.out.println("myOwnInsert.do로 들어옴");
		System.out.println("imgSrc : " + imgSrc);
		
		String fileName = CreateRecipe(imgSrc, request);
		
		fileName = fileName + ".png";
		
		System.out.println("fileName : " + fileName);
		
		System.out.println("Controller > myOwnInsert()");
		System.out.println("rice : " + rice + " soup : " + soup + " main : " + main + " sub1 : " + sub1 + " sub2 : " + sub2);
		
		
		//재료 객체 만들기

		Ingredient riceIn = service.selectOne(rice);
		Ingredient mainIn = service.selectOne(main);
		Ingredient sub1In = service.selectOne(sub1);
		Ingredient sub2In = service.selectOne(sub2);
		Ingredient soupIn = null;

		if (soup != null) {
			System.out.println("5찬");
			soupIn = service.selectOne(Integer.parseInt(soup));
		} else {
			System.out.println("4찬");
		}


		// session에서 로그인정보 가져오기
		Member member = (Member)session.getAttribute("loginUser");

		// 날짜가져오기 yyyymmdd형식으로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        System.out.println("strToday : " + strToday);


        // 변수 설정
        int result = 0;
		String numbers = "";
		MBLRecipe mbl = null;
		// 파일 생성
		//등록할 mblRecipe정보 넣기
		Map<String, String> list = new HashMap<String, String>();
		
		list.put("userId", member.getUserId());
		list.put("fileName", fileName);
		list.put("racipeName", member.getUserId() + "님이 만드신 나만의 도시락 입니다.(" + strToday + ")");
		
		// soup여부 확인 (4찬인지 5찬인지 판별)
		if(soup != null) {
			// 재료들의 번호 넣기
			numbers = rice + "/" + soup + "/" + main + "/" + sub1 + "/" + sub2;
			list.put("type", "5찬");
			list.put("numbers", numbers);
			//재료 객체 만들기
			soupIn = service.selectOne(Integer.parseInt(soup));
		}else {
			// 재료들의 번호 넣기
			numbers = rice + "/" + main + "/" + sub1 + "/" + sub2;
			list.put("type", "4찬");
			list.put("numbers", numbers);
		}
		
		result = service.insertRecipe(list);
		
		
		if(result > 0) {
			System.out.println("mblRecipe 만들기 성공");
			 mbl = service.myMBLRecipe(fileName);
		}else {
			System.out.println("mblRecipe 만들기 실패");
		}
		System.out.println("pid"+mbl.getMblId());
		mv.addObject("rice",riceIn);
		mv.addObject("main",mainIn);
		mv.addObject("sub1",sub1In);
		mv.addObject("sub2",sub2In);
		mv.addObject("soup",soupIn);
		mv.addObject("fileName",fileName);
		mv.addObject("mbl",mbl);
		mv.addObject("member",m);

		mv.setViewName("myOwn/myOwnPayment");
		
		return mv;
	}

	@RequestMapping("myOwnAddRecipe.do")
	public String myOwnAddRecipe() {
		return "myOwn/myOwnAddRecipe";
	}

	@RequestMapping("myOwnPayment.do")
	public String myOwnPayment() {
		return "myOwn/myOwnPayment";
	}
	
	
	//이미지 만들면서 추가 페이지로 이동
	@RequestMapping("imageCreate.do")
	public ModelAndView createImage(ModelAndView mv,
									@RequestParam("imgSrc") String imgSrc,
									@RequestParam(value = "selectedSoup", required = false) String soup,
									@RequestParam("selectedRice") int rice,
									@RequestParam("selectedMain") int main,
									@RequestParam("selectedSub1") int sub1,
									@RequestParam("selectedSub2") int sub2,
									HttpServletRequest request) throws Exception {
		
		String fileName = CreateRecipe(imgSrc, request);
		
		System.out.println("fileName : " + fileName);
		if (soup != null && soup != "") {
			System.out.println("5찬");
		} else {
			System.out.println("4찬");
		}

		System.out.println("rice : " + rice + " soup : " + soup + " main : " + main + " sub1 : " + sub1 + " sub2 : " + sub2);
		
		Ingredient inRice = service.selectOne(rice);
		
		Ingredient inSoup = null;
		System.out.println("soup 번호 : " + soup);
		if(soup != null && soup != "") {
			int soupNum = Integer.parseInt(soup);
			inSoup = service.selectOne(soupNum);
		}else {
			inSoup = null;
		}
		Ingredient inMain = service.selectOne(main);
		Ingredient inSub1 = service.selectOne(sub1);
		Ingredient inSub2 = service.selectOne(sub2);
		
		System.out.println(inSoup);
		
		
		mv.addObject("rice",inRice);
		mv.addObject("soup",inSoup);
		mv.addObject("main",inMain);
		mv.addObject("sub1",inSub1);
		mv.addObject("sub2",inSub2);
		mv.addObject("fileName",fileName);
		mv.setViewName("myOwn/myOwnAddRecipe");
		return mv;
		
	}
	
	
	/* 캡쳐한 이미지 프로젝트에 저장하기 */
	public String CreateRecipe(@RequestParam("imgSrc") String imgSrc,
							   HttpServletRequest request) throws IOException {
		FileOutputStream stream = null;
		String fileName = "";
		
		try {
			System.out.println("binary file " + imgSrc);
			if (imgSrc == null || imgSrc == "") {
				throw new Exception();
			}

			imgSrc = imgSrc.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(imgSrc);
			System.out.println("file :::::::: " + file + " || " + file.length);
			fileName = UUID.randomUUID().toString();
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\img\\Recipe";
			System.out.println("savePath : " + savePath);
			File folder = new File(savePath);
			
			stream = new FileOutputStream(folder + "\\" + fileName + ".png");
			stream.write(file);
			stream.close();
			System.out.println("파일 작성 완료");
		} catch (Exception e) {
			System.out.println("파일이 정상적으로 넘어오지 않았습니다");
		}
		return fileName;
	}
	
	@RequestMapping("recipeInsert.do")
	public String RecipeInsert(@RequestParam("fileName") String fileName,
							   @RequestParam("racipeName") String racipeName,
							   @RequestParam("riceNo") int riceNo,
							   @RequestParam(value = "soupNo", required = false) String soupNo,
							   @RequestParam("mainNo") int mainNo,
							   @RequestParam("sub1No") int sub1No,
							   @RequestParam("sub2No") int sub2No,
							   HttpSession session){
		
		System.out.println("recipeInsert.do에서의 fileName : " + fileName);
		
		Member member = (Member)session.getAttribute("loginUser");
		System.out.println(member);
		
		int soup = 0;
		int result = 0;
		
		String numbers = "";
		
		Map<String, String> list = new HashMap<String, String>();
		
		list.put("userId", member.getUserId());
		list.put("fileName", fileName);
		list.put("racipeName", racipeName);
		System.out.println("soupNo :" + soupNo);
		
		
		if(soupNo != null && soupNo !="") {
			System.out.println("soupNo : " + soupNo);
			soup = Integer.parseInt(soupNo);
			System.out.println("soup : " + soup);
			numbers = riceNo + "/" + soup + "/" + mainNo + "/" + sub1No + "/" + sub2No;
			list.put("type", "5찬");
			list.put("numbers", numbers);
			result = service.insertRecipe(list);
		}else {
			numbers = riceNo + "/" + mainNo + "/" + sub1No + "/" + sub2No;
			list.put("type", "4찬");
			list.put("numbers", numbers);
			result = service.insertRecipe(list);
		}
		
		if(result > 0) {
			System.out.println("성공");
			return "Main";
		}else {
			System.out.println("실패");
			return "Main";
		}
	}
	
	@RequestMapping("allRecipe.do")
	public ModelAndView allRecipe(ModelAndView mv) {
		
		ArrayList<MBLRecipe> rList = service.getAllRecipe();
		
		
		mv.addObject("rList", rList);
		mv.setViewName("admin/mydo/myOwn_Recipe");
		
		return mv;
	}
	
	@RequestMapping("myOwnList.me")
	public ModelAndView myOwnListMyPage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginUser");
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
			System.out.println("page번호 : " + page);
		}

		int listCount = service.getListCount(member.getUserId());
		System.out.println("자신이 등록한 나만의 레시피 개수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfoNine(currentPage, listCount);
		
		ArrayList<MBLRecipe> rList = service.getUserRecipe(pi, member.getUserId());
		System.out.println("가져온 리스트");
		System.out.println(rList);
		
		mv.addObject("listCount",listCount);
		mv.addObject("rList", rList);
		mv.addObject("pi",pi);
		mv.setViewName("myOwn/myPage_RecipeList");
		return mv;
		
//		ArrayList<MBLRecipe> rList = service.getUserRecipe(member.getUserId());
//		if(rList != null) {
//			mv.addObject("rList",rList);
//		}
//		mv.setViewName("myOwn/myPage_RecipeList");
//		return mv;
	}
	
	@RequestMapping("recipeDetailOne.me")
	public ModelAndView recipeDetailOne(ModelAndView mv, @RequestParam("mblId") String mblId) {
		
		MBLRecipe mblR = service.searchRecipeOne(mblId);
		
		String[] numbers = mblR.getNumbers().split("/");
		
		Ingredient rice = null;
		Ingredient soup = null;
		Ingredient main = null;
		Ingredient sub1 = null;
		Ingredient sub2 = null;
		
		Ingredient in = null;
		for(int i = 0; i < numbers.length; i++) {
			in = service.selectOne(Integer.parseInt(numbers[i]));
			
			switch(in.getInType()) {
				case "1_밥": case "5_밥":
					rice = in;
					break;
				case "2_서브1" : case "7_서브1":
					sub1 = in;
					break;
				case "3_서브2" : case "8_서브2":
					sub2 = in;
					break;
				case "4_메인": case "6_메인":
					main = in;
					break;
				case "9_수프":
					soup = in;
					break;
			}
		}
		
		mv.addObject("rice",rice);
		mv.addObject("soup",soup);
		mv.addObject("main",main);
		mv.addObject("sub1",sub1);
		mv.addObject("sub2",sub2);
		mv.addObject("mblR",mblR);
		mv.setViewName("myOwn/myPage_RecipeOne");
		return mv;
	}
	
	//결제 페이지로 이동
	@RequestMapping("myPagePaymentInsert.do")
	public ModelAndView myPagePaymentInsert(ModelAndView mv,
			@RequestParam("fileName") String fileName,
			@RequestParam("riceNo") int rice,
			@RequestParam(value = "soupNo", required = false) String soup,
			@RequestParam("mainNo") int main,
			@RequestParam("sub1No") int sub1,
			@RequestParam("sub2No") int sub2,
			HttpServletRequest request) throws IOException {
		
		System.out.println("fileName : " + fileName);
		
		System.out.println("Controller > myOwnInsert()");
		System.out.println("rice : " + rice + " soup : " + soup + " main : " + main + " sub1 : " + sub1 + " sub2 : " + sub2);
		
		Ingredient riceIn = service.selectOne(rice);
		Ingredient mainIn = service.selectOne(main);
		Ingredient sub1In = service.selectOne(sub1);
		Ingredient sub2In = service.selectOne(sub2);
		Ingredient soupIn = null;
		if (soup != null) {
			System.out.println("5찬");
			soupIn = service.selectOne(Integer.parseInt(soup));
		} else {
			System.out.println("4찬");
		}

		mv.addObject("rice",riceIn);
		mv.addObject("main",mainIn);
		mv.addObject("sub1",sub1In);
		mv.addObject("sub2",sub2In);
		mv.addObject("soup",soupIn);
		mv.addObject("fileName",fileName);
		mv.setViewName("myOwn/myOwnPayment");
		
		return mv;
	}
	
	@RequestMapping("recipeUpdate.do")
	public ModelAndView recipeUpdate(ModelAndView mv, @RequestParam("mblId") int mblId, @RequestParam("fileName") String fileName) {
		
		MBLRecipe mblR = service.myRecipeDetail(mblId);
		
		String[] numbers = mblR.getNumbers().split("/");
		
		Ingredient rice = null;
		Ingredient soup = null;
		Ingredient main = null;
		Ingredient sub1 = null;
		Ingredient sub2 = null;
		
		Ingredient in = null;
		for(int i = 0; i < numbers.length; i++) {
			in = service.selectOne(Integer.parseInt(numbers[i]));
			
			switch(in.getInType()) {
				case "1_밥": case "5_밥":
					rice = in;
					break;
				case "2_서브1" : case "7_서브1":
					sub1 = in;
					break;
				case "3_서브2" : case "8_서브2":
					sub2 = in;
					break;
				case "4_메인": case "6_메인":
					main = in;
					break;
				case "9_수프":
					soup = in;
					break;
			}
		}
		
		mv.addObject("rice",rice);
		mv.addObject("soup",soup);
		mv.addObject("main",main);
		mv.addObject("sub1",sub1);
		mv.addObject("sub2",sub2);
		mv.addObject("mblR",mblR);
		
		
		if(soup != null) {
			//5찬일 경우
			ArrayList<Ingredient> AllList = service.selectAll();

			ArrayList<Ingredient> riceList = new ArrayList<Ingredient>();
			ArrayList<Ingredient> mainList = new ArrayList<Ingredient>();
			ArrayList<Ingredient> sub1List = new ArrayList<Ingredient>();
			ArrayList<Ingredient> sub2List = new ArrayList<Ingredient>();
			ArrayList<Ingredient> soupList = new ArrayList<Ingredient>();

			for (Ingredient i : AllList) {
				switch (i.getInType()) {
				case "5_밥":
					riceList.add(i);
					break;
				case "6_메인":
					mainList.add(i);
					break;
				case "7_서브1":
					sub1List.add(i);
					break;
				case "8_서브2":
					sub2List.add(i);
					break;
				case "9_수프":
					soupList.add(i);
					break;
				}
			}

			mv.addObject("riceList", riceList);
			mv.addObject("mainList", mainList);
			mv.addObject("sub1List", sub1List);
			mv.addObject("sub2List", sub2List);
			mv.addObject("soupList", soupList);
			mv.addObject("fileName",fileName);
			mv.setViewName("myOwn/myOwn5RecipeUpdate");
		}else {
			//4찬일 경우
			ArrayList<Ingredient> AllList = service.selectAll();

			ArrayList<Ingredient> riceList = new ArrayList<Ingredient>();
			ArrayList<Ingredient> mainList = new ArrayList<Ingredient>();
			ArrayList<Ingredient> sub1List = new ArrayList<Ingredient>();
			ArrayList<Ingredient> sub2List = new ArrayList<Ingredient>();

			for (Ingredient i : AllList) {
				switch (i.getInType()) {
				case "1_밥":
					riceList.add(i);
					break;
				case "4_메인":
					mainList.add(i);
					break;
				case "2_서브1":
					sub1List.add(i);
					break;
				case "3_서브2":
					sub2List.add(i);
					break;
				}
			}

			mv.addObject("riceList", riceList);
			mv.addObject("mainList", mainList);
			mv.addObject("sub1List", sub1List);
			mv.addObject("sub2List", sub2List);
			mv.addObject("fileName",fileName);
			mv.setViewName("myOwn/myOwn4RecipeUpdate");
		}
		
		return mv;
	}
	
	@RequestMapping("myOwnRecipeUpdate.do")
	public String myOwnRecipeUpdate(@RequestParam("imgSrc") String imgSrc,
									@RequestParam(value = "selectedSoup", required = false) String soup,
									@RequestParam("selectedRice") int rice,
									@RequestParam("selectedMain") int main,
									@RequestParam("selectedSub1") int sub1,
									@RequestParam("selectedSub2") int sub2,
									@RequestParam("mblId") String mblId,
									@RequestParam("racipeName") String racipeName,
									@RequestParam("pastFileName") String pastFileName,
									HttpServletRequest request,
									HttpSession session) throws Exception {
		
		Member member = (Member)session.getAttribute("loginUser");
		
		String fileName = CreateRecipe(imgSrc, request);
		
		System.out.println("imgSrc : " + imgSrc);
		System.out.println("pastFileName : " + pastFileName);
		
		MBLRecipe mblR = service.searchRecipeOne(mblId);
		
		int removeResult = removeRecipe(pastFileName, request);
		
		System.out.println("pastFileName : " + pastFileName);
		
		if(removeResult > 0) {
			System.out.println("기존 레시피 삭제 성공");
		}else {
			System.out.println("기존 레시피 삭제 실패");
			throw new Exception("나만의 도시락 수정 중 기존 파일 삭제 실패!!!");
		}
		
		
		System.out.println("fileName : " + fileName);
		
		fileName = fileName + ".png";
		
		String numbers = "";
		if (soup != null && soup != "") {
			System.out.println("5찬");
			mblR.setMblType("5찬");
			numbers = rice + "/" + soup + "/" + main + "/" + sub1 + "/" + sub2;
		} else {
			System.out.println("4찬");
			mblR.setMblType("4찬");
			numbers = rice + "/" + main + "/" + sub1 + "/" + sub2;
		}
		
		System.out.println("rice : " + rice + " soup : " + soup + " main : " + main + " sub1 : " + sub1 + " sub2 : " + sub2);
		
		mblR.setMblTitle(racipeName);
		mblR.setMblFileName(fileName);
		mblR.setNumbers(numbers);
		
		int result = service.updateRecipe(mblR);
		
		if(result > 0) {
			return "redirect:myOwnList.me";
		}else {
			throw new Exception("나만의 도시락 수정 중 에러 발생!!!");
		}
	}
	
	
	public int removeRecipe(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String removePath = root + "\\img\\Recipe\\" + fileName;
		File removeFile = new File(removePath);
		if (!removeFile.exists()) {// 해당 폴더가 없으면
			return 0;
		}
		if (removeFile.exists()) {
			if (removeFile.delete()) {
				System.out.println("기존 파일 삭제 성공");
				return 1;
			} else {
				System.out.println("기존 파일 삭제 실패");
				return -1;
			}
		} else {
			System.out.println("없는 파일");
			return -1;
		}
	}
}
