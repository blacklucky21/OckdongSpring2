package com.junwo.ockdong.lbotm.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.lbotm.model.dao.lbotmDAO;
import com.junwo.ockdong.lbotm.model.vo.lbotm;

@Service("lbotmServie")
public class lbotmServicelmpl implements lbotmService {

	@Autowired
	lbotmDAO lbotmDAO;

	@Override
	public int getListCount() {
		return lbotmDAO.getListCount();
	}

	@Override
	public ArrayList<lbotm> selectList(PageInfo pi) {
		return lbotmDAO.selectList(pi);
	}

	@Override
	public void addReadCount(int bNo) {
		lbotmDAO.addReadCount(bNo);
	}

	@Override
	public lbotm selectlbotm(int bNo) {
		return lbotmDAO.selectlbotm(bNo);
	}

	@Override
	public int lbotminsert(lbotm l) {
		return lbotmDAO.lbotminsert(l);
	}

	@Override
	public int deletelbotm(int bNo) {
		return lbotmDAO.deletelbotm(bNo);
	}

	@Override
	public int updatelbtom(lbotm l) {
		return lbotmDAO.updatelbotm(l);
	}

}