package com.junwo.ockdong.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.notice.model.dao.NoticeDAO;
import com.junwo.ockdong.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDAO nDAO;

	@Override
	public int getListCount() {
		return nDAO.getListCount();
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDAO.selectList(pi);
	}

	@Override
	public void addReadCount(int nNo) {
		nDAO.addReadCount(nNo);
	}

	@Override
	public Notice selectNotice(int nNo) {
		return nDAO.selectNotice(nNo);
	}
	

}
