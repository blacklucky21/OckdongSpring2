package com.junwo.ockdong.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nNo;
	private String id;
	private String nTitle;
	private String nContent;
	private int nCount;
	private String status;
	private Date nDate;
	private Date modifyDate;
	private String nickName;
	
	public Notice() {}

	public Notice(int nNo, String id, String nTitle, String nContent, int nCount, String status, Date nDate,
			Date modifyDate, String nickName) {
		super();
		this.nNo = nNo;
		this.id = id;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCount = nCount;
		this.status = status;
		this.nDate = nDate;
		this.modifyDate = modifyDate;
		this.nickName = nickName;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", id=" + id + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nCount="
				+ nCount + ", status=" + status + ", nDate=" + nDate + ", modifyDate=" + modifyDate + ", nickName="
				+ nickName + "]";
	}
	
}
