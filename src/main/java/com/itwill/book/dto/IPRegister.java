package com.itwill.book.dto;

public class IPRegister {
	private int i_no;
	private String i_name;
	private String i_ipno;
	private String u_id;
	private String i_date;
	public IPRegister(int i_no, String i_name, String i_ipno, String u_id, String i_date) {
		super();
		this.i_no = i_no;
		this.i_name = i_name;
		this.i_ipno = i_ipno;
		this.u_id = u_id;
		this.i_date = i_date;
	}
	public int getI_no() {
		return i_no;
	}
	public void setI_no(int i_no) {
		this.i_no = i_no;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_ipno() {
		return i_ipno;
	}
	public void setI_ipno(String i_ipno) {
		this.i_ipno = i_ipno;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getI_date() {
		return i_date;
	}
	public void setI_date(String i_date) {
		this.i_date = i_date;
	}
	
	
	
	
}
