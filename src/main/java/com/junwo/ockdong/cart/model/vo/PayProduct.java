package com.junwo.ockdong.cart.model.vo;

import java.sql.Date;

public class PayProduct {
	
	
	private int pno;
	private String pname;
	private String ppno;
	private int pamount;
	private int pprice;
	private Date pcreatedate;
	private String id;
	private int totalprice;
	private String p_img;
	
	
	public PayProduct() {}


	public PayProduct(int pno, String pname, String ppno, int pamount, int pprice, Date pcreatedate, String id,
			int totalprice, String p_img) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.ppno = ppno;
		this.pamount = pamount;
		this.pprice = pprice;
		this.pcreatedate = pcreatedate;
		this.id = id;
		this.totalprice = totalprice;
		this.p_img = p_img;
	}


	public int getPno() {
		return pno;
	}


	public void setPno(int pno) {
		this.pno = pno;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getPpno() {
		return ppno;
	}


	public void setPpno(String ppno) {
		this.ppno = ppno;
	}


	public int getPamount() {
		return pamount;
	}


	public void setPamount(int pamount) {
		this.pamount = pamount;
	}


	public int getPprice() {
		return pprice;
	}


	public void setPprice(int pprice) {
		this.pprice = pprice;
	}


	public Date getPcreatedate() {
		return pcreatedate;
	}


	public void setPcreatedate(Date pcreatedate) {
		this.pcreatedate = pcreatedate;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}


	public String getP_img() {
		return p_img;
	}


	public void setP_img(String p_img) {
		this.p_img = p_img;
	}


	@Override
	public String toString() {
		return "PayProduct [pno=" + pno + ", pname=" + pname + ", ppno=" + ppno + ", pamount=" + pamount + ", pprice="
				+ pprice + ", pcreatedate=" + pcreatedate + ", id=" + id + ", totalprice=" + totalprice + ", p_img="
				+ p_img + "]";
	}



	}
