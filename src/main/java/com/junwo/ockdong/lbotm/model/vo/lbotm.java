package com.junwo.ockdong.lbotm.model.vo;

import java.sql.Date;

public class lbotm {
	private int bNo;
	private int pt_Id;
	private String userId;
	private String b_Title;
	private String b_Content;
	private String b_Nickname;
	private Date b_Createdate;
	private Date bModifydate;
	private int b_Count;
	private int ct_Id;
	private String b_Src;
	private String b_Status;
	
	//파일 관련 추가해야함
	private int files_no; //파일번호
	private int f_reference_no; //참조번호
	private String files_title;//파일 제목
	private String files_change_title;//변경 파일 제목
	private int files_type; //파일유형. 썸네일 4번
	private String files_root; //파일 경로
	private int files_secession; //파일 삭제여부
	
	public lbotm() {}

	public lbotm(int bNo, int pt_Id, String userId, String b_Title, String b_Content, String b_Nickname,
			Date b_Createdate, Date bModifydate, int b_Count, int ct_Id, String b_Src, String b_Status, int files_no,
			int f_reference_no, String files_title, String files_change_title, int files_type, String files_root,
			int files_secession) {
		super();
		this.bNo = bNo;
		this.pt_Id = pt_Id;
		this.userId = userId;
		this.b_Title = b_Title;
		this.b_Content = b_Content;
		this.b_Nickname = b_Nickname;
		this.b_Createdate = b_Createdate;
		this.bModifydate = bModifydate;
		this.b_Count = b_Count;
		this.ct_Id = ct_Id;
		this.b_Src = b_Src;
		this.b_Status = b_Status;
		this.files_no = files_no;
		this.f_reference_no = f_reference_no;
		this.files_title = files_title;
		this.files_change_title = files_change_title;
		this.files_type = files_type;
		this.files_root = files_root;
		this.files_secession = files_secession;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getPt_Id() {
		return pt_Id;
	}

	public void setPt_Id(int pt_Id) {
		this.pt_Id = pt_Id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getB_Title() {
		return b_Title;
	}

	public void setB_Title(String b_Title) {
		this.b_Title = b_Title;
	}

	public String getB_Content() {
		return b_Content;
	}

	public void setB_Content(String b_Content) {
		this.b_Content = b_Content;
	}

	public String getB_Nickname() {
		return b_Nickname;
	}

	public void setB_Nickname(String b_Nickname) {
		this.b_Nickname = b_Nickname;
	}

	public Date getB_Createdate() {
		return b_Createdate;
	}

	public void setB_Createdate(Date b_Createdate) {
		this.b_Createdate = b_Createdate;
	}

	public Date getbModifydate() {
		return bModifydate;
	}

	public void setbModifydate(Date bModifydate) {
		this.bModifydate = bModifydate;
	}

	public int getB_Count() {
		return b_Count;
	}

	public void setB_Count(int b_Count) {
		this.b_Count = b_Count;
	}

	public int getCt_Id() {
		return ct_Id;
	}

	public void setCt_Id(int ct_Id) {
		this.ct_Id = ct_Id;
	}

	public String getB_Src() {
		return b_Src;
	}

	public void setB_Src(String b_Src) {
		this.b_Src = b_Src;
	}

	public String getB_Status() {
		return b_Status;
	}

	public void setB_Status(String b_Status) {
		this.b_Status = b_Status;
	}

	public int getFiles_no() {
		return files_no;
	}

	public void setFiles_no(int files_no) {
		this.files_no = files_no;
	}

	public int getF_reference_no() {
		return f_reference_no;
	}

	public void setF_reference_no(int f_reference_no) {
		this.f_reference_no = f_reference_no;
	}

	public String getFiles_title() {
		return files_title;
	}

	public void setFiles_title(String files_title) {
		this.files_title = files_title;
	}

	public String getFiles_change_title() {
		return files_change_title;
	}

	public void setFiles_change_title(String files_change_title) {
		this.files_change_title = files_change_title;
	}

	public int getFiles_type() {
		return files_type;
	}

	public void setFiles_type(int files_type) {
		this.files_type = files_type;
	}

	public String getFiles_root() {
		return files_root;
	}

	public void setFiles_root(String files_root) {
		this.files_root = files_root;
	}

	public int getFiles_secession() {
		return files_secession;
	}

	public void setFiles_secession(int files_secession) {
		this.files_secession = files_secession;
	}

	@Override
	public String toString() {
		return "lbotm [bNo=" + bNo + ", pt_Id=" + pt_Id + ", userId=" + userId + ", b_Title=" + b_Title + ", b_Content="
				+ b_Content + ", b_Nickname=" + b_Nickname + ", b_Createdate=" + b_Createdate + ", bModifydate="
				+ bModifydate + ", b_Count=" + b_Count + ", ct_Id=" + ct_Id + ", b_Src=" + b_Src + ", b_Status="
				+ b_Status + ", files_no=" + files_no + ", f_reference_no=" + f_reference_no + ", files_title="
				+ files_title + ", files_change_title=" + files_change_title + ", files_type=" + files_type
				+ ", files_root=" + files_root + ", files_secession=" + files_secession + "]";
	}
	
}
