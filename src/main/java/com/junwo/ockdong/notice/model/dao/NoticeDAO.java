package com.junwo.ockdong.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.SearchCondition;
import com.junwo.ockdong.notice.model.exception.NoticeException;
import com.junwo.ockdong.notice.model.vo.Notice;

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

	public void create(Notice n) throws NoticeException {
		sqlSession.insert("noticeMapper.insertBoard", n);
	}

	public int insertNotice(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int deleteNotice(int nNo) throws NoticeException {
		return sqlSession.delete("noticeMapper.deleteNotice", nNo);
	}

	public Notice updateNoticePage(int nNo) {
		return sqlSession.selectOne("noticeMapper.updateNoticePage", nNo);
	}

	public int updateNotice(Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int searchBoardCount(SearchCondition sc) throws NoticeException {
		return sqlSession.selectOne("noticeMapper.searchBoardCount", sc);
	}

	public List<HashMap<String, Object>> searchList(SearchCondition sc, PageInfo info) {
		
		List<HashMap<String, Object>> list = null;
		
		int offset = (info.getCurrentPage() - 1) * info.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, info.getLimit());
		
		list = sqlSession.selectList("noticeMapper.searchBoardList", sc, rowBounds);
		
		return list;
	}
	

}
