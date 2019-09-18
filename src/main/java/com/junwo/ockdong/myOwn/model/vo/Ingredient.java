package com.junwo.ockdong.myOwn.model.vo;

import java.sql.Date;

public class Ingredient {
	private int inNo;
	private String inName;
	private String inType;
	private int inGram;
	private Date inCreateDate;
	private String status;
	private String inOriginalFile;
	private String inRenameFile;
	
	public Ingredient() {}

	public Ingredient(String inName, String inType, int inGram, String inOriginalFile,
			String inRenameFile) {
		super();
		this.inName = inName;
		this.inType = inType;
		this.inGram = inGram;
		this.inOriginalFile = inOriginalFile;
		this.inRenameFile = inRenameFile;
	}

	public Ingredient(int inNo, String inName, String inType, int inGram, String status,
			String inOriginalFile, String inRenameFile, Date inCreateDate) {
		super();
		this.inNo = inNo;
		this.inName = inName;
		this.inType = inType;
		this.inGram = inGram;
		this.status = status;
		this.inOriginalFile = inOriginalFile;
		this.inRenameFile = inRenameFile;
		this.inCreateDate = inCreateDate;
	}

	public int getInNo() {
		return inNo;
	}

	public void setInNo(int inNo) {
		this.inNo = inNo;
	}

	public String getInName() {
		return inName;
	}

	public void setInName(String inName) {
		this.inName = inName;
	}

	public String getInType() {
		return inType;
	}

	public void setInType(String inType) {
		this.inType = inType;
	}

	public int getInGram() {
		return inGram;
	}

	public void setInGram(int inGram) {
		this.inGram = inGram;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getInOriginalFile() {
		return inOriginalFile;
	}

	public void setInOriginalFile(String inOriginalFile) {
		this.inOriginalFile = inOriginalFile;
	}

	public String getInRenameFile() {
		return inRenameFile;
	}

	public void setInRenameFile(String inRenameFile) {
		this.inRenameFile = inRenameFile;
	}

	public Date getInCreateDate() {
		return inCreateDate;
	}

	public void setInCreateDate(Date inCreateDate) {
		this.inCreateDate = inCreateDate;
	}

	@Override
	public String toString() {
		return "Ingredient [inNo=" + inNo + ", inName=" + inName + ", inType=" + inType + ", inGram=" + inGram
				+ ", inCreateDate=" + inCreateDate + ", status=" + status + ", inOriginalFile="
				+ inOriginalFile + ", inRenameFile=" + inRenameFile + "]";
	}
	
}
