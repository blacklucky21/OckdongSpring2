package com.junwo.ockdong.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.junwo.ockdong.notice.model.exception.NoticeException;
import com.junwo.ockdong.notice.model.vo.Notice;
import com.junwo.ockdong.notice.model.vo.PageInfo;

public interface NoticeService {

	int getListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	void addReadCount(int nNo);

	Notice selectNotice(int nNo);

}
