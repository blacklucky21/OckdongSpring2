package com.junwo.ockdong.product.model.vo;

/**
 * @author user2
 *
 */
public class ProductQna {
	private int qna_Id; // 문의 시퀀스 번호
	private String qna_user; // 작성자
	private String qna_content; // 문의 내용
	private String qna_createDate; // 작성날
	private int p_Id; // 게시판 번호
	private String p_title; // 제목
	private String p_lunchType; // 도시락 타입
	private String qna_status; // 글 삭제 여부
	private String qna_answer; // 답변 상태
	private String qna_secret; // 비밀 여부
	private String qna_answerDate; // 답변날
	private String answer_content; // 답변 내용
	private int answer_Id;
	
	
	public int getAnswer_Id() {
		return answer_Id;
	}
	public void setAnswer_Id(int answer_Id) {
		this.answer_Id = answer_Id;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public String getP_lunchType() {
		return p_lunchType;
	}
	public void setP_lunchType(String p_lunchType) {
		this.p_lunchType = p_lunchType;
	}
	public String getQna_answerDate() {
		return qna_answerDate;
	}
	public void setQna_answerDate(String qna_answerDate) {
		this.qna_answerDate = qna_answerDate;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
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
	public String getQna_createDate() {
		return qna_createDate;
	}
	public void setQna_createDate(String qna_createDate) {
		this.qna_createDate = qna_createDate;
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
	public String getQna_secret() {
		return qna_secret;
	}
	public void setQna_secret(String qna_secret) {
		this.qna_secret = qna_secret;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	
	public ProductQna(int qna_Id, String qna_user, String qna_content, String qna_createDate, int p_Id, String p_title,
	        String p_lunchType, String qna_status, String qna_answer, String qna_secret, String qna_answerDate,
	        String answer_content, int answer_Id) {
		super();
		this.qna_Id = qna_Id;
		this.qna_user = qna_user;
		this.qna_content = qna_content;
		this.qna_createDate = qna_createDate;
		this.p_Id = p_Id;
		this.p_title = p_title;
		this.p_lunchType = p_lunchType;
		this.qna_status = qna_status;
		this.qna_answer = qna_answer;
		this.qna_secret = qna_secret;
		this.qna_answerDate = qna_answerDate;
		this.answer_content = answer_content;
		this.answer_Id = answer_Id;
	}
	public ProductQna() {
		super();
	}
	@Override
	public String toString() {
		return "ProductQna [qna_Id=" + qna_Id + ", qna_user=" + qna_user + ", qna_content=" + qna_content
		        + ", qna_createDate=" + qna_createDate + ", p_Id=" + p_Id + ", p_title=" + p_title + ", p_lunchType="
		        + p_lunchType + ", qna_status=" + qna_status + ", qna_answer=" + qna_answer + ", qna_secret="
		        + qna_secret + ", qna_answerDate=" + qna_answerDate + ", answer_content=" + answer_content
		        + ", answer_Id=" + answer_Id + "]";
	}


	
	
	
	
}
