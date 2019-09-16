package com.junwo.ockdong.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.SearchCondition;
import com.junwo.ockdong.notice.model.dao.NoticeDAO;
import com.junwo.ockdong.notice.model.exception.NoticeException;
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

	@Override
	public int insertNoitce(Notice n) {
		return nDAO.insertNotice(n);
	}

	@Override
	public int deleteNotice(int nNo) throws NoticeException {
		return nDAO.deleteNotice(nNo);
	}

	@Override
	public int updateNotice(Notice n) {
		return nDAO.updateNotice(n);
	}

	@Override
	public int searchBoardCount(SearchCondition sc) throws NoticeException {
		return nDAO.searchBoardCount(sc);
	}

	@Override
	public List<HashMap<String, Object>> searchList(PageInfo info, SearchCondition sc) {
		return nDAO.searchList(sc, info);
	}
	

}
