package com.junwo.ockdong.common;

import java.sql.Date;

public class boardMarking {
	private int marking_no;
	private int marking_type;
	private Date marking_date;
	private int board_no;
	private String userId;
	
	public boardMarking() {}

	public boardMarking(int marking_no, int marking_type, Date marking_date, int board_no, String userId) {
		super();
		this.marking_no = marking_no;
		this.marking_type = marking_type;
		this.marking_date = marking_date;
		this.board_no = board_no;
		this.userId = userId;
	}

	public int getMarking_no() {
		return marking_no;
	}

	public void setMarking_no(int marking_no) {
		this.marking_no = marking_no;
	}

	public int getMarking_type() {
		return marking_type;
	}

	public void setMarking_type(int marking_type) {
		this.marking_type = marking_type;
	}

	public Date getMarking_date() {
		return marking_date;
	}

	public void setMarking_date(Date marking_date) {
		this.marking_date = marking_date;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "boardMarking [marking_no=" + marking_no + ", marking_type=" + marking_type + ", marking_date="
				+ marking_date + ", board_no=" + board_no + ", userId=" + userId + "]";
	}
	
}
