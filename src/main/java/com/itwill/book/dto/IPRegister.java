package com.itwill.book.dto;

public class IPRegister {
	private int i_no;
	private String i_name;
	private String i_ipno;
	private String u_id;
	public IPRegister(int i_no, String i_name, String i_ipno, String u_id) {
		super();
		this.i_no = i_no;
		this.i_name = i_name;
		this.i_ipno = i_ipno;
		this.u_id = u_id;
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
	@Override
	public String toString() {
		return "IPRegister [i_no=" + i_no + ", i_name=" + i_name + ", i_ipno=" + i_ipno + ", u_id=" + u_id + "]";
	}

	
	
	
}
