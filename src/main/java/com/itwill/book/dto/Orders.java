package com.itwill.book.dto;

import java.sql.Date;
import java.util.ArrayList;

public class Orders {
	/*
	이름      널?       유형           
	------- -------- ------------ 
	O_NO    NOT NULL NUMBER(10)   
	O_DATE           DATE         
	O_PRICE          NUMBER(10)   
	U_ID             VARCHAR2(50)
	*/
	private int o_no;
	private Date o_date;
	private int o_price;
	private String u_id;
	private ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
	
	public Orders() {
		
	}
	
	public Orders(int o_no, Date o_date, int o_price, String u_id) {
		super();
		this.o_no = o_no;
		this.o_date = o_date;
		this.o_price = o_price;
		this.u_id = u_id;
	}
	public Orders(int o_no, Date o_date, int o_price, String u_id, ArrayList<OrderDetail> orderDetailList) {
		super();
		this.o_no = o_no;
		this.o_date = o_date;
		this.o_price = o_price;
		this.u_id = u_id;
		this.orderDetailList = orderDetailList;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public ArrayList<OrderDetail> getOrderDetailList() {
		return orderDetailList;
	}
	public void setOrderDetailList(ArrayList<OrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	
	@Override
	public String toString() {
		return "Orders [o_no=" + o_no + ", o_date=" + o_date + ", o_price=" + o_price + ", u_id=" + u_id
				+ ", orderDetailList=" + orderDetailList + "]";
	}
	
}
	
