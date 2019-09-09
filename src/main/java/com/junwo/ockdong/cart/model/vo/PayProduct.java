package com.junwo.ockdong.cart.model.vo;

import java.sql.Date;

public class PayProduct {
	
	
	private int pno;
	private String pname;
	private int pamount;
	private int price;
	private Date pcreatedate;
	private String id;
	private int totalprice;
	
	
	public PayProduct() {};
	public PayProduct(int pno, String pname, int pamount, int price, Date pcreatedate, String id, int totalprice) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.pamount = pamount;
		this.price = price;
		this.pcreatedate = pcreatedate;
		this.id = id;
		this.totalprice = totalprice;
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
	public int getPamount() {
		return pamount;
	}
	public void setPamount(int pamount) {
		this.pamount = pamount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	@Override
	public String toString() {
		return "PayProduct [pno=" + pno + ", pname=" + pname + ", pamount=" + pamount + ", price=" + price
				+ ", pcreatedate=" + pcreatedate + ", id=" + id + ", totalprice=" + totalprice + "]";
	}
	
	
	

}
