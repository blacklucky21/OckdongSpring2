package com.junwo.ockdong.product.model.vo;

import java.sql.Date;

public class Product {
	private int p_Id; // 상품 번호
	private String p_name; // 상품명
	private String p_content; // 상풍 내용
	private Date p_createDate; // 만든일
	private Date p_updateDate; // 수정일
	private int p_like; // 좋아요
	private int p_quantity; // 수량
	private String p_lunchtype; // 도시락 타입
	private int p_price; // 가격
	private String p_sell; // 판매 여부
	private String p_status; // 삭제 여부
	
	
	public int getP_Id() {
		return p_Id;
	}


	public void setP_Id(int p_Id) {
		this.p_Id = p_Id;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_content() {
		return p_content;
	}


	public void setP_content(String p_content) {
		this.p_content = p_content;
	}


	public Date getP_createDate() {
		return p_createDate;
	}


	public void setP_createDate(Date p_createDate) {
		this.p_createDate = p_createDate;
	}


	public Date getP_updateDate() {
		return p_updateDate;
	}


	public void setP_updateDate(Date p_updateDate) {
		this.p_updateDate = p_updateDate;
	}


	public int getP_like() {
		return p_like;
	}


	public void setP_like(int p_like) {
		this.p_like = p_like;
	}


	public int getP_quantity() {
		return p_quantity;
	}


	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}


	public String getP_lunchtype() {
		return p_lunchtype;
	}


	public void setP_lunchtype(String p_lunchtype) {
		this.p_lunchtype = p_lunchtype;
	}


	public int getP_price() {
		return p_price;
	}


	public void setP_price(int p_price) {
		this.p_price = p_price;
	}


	public String getP_sell() {
		return p_sell;
	}


	public void setP_sell(String p_sell) {
		this.p_sell = p_sell;
	}


	public String getP_status() {
		return p_status;
	}


	public void setP_status(String p_status) {
		this.p_status = p_status;
	}


	public Product() {
		super();
	}
	

	public Product(int p_Id, String p_name, String p_content, int p_quantity, String p_lunchtype, int p_price) {
		super();
		this.p_Id = p_Id;
		this.p_name = p_name;
		this.p_content = p_content;
		this.p_quantity = p_quantity;
		this.p_lunchtype = p_lunchtype;
		this.p_price = p_price;
	}


	public Product(int p_Id, String p_name, String p_content, Date p_createDate, Date p_updateDate, int p_like,
	        int p_quantity, String p_lunchtype, int p_price, String p_sell, String p_status) {
		super();
		this.p_Id = p_Id;
		this.p_name = p_name;
		this.p_content = p_content;
		this.p_createDate = p_createDate;
		this.p_updateDate = p_updateDate;
		this.p_like = p_like;
		this.p_quantity = p_quantity;
		this.p_lunchtype = p_lunchtype;
		this.p_price = p_price;
		this.p_sell = p_sell;
		this.p_status = p_status;
	}


	@Override
	public String toString() {
		return "Product [p_Id=" + p_Id + ", p_name=" + p_name + ", p_content=" + p_content + ", p_createDate="
		        + p_createDate + ", p_updateDate=" + p_updateDate + ", p_like=" + p_like + ", p_quantity=" + p_quantity
		        + ", p_lunchtype=" + p_lunchtype + ", p_price=" + p_price + ", p_sell=" + p_sell + ", p_status="
		        + p_status + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
