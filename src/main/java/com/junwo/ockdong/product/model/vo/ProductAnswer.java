package com.junwo.ockdong.product.model.vo;

public class ProductAnswer {
	private int qna_Id;
	private String qna_user;
	private String qna_createdate;
	private String qna_content;
	private String answer_content;
	private String answer_createdate;
	private int p_Id; // 게시판 번호
	private int answer_Id;
	
	public ProductAnswer() {}

	public ProductAnswer(int qna_id, String qna_user, String qna_createdate, String qna_content, String answer_content,
	        String answer_createdate, int p_Id, int answer_Id) {
		super();
		this.qna_Id = qna_id;
		this.qna_user = qna_user;
		this.qna_createdate = qna_createdate;
		this.qna_content = qna_content;
		this.answer_content = answer_content;
		this.answer_createdate = answer_createdate;
		this.p_Id = p_Id;
	}

	

	public int getAnswer_Id() {
		return answer_Id;
	}

	public void setAnswer_Id(int answer_Id) {
		this.answer_Id = answer_Id;
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

	public String getQna_createdate() {
		return qna_createdate;
	}

	public void setQna_createdate(String qna_createdate) {
		this.qna_createdate = qna_createdate;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public String getAnswer_createdate() {
		return answer_createdate;
	}

	public void setAnswer_createdate(String answer_createdate) {
		this.answer_createdate = answer_createdate;
	}

	public int getP_Id() {
		return p_Id;
	}

	public void setP_Id(int p_Id) {
		this.p_Id = p_Id;
	}

	@Override
	public String toString() {
		return "ProductAnswer [qna_Id=" + qna_Id + ", qna_user=" + qna_user + ", qna_createdate=" + qna_createdate
		        + ", qna_content=" + qna_content + ", answer_content=" + answer_content + ", answer_createdate="
		        + answer_createdate + ", p_Id=" + p_Id + ", answer_Id=" + answer_Id + "]";
	}

	
	
	
}



//package com.junwo.ockdong.product.model.vo;
//
//public class ProductAnswer {
//	private int answer_Id; // 시퀀스 번호
//	private String answer_name; // 답변자
//	private String answer_content; // 답변 내용
//	private String answer_createdate; // 답변 날짜
//	private int p_Id; // 게시판 번호
//	private int qna_Id; // 댓글 번호
//	
//	
//	
//	public int getAnswer_Id() {
//		return answer_Id;
//	}
//	public void setAnswer_Id(int answer_Id) {
//		this.answer_Id = answer_Id;
//	}
//	public String getAnswer_name() {
//		return answer_name;
//	}
//	public void setAnswer_name(String answer_name) {
//		this.answer_name = answer_name;
//	}
//	public String getAnswer_content() {
//		return answer_content;
//	}
//	public void setAnswer_content(String answer_content) {
//		this.answer_content = answer_content;
//	}
//	public String getAnswer_createdate() {
//		return answer_createdate;
//	}
//	public void setAnswer_createdate(String answer_createdate) {
//		this.answer_createdate = answer_createdate;
//	}
//	public int getP_Id() {
//		return p_Id;
//	}
//	public void setP_Id(int p_Id) {
//		this.p_Id = p_Id;
//	}
//	public int getQna_Id() {
//		return qna_Id;
//	}
//	public void setQna_Id(int qna_Id) {
//		this.qna_Id = qna_Id;
//	}
//	public ProductAnswer(int answer_Id, String answer_name, String answer_content, String answer_createdate, int p_Id,
//	        int qna_Id) {
//		super();
//		this.answer_Id = answer_Id;
//		this.answer_name = answer_name;
//		this.answer_content = answer_content;
//		this.answer_createdate = answer_createdate;
//		this.p_Id = p_Id;
//		this.qna_Id = qna_Id;
//	}
//	public ProductAnswer() {
//		super();
//	}
//	@Override
//	public String toString() {
//		return "ProductAnswer [answer_Id=" + answer_Id + ", answer_name=" + answer_name + ", answer_content="
//		        + answer_content + ", answer_createdate=" + answer_createdate + ", p_Id=" + p_Id + ", qna_Id=" + qna_Id
//		        + "]";
//	}
//	
//	
//	
//	
//}
