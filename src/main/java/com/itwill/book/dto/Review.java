package com.itwill.book.dto;

import java.util.Date;

public class Review {
	/*
	R_NO	NUMBER(10,0)
	R_TITLE	VARCHAR2(100 BYTE)
	R_DATE	DATE
	R_GRADE	NUMBER(10,0)
	R_CONTENTS	VARCHAR2(2000 BYTE)
	U_ID	VARCHAR2(50 BYTE)
	OD_NO	NUMBER(10,0)
	 */
	private int r_no;
	private String r_title;
	private Date r_date;
	private int r_grade;
	private String r_contents;
	private String u_id;
	private OrderDetail orderDetail;
	
	public Review() {
		
	}

	public Review(int r_no, String r_title, Date date, int r_grade, String r_contents, String u_id,
			OrderDetail orderDetail) {
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_date = date;
		this.r_grade = r_grade;
		this.r_contents = r_contents;
		this.u_id = u_id;
		this.orderDetail = orderDetail;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public Date getDate() {
		return r_date;
	}

	public void setDate(Date date) {
		this.r_date = date;
	}

	public int getR_grade() {
		return r_grade;
	}

	public void setR_grade(int r_grade) {
		this.r_grade = r_grade;
	}

	public String getR_contents() {
		return r_contents;
	}

	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", r_title=" + r_title + ", date=" + r_date + ", r_grade=" + r_grade
				+ ", r_contents=" + r_contents + ", u_id=" + u_id + ", orderDetail=" + orderDetail + "]";
	}
	
	
	
	
	
}
