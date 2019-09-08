package com.junwo.ockdong.product.model.vo;

import java.sql.Date;

public class PictureList {
	private int pt_Id; // 사진 번호 시퀀스
	private String pt_realPath; // 사진 경로
	private String pt_naem; // 사진 이름 즉 변경할 이름 저장할 이름
	private String pt_realName; // 실제 사진명
	private Date pt_createDate; // 생성 날짜
	private Date pt_updateDate; // 수정 날짜
	private int p_Id; // 왜래키 상품 번호
	private String pt_status;
	private int pt_type; // 메인인지 구분
	
	public int getPt_Id() {
		return pt_Id;
	}
	public void setPt_Id(int pt_Id) {
		this.pt_Id = pt_Id;
	}
	public String getPt_realPath() {
		return pt_realPath;
	}
	public void setPt_realPath(String pt_realPath) {
		this.pt_realPath = pt_realPath;
	}
	public String getPt_naem() {
		return pt_naem;
	}
	public void setPt_naem(String pt_naem) {
		this.pt_naem = pt_naem;
	}
	public String getPt_realName() {
		return pt_realName;
	}
	public void setPt_realName(String pt_realName) {
		this.pt_realName = pt_realName;
	}
	public Date getPt_createDate() {
		return pt_createDate;
	}
	public void setPt_createDate(Date pt_createDate) {
		this.pt_createDate = pt_createDate;
	}
	public Date getPt_updateDate() {
		return pt_updateDate;
	}
	public void setPt_updateDate(Date pt_updateDate) {
		this.pt_updateDate = pt_updateDate;
	}
	public int getP_Id() {
		return p_Id;
	}
	public void setP_Id(int p_Id) {
		this.p_Id = p_Id;
	}
	public int getPt_type() {
		return pt_type;
	}
	public void setPt_type(int pt_type) {
		this.pt_type = pt_type;
	}
	public String getPt_status() {
		return pt_status;
	}
	public void setPt_status(String pt_status) {
		this.pt_status = pt_status;
	}
	
	public PictureList() {
		super();
	}
	public PictureList(int pt_Id, String pt_realPath, String pt_naem, String pt_realName, Date pt_createDate,
			Date pt_updateDate, int p_Id, int pt_type, String pt_status) {
		super();
		this.pt_Id = pt_Id;
		this.pt_realPath = pt_realPath;
		this.pt_naem = pt_naem;
		this.pt_realName = pt_realName;
		this.pt_createDate = pt_createDate;
		this.pt_updateDate = pt_updateDate;
		this.p_Id = p_Id;
		this.pt_type = pt_type;
		this.pt_status = pt_status;
	}

	
	
}
