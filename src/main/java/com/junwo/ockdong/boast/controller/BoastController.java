package com.junwo.ockdong.boast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoastController {
//	public ModelAndView boastList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
	@RequestMapping("blist.do")
	public String boastList() {
		return "boast/boastList";
	}

}