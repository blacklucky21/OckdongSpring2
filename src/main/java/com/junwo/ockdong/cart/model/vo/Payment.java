package com.junwo.ockdong.cart.model.vo;

import java.sql.Date;

public class Payment {
	
	private int payno;
	private String userid;
	private int p_id;
	private String payname;
	private String payphone;
	private String paycellphone;
	private String payemail;
	private String receiverName;
	private String receiverPhone;
	private String receiverCellPhone;
	private int payprice;
	private String orderMemo;
	private Date paydate;
	private String delivaryDate;
	private String payrecipe;
	private String payaddress;
	private String pstatus;
	
	
	public Payment() {}

	public Payment(int payno, String userid, int p_id, String payname, String payphone, String paycellphone,
			String payemail, String receiverName, String receiverPhone, String receiverCellPhone, int payprice,
			String orderMemo, Date paydate, String delivaryDate, String payrecipe, String payaddress, String pstatus) {
		super();
		this.payno = payno;
		this.userid = userid;
		this.p_id = p_id;
		this.payname = payname;
		this.payphone = payphone;
		this.paycellphone = paycellphone;
		this.payemail = payemail;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.receiverCellPhone = receiverCellPhone;
		this.payprice = payprice;
		this.orderMemo = orderMemo;
		this.paydate = paydate;
		this.delivaryDate = delivaryDate;
		this.payrecipe = payrecipe;
		this.payaddress = payaddress;
		this.pstatus = pstatus;
	}

	public int getPayno() {
		return payno;
	}

	public void setPayno(int payno) {
		this.payno = payno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getPayname() {
		return payname;
	}

	public void setPayname(String payname) {
		this.payname = payname;
	}

	public String getPayphone() {
		return payphone;
	}

	public void setPayphone(String payphone) {
		this.payphone = payphone;
	}

	public String getPaycellphone() {
		return paycellphone;
	}

	public void setPaycellphone(String paycellphone) {
		this.paycellphone = paycellphone;
	}

	public String getPayemail() {
		return payemail;
	}

	public void setPayemail(String payemail) {
		this.payemail = payemail;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getReceiverCellPhone() {
		return receiverCellPhone;
	}

	public void setReceiverCellPhone(String receiverCellPhone) {
		this.receiverCellPhone = receiverCellPhone;
	}

	public int getPayprice() {
		return payprice;
	}

	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}

	public String getOrderMemo() {
		return orderMemo;
	}

	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public String getDelivaryDate() {
		return delivaryDate;
	}

	public void setDelivaryDate(String delivaryDate) {
		this.delivaryDate = delivaryDate;
	}

	public String getPayrecipe() {
		return payrecipe;
	}

	public void setPayrecipe(String payrecipe) {
		this.payrecipe = payrecipe;
	}

	public String getPayaddress() {
		return payaddress;
	}

	public void setPayaddress(String payaddress) {
		this.payaddress = payaddress;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	@Override
	public String toString() {
		return "Payment [payno=" + payno + ", userid=" + userid + ", p_id=" + p_id + ", payname=" + payname
				+ ", payphone=" + payphone + ", paycellphone=" + paycellphone + ", payemail=" + payemail
				+ ", receiverName=" + receiverName + ", receiverPhone=" + receiverPhone + ", receiverCellPhone="
				+ receiverCellPhone + ", payprice=" + payprice + ", orderMemo=" + orderMemo + ", paydate=" + paydate
				+ ", delivaryDate=" + delivaryDate + ", payrecipe=" + payrecipe + ", payaddress=" + payaddress
				+ ", pstatus=" + pstatus + "]";
	}

	
	
	
	
}
	
	