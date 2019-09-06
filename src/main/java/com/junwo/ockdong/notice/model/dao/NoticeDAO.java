package com.junwo.ockdong.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.notice.model.exception.NoticeException;
import com.junwo.ockdong.notice.model.vo.Notice;
import com.junwo.ockdong.notice.model.vo.PageInfo;

@Repository("nDAO")
public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public void addReadCount(int nNo) {
		sqlSession.update("noticeMapper.updateCount", nNo);
	}

	public Notice selectNotice(int nNo) {
		return sqlSession.selectOne("noticeMapper.selectOne", nNo);
	}

}
