package com.junwo.ockdong.lbotm.model.service;

import java.util.ArrayList;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.lbotm.model.exception.lbotmException;
import com.junwo.ockdong.lbotm.model.vo.lbotm;

public interface lbotmService {
	
	// 게시글 페이징 처리
	int selectBoardListCount(int ct_Id);

	// 게시글 조회
	ArrayList<lbotm> selectHomeList(PageInfo info, int ct_Id) throws lbotmException;

}
