package com.junwo.ockdong.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("nlist.do")
	public String noticelist() {
		return "notice/noticeList";
	}

}
