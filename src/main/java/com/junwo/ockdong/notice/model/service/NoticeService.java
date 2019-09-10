package com.junwo.ockdong.notice.model.service;

import java.util.ArrayList;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.notice.model.vo.Notice;

public interface NoticeService {

	int getListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	void addReadCount(int nNo);

	Notice selectNotice(int nNo);

}
