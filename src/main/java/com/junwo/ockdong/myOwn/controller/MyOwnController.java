package com.junwo.ockdong.myOwn.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.myOwn.model.service.MyOwnService;
import com.junwo.ockdong.myOwn.model.vo.Img;

@Controller
public class MyOwnController {
	
	@Autowired
	private MyOwnService service;
	
	@RequestMapping("myOwn4.do")
	public ModelAndView myOwn4(ModelAndView mv) {
		
		ArrayList<Img> riceList = new ArrayList<Img>();

		riceList.add(new Img(1,"백미","백미_1.png","img/myOwn/4찬/1_밥/백미_1.png"));
		riceList.add(new Img(2,"보리밥","보리밥_1.png","img/myOwn/4찬/1_밥/보리밥_1.png"));
		riceList.add(new Img(3,"볶음밥","볶음밥_1.png","img/myOwn/4찬/1_밥/볶음밥_1.png"));
		riceList.add(new Img(4,"비빔밥","비빔밥_1.png","img/myOwn/4찬/1_밥/비빔밥_1.png"));
		riceList.add(new Img(5,"새우볶음밥","새우볶음밥_1.png","img/myOwn/4찬/1_밥/새우볶음밥_1.png"));
		riceList.add(new Img(5,"오곡밥","오곡밥_1.png","img/myOwn/4찬/1_밥/오곡밥_1.png"));
		
		System.out.println(riceList);
		
		
		ArrayList<Img> mainList = new ArrayList<Img>();
		
		mainList.add(new Img(1, "갈치구이","갈치구이_4.png","img/myOwn/4찬/4_메인/갈치구이_4.png"));
		mainList.add(new Img(2, "낙지볶음","낙지볶음_4.png","img/myOwn/4찬/4_메인/낙지볶음_4.png"));
		mainList.add(new Img(3, "닭갈비","닭갈비_4.png","img/myOwn/4찬/4_메인/닭갈비_4.png"));
		mainList.add(new Img(4, "닭강정","닭강정_4.png","img/myOwn/4찬/4_메인/닭강정_4.png"));
		mainList.add(new Img(5, "돈까스","돈까스_4.png","img/myOwn/4찬/4_메인/돈까스_4.png"));
		mainList.add(new Img(6, "돼지갈비","돼지갈비_4.png","img/myOwn/4찬/4_메인/돼지갈비_4.png"));
		mainList.add(new Img(7, "돼지고기볶음","돼지고기볶음_4.png","img/myOwn/4찬/4_메인/돼지고기볶음_4.png"));
		mainList.add(new Img(8, "떡갈비","떡갈비_4.png","img/myOwn/4찬/4_메인/떡갈비_4.png"));
		mainList.add(new Img(9, "매운갈비찜","매운갈비찜_4.png","img/myOwn/4찬/4_메인/매운갈비찜_4.png"));
		mainList.add(new Img(10, "생선까스","생선까스_4.png","img/myOwn/4찬/4_메인/생선까스_4.png"));
		mainList.add(new Img(11, "소불고기","소불고기_4.png","img/myOwn/4찬/4_메인/소불고기_4.png"));
		mainList.add(new Img(12, "소세지볶음","소세지볶음_4.png","img/myOwn/4찬/4_메인/소세지볶음_4.png"));
		
		ArrayList<Img> sub1List = new ArrayList<Img>();
		
		sub1List.add(new Img(1,"감자볶음","감자볶음_2.png","img/myOwn/4찬/2_서브1/감자볶음_2.png"));
		sub1List.add(new Img(2,"건새우볶음","건새우볶음_2.png","img/myOwn/4찬/2_서브1/건새우볶음_2.png"));
		sub1List.add(new Img(3,"고사리나물","고사리나물_2.png","img/myOwn/4찬/2_서브1/고사리나물_2.png"));
		sub1List.add(new Img(4,"깻잎나물볶음","깻잎나물볶음_2.png","img/myOwn/4찬/2_서브1/깻잎나물볶음_2.png"));
		sub1List.add(new Img(5,"느티버섯","느티버섯_2.png","img/myOwn/4찬/2_서브1/느티버섯_2.png"));
		sub1List.add(new Img(6,"도토리묵","도토리묵_2.png","img/myOwn/4찬/2_서브1/도토리묵_2.png"));
		sub1List.add(new Img(7,"멸치풋고추볶음","멸치풋고추볶음_2.png","img/myOwn/4찬/2_서브1/멸치풋고추볶음_2.png"));
		sub1List.add(new Img(8,"미나리나물","미나리나물_2.png","img/myOwn/4찬/2_서브1/미나리나물_2.png"));
		sub1List.add(new Img(9,"소고기메추리알장조림","소고기메추리알장조림_2.png","img/myOwn/4찬/2_서브1/소고기메추리알장조림_2.png"));
		sub1List.add(new Img(10,"숙주나물","숙주나물_2.png","img/myOwn/4찬/2_서브1/숙주나물_2.png"));
		sub1List.add(new Img(11,"연근조림","연근조림_2.png","img/myOwn/4찬/2_서브1/연근조림_2.png"));
		sub1List.add(new Img(12,"콩나물","콩나물_2.png","img/myOwn/4찬/2_서브1/콩나물_2.png"));
		sub1List.add(new Img(13,"콩조림","콩조림_2.png","img/myOwn/4찬/2_서브1/콩조림_2.png"));
		sub1List.add(new Img(14,"파무침","파무침_2.png","img/myOwn/4찬/2_서브1/파무침_2.png"));
		
		
		
		ArrayList<Img> sub2List = new ArrayList<Img>();
		
		sub2List.add(new Img(1,"김치볶음","김치볶음_3.png","img/myOwn/4찬/3_서브2/김치볶음_3.png"));
		sub2List.add(new Img(2,"깍두기","깍두기_3.png","img/myOwn/4찬/3_서브2/깍두기_3.png"));
		sub2List.add(new Img(3,"무말랭이무침","무말랭이무침_3.png","img/myOwn/4찬/3_서브2/무말랭이무침_3.png"));
		sub2List.add(new Img(4,"미역초무침","미역초무침_3.png","img/myOwn/4찬/3_서브2/미역초무침_3.png"));
		sub2List.add(new Img(5,"배추김치","배추김치_3.png","img/myOwn/4찬/3_서브2/배추김치_3.png"));
		sub2List.add(new Img(6,"시금치나물","시금치나물_3.png","img/myOwn/4찬/3_서브2/시금치나물_3.png"));
		sub2List.add(new Img(7,"열무김치","열무김치_3.png","img/myOwn/4찬/3_서브2/열무김치_3.png"));
		sub2List.add(new Img(8,"오이소박이","오이소박이_3.png","img/myOwn/4찬/3_서브2/오이소박이_3.png"));
		
		mv.addObject("riceList", riceList);
		mv.addObject("mainList", mainList);
		mv.addObject("sub1List", sub1List);
		mv.addObject("sub2List", sub2List);
		mv.setViewName("myOwn/myOwn4");
		
		
		return mv;
	}
	
