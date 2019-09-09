package com.junwo.ockdong.cart.model.vo;

import java.sql.Date;

public class Payment {
	
	private int payno;
	private String userid;
	private int p_id;
	private String payname;
	private String payemail;
	private int payamount;
	private int payprice;
	private Date paydate;
	private String payrecipe;
	private String payaddress;
	private String payadname;
	private int paynumber;
	private String paycontent;
	private String pstatus;
	
	public Payment() {};
	
	
	public Payment(int payno, String userid, int p_id, String payname, String payemail, int payamount, int payprice,
			Date paydate, String payrecipe, String payaddress, String payadname, int paynumber, String paycontent,
			String pstatus) {
		super();
		this.payno = payno;
		this.userid = userid;
		this.p_id = p_id;
		this.payname = payname;
		this.payemail = payemail;
		this.payamount = payamount;
		this.payprice = payprice;
		this.paydate = paydate;
		this.payrecipe = payrecipe;
		this.payaddress = payaddress;
		this.payadname = payadname;
		this.paynumber = paynumber;
		this.paycontent = paycontent;
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


	public String getPayemail() {
		return payemail;
	}


	public void setPayemail(String payemail) {
		this.payemail = payemail;
	}


	public int getPayamount() {
		return payamount;
	}


	public void setPayamount(int payamount) {
		this.payamount = payamount;
	}


	public int getPayprice() {
		return payprice;
	}


	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}


	public Date getPaydate() {
		return paydate;
	}


	public void setPaydate(Date paydate) {
		this.paydate = paydate;
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


	public String getPayadname() {
		return payadname;
	}


	public void setPayadname(String payadname) {
		this.payadname = payadname;
	}


	public int getPaynumber() {
		return paynumber;
	}


	public void setPaynumber(int paynumber) {
		this.paynumber = paynumber;
	}


	public String getPaycontent() {
		return paycontent;
	}


	public void setPaycontent(String paycontent) {
		this.paycontent = paycontent;
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
				+ ", payemail=" + payemail + ", payamount=" + payamount + ", payprice=" + payprice + ", paydate="
				+ paydate + ", payrecipe=" + payrecipe + ", payaddress=" + payaddress + ", payadname=" + payadname
				+ ", paynumber=" + paynumber + ", paycontent=" + paycontent + ", pstatus=" + pstatus + "]";
	}
	
	
	
	
}
