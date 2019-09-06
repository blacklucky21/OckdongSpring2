package com.junwo.ockdong.Product.model.vo;

import java.sql.Date;

public class Picturelist {
	private int pt_id;
	private String pt_name;
	private String pt_realname;
	private Date pt_createDate;
	private Date pt_updateDate;
	private int ct_id;
	private int p_id;
	public int getPt_id() {
		return pt_id;
	}
	public void setPt_id(int pt_id) {
		this.pt_id = pt_id;
	}
	public String getPt_name() {
		return pt_name;
	}
	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}
	public String getPt_realname() {
		return pt_realname;
	}
	public void setPt_realname(String pt_realname) {
		this.pt_realname = pt_realname;
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
	public int getCt_id() {
		return ct_id;
	}
	public void setCt_id(int ct_id) {
		this.ct_id = ct_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	
	
	
	public Picturelist() {
		super();
	}
	
	public Picturelist(int pt_id, String pt_name) {
		super();
		this.pt_id = pt_id;
		this.pt_name = pt_name;
	}
	
	
	
	public Picturelist(int pt_id, int ct_id) {
		super();
		this.pt_id = pt_id;
		this.ct_id = ct_id;
	}
	public Picturelist(int pt_id, String pt_name, String pt_realname, Date pt_createDate, Date pt_updateDate, int ct_id,
	        int p_id) {
		super();
		this.pt_id = pt_id;
		this.pt_name = pt_name;
		this.pt_realname = pt_realname;
		this.pt_createDate = pt_createDate;
		this.pt_updateDate = pt_updateDate;
		this.ct_id = ct_id;
		this.p_id = p_id;
	}
	
	
	
}