	@RequestMapping("myOwn5.do")
	public ModelAndView myOwn5(ModelAndView mv) {
		
		ArrayList<Img> riceList = new ArrayList<Img>();

		riceList.add(new Img(1,"백미","백미_5.png","img/myOwn/5찬/5_밥/백미_5.png"));
		riceList.add(new Img(2,"보리밥","보리밥_5.png","img/myOwn/5찬/5_밥/보리밥_5.png"));
		riceList.add(new Img(3,"볶음밥","볶음밥_5.png","img/myOwn/5찬/5_밥/볶음밥_5.png"));
		riceList.add(new Img(4,"비빔밥","비빔밥_5.png","img/myOwn/5찬/5_밥/비빔밥_5.png"));
		riceList.add(new Img(5,"새우볶음밥","새우볶음밥_5.png","img/myOwn/5찬/5_밥/새우볶음밥_5.png"));
		riceList.add(new Img(5,"오곡밥","오곡밥_5.png","img/myOwn/5찬/5_밥/오곡밥_5.png"));
		
		System.out.println(riceList);
		
		
		ArrayList<Img> mainList = new ArrayList<Img>();
		
		mainList.add(new Img(1, "갈치구이","갈치구이_6.png","img/myOwn/5찬/6_메인/갈치구이_6.png"));
		mainList.add(new Img(2, "낙지볶음","낙지볶음_6.png","img/myOwn/5찬/6_메인/낙지볶음_6.png"));
		mainList.add(new Img(3, "닭갈비","닭갈비_6.png","img/myOwn/5찬/6_메인/닭갈비_6.png"));
		mainList.add(new Img(4, "닭강정","닭강정_6.png","img/myOwn/5찬/6_메인/닭강정_6.png"));
		mainList.add(new Img(5, "등심돈까스","등심돈까스_6.png","img/myOwn/5찬/6_메인/등심돈까스_6.png"));
		mainList.add(new Img(6, "돼지갈비","돼지갈비_6.png","img/myOwn/5찬/6_메인/돼지갈비_6.png"));
		mainList.add(new Img(7, "돼지고기볶음","돼지고기볶음_6.png","img/myOwn/5찬/6_메인/돼지고기볶음_6.png"));
		mainList.add(new Img(8, "떡갈비","떡갈비_6.png","img/myOwn/5찬/6_메인/떡갈비_6.png"));
		mainList.add(new Img(9, "매운갈비찜","매운갈비찜_6.png","img/myOwn/5찬/6_메인/매운갈비찜_6.png"));
		mainList.add(new Img(10, "생선까스","생선까스_6.png","img/myOwn/5찬/6_메인/생선까스_6.png"));
		mainList.add(new Img(11, "소불고기","소불고기_6.png","img/myOwn/5찬/6_메인/소불고기_6.png"));
		mainList.add(new Img(12, "소세지볶음","소세지볶음_6.png","img/myOwn/5찬/6_메인/소세지볶음_6.png"));
		
		ArrayList<Img> sub1List = new ArrayList<Img>();
		
		sub1List.add(new Img(1,"감자볶음","감자볶음_7.png","img/myOwn/5찬/7_서브1/감자볶음_7.png"));
		sub1List.add(new Img(2,"건새우볶음","건새우볶음_7.png","img/myOwn/5찬/7_서브1/건새우볶음_7.png"));
		sub1List.add(new Img(3,"고사리나물","고사리나물_7.png","img/myOwn/5찬/7_서브1/고사리나물_7.png"));
		sub1List.add(new Img(4,"깻잎나물볶음","깻잎나물볶음_7.png","img/myOwn/5찬/7_서브1/깻잎나물볶음_7.png"));
		sub1List.add(new Img(5,"느티버섯","느티버섯_7.png","img/myOwn/5찬/7_서브1/느티버섯_7.png"));
		sub1List.add(new Img(6,"도토리묵","도토리묵_7.png","img/myOwn/5찬/7_서브1/도토리묵_7.png"));
		sub1List.add(new Img(7,"멸치풋고추볶음","멸치풋고추볶음_7.png","img/myOwn/5찬/7_서브1/멸치풋고추볶음_7.png"));
		sub1List.add(new Img(8,"미나리나물","미나리나물_7.png","img/myOwn/5찬/7_서브1/미나리나물_7.png"));
		sub1List.add(new Img(9,"소고기메추리알장조림","소고기메추리알장조림_7.png","img/myOwn/5찬/7_서브1/소고기메추리알장조림_7.png"));
		sub1List.add(new Img(10,"숙주나물","숙주나물_7.png","img/myOwn/5찬/7_서브1/숙주나물_7.png"));
		sub1List.add(new Img(11,"연근조림","연근조림_7.png","img/myOwn/5찬/7_서브1/연근조림_7.png"));
		sub1List.add(new Img(12,"콩나물","콩나물_7.png","img/myOwn/5찬/7_서브1/콩나물_7.png"));
		sub1List.add(new Img(13,"콩조림","콩조림_7.png","img/myOwn/5찬/7_서브1/콩조림_7.png"));
		sub1List.add(new Img(14,"파무침","파무침_7.png","img/myOwn/5찬/7_서브1/파무침_7.png"));
		
		
		
		ArrayList<Img> sub2List = new ArrayList<Img>();
		
		sub2List.add(new Img(1,"김치볶음","김치볶음_8.png","img/myOwn/5찬/8_서브2/김치볶음_8.png"));
		sub2List.add(new Img(2,"깍두기","깍두기_8.png","img/myOwn/5찬/8_서브2/깍두기_8.png"));
		sub2List.add(new Img(3,"무말랭이무침","무말랭이무침_8.png","img/myOwn/5찬/8_서브2/무말랭이무침_8.png"));
		sub2List.add(new Img(4,"미역초무침","미역초무침_8.png","img/myOwn/5찬/8_서브2/미역초무침_8.png"));
		sub2List.add(new Img(5,"배추김치","배추김치_8.png","img/myOwn/5찬/8_서브2/배추김치_8.png"));
		sub2List.add(new Img(6,"시금치나물","시금치나물_8.png","img/myOwn/5찬/8_서브2/시금치나물_8.png"));
		sub2List.add(new Img(7,"열무김치","열무김치_8.png","img/myOwn/5찬/8_서브2/열무김치_8.png"));
		sub2List.add(new Img(8,"오이소박이","오이소박이_8.png","img/myOwn/5찬/8_서브2/오이소박이_8.png"));
		
		
		
		
		ArrayList<Img> soupList = new ArrayList<Img>();
		
		soupList.add(new Img(1,"김치볶음","김치볶음_3.png","img/myOwn/5찬/9_수프/김치국_9.png"));
		soupList.add(new Img(2,"깍두기","깍두기_3.png","img/myOwn/5찬/9_수프/된장국_9.png"));
		soupList.add(new Img(3,"무말랭이무침","무말랭이무침_3.png","img/myOwn/5찬/9_수프/미역국_9.png"));
		soupList.add(new Img(4,"미역초무침","미역초무침_3.png","img/myOwn/5찬/9_수프/콩나물국_9.png"));
		
		mv.addObject("riceList", riceList);
		mv.addObject("mainList", mainList);
		mv.addObject("sub1List", sub1List);
		mv.addObject("sub2List", sub2List);
		mv.addObject("soupList", soupList);
		mv.setViewName("myOwn/myOwn5");
		
		return mv;
	}
	
	
	@RequestMapping("myOwnInsert.do")
	public ModelAndView myOwnInsert(ModelAndView mv,
									@RequestParam("selectedRice") String rice,
									@RequestParam("selectedSoup") String soup,
									@RequestParam("selectedMain") String main,
									@RequestParam("selectedSub1") String sub1,
									@RequestParam("selectedSub2") String sub2) {
		System.out.println("Controller > myOwnInsert()");
		
		System.out.println("rice : " + rice + " soup : " + soup + " main : " + main + " sub1 : " + sub1 + " sub2 : " + sub2);
		
		
		return null;
	}
	
}
