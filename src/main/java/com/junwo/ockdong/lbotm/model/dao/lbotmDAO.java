package com.junwo.ockdong.lbotm.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.lbotm.model.exception.lbotmException;
import com.junwo.ockdong.lbotm.model.vo.lbotm;

@Repository("lbotmDAO")
public class lbotmDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int selectBoardListCount(int ct_Id) {
		return sqlSession.selectOne("lbotmMapper.selectBoardListCount", ct_Id);
	}

	public ArrayList<lbotm> selectHomeList(PageInfo info, int ct_Id) throws lbotmException {
		ArrayList<lbotm> list = null;
		
		int offset = (info.getCurrentPage() - 1) * info.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, info.getLimit());
		
		list = (ArrayList) sqlSession.selectList("lbotmMapper.selectHomeList", ct_Id, rowBounds);
		
		if(list == null) {
			sqlSession.close();
			throw new lbotmException("조회 실패");
		}
		return list;
	}
	
}
