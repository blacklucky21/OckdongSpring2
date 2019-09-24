package com.junwo.ockdong.lbotm.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.lbotm.model.exception.lbotmException;
import com.junwo.ockdong.lbotm.model.vo.lbotm;
import com.junwo.ockdong.lbotm.model.vo.lbotmComments;
import com.junwo.ockdong.notice.model.vo.Notice;

@Repository("lbotmDAO")
public class lbotmDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("lbotmMapper.getListCount");
	}

	public ArrayList<lbotm> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("lbotmMapper.selectList", null, rowBounds);
	}

	public void addReadCount(int bNo) {
		sqlSession.selectOne("lbotmMapper.updateCount", bNo);
	}

	public lbotm selectlbotm(int bNo) {
		return sqlSession.selectOne("lbotmMapper.selectOne", bNo);
	}
	
	public int lbotminsert(lbotm l) {
		return sqlSession.insert("lbotmMapper.lbotminsert", l);
	}

	public int deletelbotm(int bNo) {
		return sqlSession.update("lbotmMapper.deletelbotm", bNo);
	}
	
	public lbotm updatelbotmPage(int bNo) {
		return sqlSession.selectOne("lbotmMapper.updatelbtomPage", bNo);
	}

	public int updatelbotm(lbotm l) {
		return sqlSession.update("lbotmMapper.updatelbotm", l) ;
	}

	public ArrayList<lbotm> lbotmTop() {
		return (ArrayList)sqlSession.selectList("lbotmMapper.lbotmTop");
	}

	public ArrayList<lbotmComments> lbotmselectCommentList(int bNo) {
		return (ArrayList)sqlSession.selectList("lbotmMapper.lbotmselectCommentList", bNo);
	}
	
	public int lbotminsertComment(lbotmComments lc) {
		return sqlSession.insert("lbotmMapper.lbotminsertComment", lc);
	}

	public int lbotmdeleteComment(int cNo) {
		return sqlSession.update("lbotmMapper.lbotmdeleteComment", cNo);
	}

	public int lbotmupdateComnent(lbotmComments lc) {
		return sqlSession.update("lbotmMapper.lbtomupdateComment", lc);
	}

	
}
