
package com.junwo.ockdong.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String userId;
	private String password;
	private String nickName;
	private String email;
	private String address;
	private String phone;
	private Date enroll_Date;
	private Date modify_Date;
	private String status;
	private String userName;
	private String mNum;
	
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String userId, String password, String nickName, String email, String address, String phone,
			Date enroll_Date, Date modify_Date, String status, String userName, String mNum) {
		super();
		this.userId = userId;
		this.password = password;
		this.nickName = nickName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.enroll_Date = enroll_Date;
		this.modify_Date = modify_Date;
		this.status = status;
		this.userName = userName;
		this.setmNum(mNum);
	}
	
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnroll_Date() {
		return enroll_Date;
	}

	public void setEnroll_Date(Date enroll_Date) {
		this.enroll_Date = enroll_Date;
	}

	public Date getModify_Date() {
		return modify_Date;
	}

	public void setModify_Date(Date modify_Date) {
		this.modify_Date = modify_Date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", nickName=" + nickName + ", email=" + email
				+ ", address=" + address + ", phone=" + phone + ", enroll_Date=" + enroll_Date + ", modify_Date="
				+ modify_Date + ", status=" + status + ", userName=" + userName +  "]";
	}

	public String getmNum() {
		return mNum;
	}

	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	
	
	
}
