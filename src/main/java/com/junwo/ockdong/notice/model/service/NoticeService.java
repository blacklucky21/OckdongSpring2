package com.junwo.ockdong.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.junwo.ockdong.common.PageInfo;
import com.junwo.ockdong.common.SearchCondition;
import com.junwo.ockdong.notice.model.exception.NoticeException;
import com.junwo.ockdong.notice.model.vo.Notice;
import com.junwo.ockdong.notice.model.vo.NoticeComments;

public interface NoticeService {

	int getListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	void addReadCount(int nNo);

	Notice selectNotice(int nNo);

	// 게시글 insert
	int insertNoitce(Notice n);

	// 게시글 delete
	int deleteNotice(int nNo) throws NoticeException;

	// 게시글 update
	int updateNotice(Notice n);

	// 게시글 검색 개수
	int searchBoardCount(SearchCondition sc);

	// 검색
	public List<HashMap<String, Object>> searchList(PageInfo info, SearchCondition sc);

	ArrayList<NoticeComments> selectCommentList(int nNo);
	
	// 댓글 insert
	int insertComment(NoticeComments nc);

	// 댓글 delete
	int deleteComment(int comments_no);

	int updateComent(NoticeComments nc);

	ArrayList<Notice> selectList2();



}
