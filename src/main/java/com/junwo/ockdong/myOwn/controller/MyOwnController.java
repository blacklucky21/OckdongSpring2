package com.junwo.ockdong.myOwn.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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
	
	//결제 페이지로 이동
	@RequestMapping("myOwnInsert.do")
	public ModelAndView myOwnInsert(ModelAndView mv,
			@RequestParam("imgSrc") String imgSrc,
			@RequestParam("selectedRice") int rice,
			@RequestParam(value = "selectedSoup", required = false) String soup,
			@RequestParam("selectedMain") int main,
			@RequestParam("selectedSub1") int sub1,
			@RequestParam("selectedSub2") int sub2,
			HttpServletRequest request) throws IOException {
		
		System.out.println("myOwnInsert.do로 들어옴");
		System.out.println("imgSrc : " + imgSrc);
		
		String fileName = CreateRecipe(imgSrc, request);
		
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
}
