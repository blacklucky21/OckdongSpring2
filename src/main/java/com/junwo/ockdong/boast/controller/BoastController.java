package com.junwo.ockdong.boast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BoastController {
	
	@RequestMapping("blist.do")
//	public ModelAndView boastList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
	public String boastList() {
		
		return "boast/boastListView";
	}

}
