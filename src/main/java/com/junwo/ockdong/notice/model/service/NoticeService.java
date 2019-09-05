package com.junwo.ockdong.notice.model.service;

import java.util.ArrayList;

import com.junwo.ockdong.notice.model.vo.Notice;
import com.junwo.ockdong.notice.model.vo.PageInfo;

public interface NoticeService {

	int getListCount();

	ArrayList<Notice> selectList(PageInfo pi);
	
}
