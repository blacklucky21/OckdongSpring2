package com.junwo.ockdong.product.model.vo;

import java.sql.Date;

public class Productreview {
	private int pv_Id; // 시퀀스 댓글 번호
	private int p_Id; // 게시판 번호
	private String pv_user; // 작성자
	private String pv_reviewContent; // 댓글 내용
	private String pv_createDate; // 생성 날짜
	private Date pv_updateDate; // 수정 날짜
	private String status; // 삭제 여부
	private int pv_parent; // 부모 댓글
	private int pv_level; // 댓글  - 답변글 깊이
	public int getPv_Id() {
		return pv_Id;
	}
	public void setPv_Id(int pv_Id) {
		this.pv_Id = pv_Id;
	}
	public int getP_Id() {
		return p_Id;
	}
	public void setP_Id(int p_Id) {
		this.p_Id = p_Id;
	}
	public String getPv_user() {
		return pv_user;
	}
	public void setPv_user(String pv_user) {
		this.pv_user = pv_user;
	}
	public String getPv_reviewContent() {
		return pv_reviewContent;
	}
	public void setPv_reviewContent(String pv_reviewContent) {
		this.pv_reviewContent = pv_reviewContent;
	}
	public String getPv_createDate() {
		return pv_createDate;
	}
	public void setPv_createDate(String pv_createDate) {
		this.pv_createDate = pv_createDate;
	}
	public Date getPv_updateDate() {
		return pv_updateDate;
	}
	public void setPv_updateDate(Date pv_updateDate) {
		this.pv_updateDate = pv_updateDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPv_parent() {
		return pv_parent;
	}
	public void setPv_parent(int pv_parent) {
		this.pv_parent = pv_parent;
	}
	public int getPv_level() {
		return pv_level;
	}
	public void setPv_level(int pv_level) {
		this.pv_level = pv_level;
	}
	public Productreview(int pv_Id, int p_Id, String pv_user, String pv_reviewContent, String pv_createDate,
	        Date pv_updateDate, String status, int pv_parent, int pv_level) {
		super();
		this.pv_Id = pv_Id;
		this.p_Id = p_Id;
		this.pv_user = pv_user;
		this.pv_reviewContent = pv_reviewContent;
		this.pv_createDate = pv_createDate;
		this.pv_updateDate = pv_updateDate;
		this.status = status;
		this.pv_parent = pv_parent;
		this.pv_level = pv_level;
	}
	public Productreview() {
		super();
	}
	@Override
	public String toString() {
		return "Productreview [pv_Id=" + pv_Id + ", p_Id=" + p_Id + ", pv_user=" + pv_user + ", pv_reviewContent="
		        + pv_reviewContent + ", pv_createDate=" + pv_createDate + ", pv_updateDate=" + pv_updateDate
		        + ", status=" + status + ", pv_parent=" + pv_parent + ", pv_level=" + pv_level + "]";
	}
	
	
	
}
