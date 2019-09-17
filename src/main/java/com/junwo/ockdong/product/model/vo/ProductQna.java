package com.junwo.ockdong.product.model.vo;

/**
 * @author user2
 *
 */
public class ProductQna {
	private int qna_Id; // 문의 시퀀스 번호
	private String qna_user; // 작성자
	private String qna_content; // 문의 내용
	private int qna_reref; // 글 그룹번호
	private int qna_relev; // 답변글 깊이
	private int qna_reno; // 답변글 순서
	private String qna_createDate; // 작성날
	private int qna_parent; // 부모글 번호
	private int p_Id; // 게시판 번호
	private String qna_status; // 글 삭제 여부
	public int getQna_Id() {
		return qna_Id;
	}
	public void setQna_Id(int qna_Id) {
		this.qna_Id = qna_Id;
	}
	public String getQna_user() {
		return qna_user;
	}
	public void setQna_user(String qna_user) {
		this.qna_user = qna_user;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_reref() {
		return qna_reref;
	}
	public void setQna_reref(int qna_reref) {
		this.qna_reref = qna_reref;
	}
	public int getQna_relev() {
		return qna_relev;
	}
	public void setQna_relev(int qna_relev) {
		this.qna_relev = qna_relev;
	}
	public int getQna_reno() {
		return qna_reno;
	}
	public void setQna_reno(int qna_reno) {
		this.qna_reno = qna_reno;
	}
	public String getQna_createDate() {
		return qna_createDate;
	}
	public void setQna_createDate(String qna_createDate) {
		this.qna_createDate = qna_createDate;
	}
	public int getQna_parent() {
		return qna_parent;
	}
	public void setQna_parent(int qna_parent) {
		this.qna_parent = qna_parent;
	}
	public int getP_Id() {
		return p_Id;
	}
	public void setP_Id(int p_Id) {
		this.p_Id = p_Id;
	}
	public String getQna_status() {
		return qna_status;
	}
	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	public ProductQna(int qna_Id, String qna_user, String qna_content, int qna_reref, int qna_relev, int qna_reno,
	        String qna_createDate, int qna_parent, int p_Id, String qna_status) {
		super();
		this.qna_Id = qna_Id;
		this.qna_user = qna_user;
		this.qna_content = qna_content;
		this.qna_reref = qna_reref;
		this.qna_relev = qna_relev;
		this.qna_reno = qna_reno;
		this.qna_createDate = qna_createDate;
		this.qna_parent = qna_parent;
		this.p_Id = p_Id;
		this.qna_status = qna_status;
	}
	public ProductQna() {
		super();
	}
	@Override
	public String toString() {
		return "ProductQna [qna_Id=" + qna_Id + ", qna_user=" + qna_user + ", qna_content=" + qna_content
		        + ", qna_reref=" + qna_reref + ", qna_relev=" + qna_relev + ", qna_reno=" + qna_reno
		        + ", qna_createDate=" + qna_createDate + ", qna_parent=" + qna_parent + ", p_Id=" + p_Id
		        + ", qna_status=" + qna_status + "]";
	}


}
