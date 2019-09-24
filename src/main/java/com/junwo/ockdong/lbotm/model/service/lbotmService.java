package com.junwo.ockdong.lbotm.model.service;

import java.util.ArrayList;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.lbotm.model.exception.lbotmException;
import com.junwo.ockdong.lbotm.model.vo.lbotm;
import com.junwo.ockdong.lbotm.model.vo.lbotmComments;
import com.junwo.ockdong.notice.model.vo.Notice;
import com.junwo.ockdong.notice.model.vo.NoticeComments;

public interface lbotmService {
	
	int getListCount();

	ArrayList<lbotm> selectList(PageInfo pi);

	void addReadCount(int bNo);

	lbotm selectlbotm(int bNo);

	int lbotminsert(lbotm l);

	int deletelbotm(int bNo);

	int updatelbtom(lbotm l);

	ArrayList<lbotm> lbotmTop();

	ArrayList<lbotmComments> lbotmselectCommentList(int bNo);
	
	int lbotminsertComment(lbotmComments lc);
	
	int lbotmdeleteComment(int cNo);
	
	int lbotmupdateComment(lbotmComments lc);




}
