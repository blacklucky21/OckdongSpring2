package com.junwo.ockdong.notice.model.vo;

import java.sql.Date;

public class NoticeComments {
	private int Comments_No; // 댓글 번호
	private String Comments_Content; // 댓글내용
	private int nNo; //참조게시글번호
	private String UserId; // 댓글 작성자 아이디
	private Date Comments_Date; // 댓글작성날짜
	private String NickName; // 닉네임
	private String Comments_Status; // 댓글상태값

	public NoticeComments() {
		super();
	}

	public NoticeComments(int comments_No, String comments_Content, int nNo, String userId, Date comments_Date,
			String nickName, String comments_Status) {
		super();
		Comments_No = comments_No;
		Comments_Content = comments_Content;
		this.nNo = nNo;
		UserId = userId;
		Comments_Date = comments_Date;
		NickName = nickName;
		Comments_Status = comments_Status;
	}

	public int getComments_No() {
		return Comments_No;
	}

	public void setComments_No(int comments_No) {
		Comments_No = comments_No;
	}

	public String getComments_Content() {
		return Comments_Content;
	}

	public void setComments_Content(String comments_Content) {
		Comments_Content = comments_Content;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public Date getComments_Date() {
		return Comments_Date;
	}

	public void setComments_Date(Date comments_Date) {
		Comments_Date = comments_Date;
	}

	public String getNickName() {
		return NickName;
	}

	public void setNickName(String nickName) {
		NickName = nickName;
	}

	public String getComments_Status() {
		return Comments_Status;
	}

	public void setComments_Status(String comments_Status) {
		Comments_Status = comments_Status;
	}

	@Override
	public String toString() {
		return "NoticeComments [Comments_No=" + Comments_No + ", Comments_Content=" + Comments_Content + ", nNo=" + nNo
				+ ", UserId=" + UserId + ", Comments_Date=" + Comments_Date + ", NickName=" + NickName
				+ ", Comments_Status=" + Comments_Status + "]";
	}
	
}