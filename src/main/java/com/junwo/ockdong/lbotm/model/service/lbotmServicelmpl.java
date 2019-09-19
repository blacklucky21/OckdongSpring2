package com.junwo.ockdong.lbotm.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.lbotm.model.dao.lbotmDAO;
import com.junwo.ockdong.lbotm.model.exception.lbotmException;
import com.junwo.ockdong.lbotm.model.vo.lbotm;

@Service("lbotmServie")
public class lbotmServicelmpl implements lbotmService {

	@Autowired
	lbotmDAO lbotmDAO;

	@Override
	public int selectBoardListCount(int ct_Id) {
		return lbotmDAO.selectBoardListCount(ct_Id);
	}

	@Override
	public ArrayList<lbotm> selectHomeList(PageInfo info, int ct_Id) throws lbotmException {
		return lbotmDAO.selectHomeList(info, ct_Id);
	}
}
