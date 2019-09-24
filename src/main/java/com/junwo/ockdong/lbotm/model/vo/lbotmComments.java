package com.junwo.ockdong.lbotm.model.vo;

import java.sql.Date;

public class lbotmComments {
	private int lbotm_No;
	private String lbotm_Content;
	private int bNo;
	private String userId;
	private Date lbotm_Date;
	private String lbotm_Status;
	private String nickName;
	
	public lbotmComments() {}

	public lbotmComments(int lbotm_No, String lbotm_Content, int bNo, String userId, Date lbotm_Date,
			String lbotm_Status, String nickName) {
		super();
		this.lbotm_No = lbotm_No;
		this.lbotm_Content = lbotm_Content;
		this.bNo = bNo;
		this.userId = userId;
		this.lbotm_Date = lbotm_Date;
		this.lbotm_Status = lbotm_Status;
		this.nickName = nickName;
	}

	public int getLbotm_No() {
		return lbotm_No;
	}

	public void setLbotm_No(int lbotm_No) {
		this.lbotm_No = lbotm_No;
	}

	public String getLbotm_Content() {
		return lbotm_Content;
	}

	public void setLbotm_Content(String lbotm_Content) {
		this.lbotm_Content = lbotm_Content;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getLbotm_Date() {
		return lbotm_Date;
	}

	public void setLbotm_Date(Date lbotm_Date) {
		this.lbotm_Date = lbotm_Date;
	}

	public String getLbotm_Status() {
		return lbotm_Status;
	}

	public void setLbotm_Status(String lbotm_Status) {
		this.lbotm_Status = lbotm_Status;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "lbotmComments [lbotm_No=" + lbotm_No + ", lbotm_Content=" + lbotm_Content + ", bNo=" + bNo + ", userId="
				+ userId + ", lbotm_Date=" + lbotm_Date + ", lbotm_Status=" + lbotm_Status + ", nickName=" + nickName
				+ "]";
	}
	
}
