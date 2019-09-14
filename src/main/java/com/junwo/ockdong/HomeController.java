package com.junwo.ockdong;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.junwo.ockdong.product.model.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	ProductService pService;
	@Autowired

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, @RequestParam(value = "page", required = false) ModelAndView mv,
							HttpServletRequest request, HttpServletResponse response) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		mv = new ModelAndView();
		
		/*
		 * ArrayList<Product> pList = pService.selectList8(1); // 판매중인 상품만 가지고 오기
		 * ArrayList<PictureList> pt = pService.selectList8(2); // 사진 리스트
		 * 
		 * System.out.println("===================== 메인 =======================");
		 * 
		 * for (int i = 0; i < pList.size(); i++) { System.out.println("pList 값 : " +
		 * pList.toString()); System.out.println("pt 값 : " + pt.toString());
		 * System.out.println("값 : ");
		 * 
		 * }
		 * 
		 * if (pList != null) { mv.addObject("pList", pList); mv.addObject("pt", pt); }
		 */
		 
		System.out.println("1");
		ArrayList pList = pService.selectList8(1); // 판매중인 상품만 가지고 오기 신제품
		ArrayList pList2 = pService.selectList8do(); // 도시락 8개
		ArrayList pList3 = pService.selectList8sal(); // 샐러드 8개
		
		System.out.println("===================== 메인 =======================");
		
		mv.addObject("pList", pList);
		mv.addObject("pList2",pList2);
		mv.addObject("pList3",pList3);
		
		mv.setViewName("Main");

		return mv;
	}

	
	
	
}
