package com.junwo.ockdong.cart.model.vo;

import java.sql.Date;

public class Cart {
	
	private int cNo;
	private String cName;
	private int cAmount;
	private int cPrice;
	private Date cCreateDate;
	private int p_id;
	private String id;
	
	public Cart() {}
	public Cart(int cNo, String cName, int cAmount, int cPrice, Date cCreateDate, int p_id, String id) {
		
		this.cNo = cNo;
		this.cName = cName;
		this.cAmount = cAmount;
		this.cPrice = cPrice;
		this.cCreateDate = cCreateDate;
		this.p_id = p_id;
		this.id = id;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getcAmount() {
		return cAmount;
	}
	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
	}
	public int getcPrice() {
		return cPrice;
	}
	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}
	public Date getcCreateDate() {
		return cCreateDate;
	}
	public void setcCreateDate(Date cCreateDate) {
		this.cCreateDate = cCreateDate;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	@Override
	public String toString() {
		return "cart [cNo=" + cNo + ", cName=" + cName + ", cAmount=" + cAmount + ", cPrice=" + cPrice
				+ ", cCreateDate=" + cCreateDate + ", p_id=" + p_id + ", id=" + id + "]";
	}
	
	

}
