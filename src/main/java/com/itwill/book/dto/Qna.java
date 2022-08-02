package com.itwill.book.dto;

public class Qna {
	private int q_no;
	private String q_clss;
	private String q_title;
	private String q_date;
	private String q_contents;
	private String u_id;
	
	
	public Qna() {
	}
	
	
	public Qna(int q_no, String q_clss, String q_title, String q_date, String q_contents, String u_id) {
		super();
		this.q_no = q_no;
		this.q_clss = q_clss;
		this.q_title = q_title;
		this.q_date = q_date;
		this.q_contents = q_contents;
		this.u_id = u_id;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_clss() {
		return q_clss;
	}
	public void setQ_clss(String q_clss) {
		this.q_clss = q_clss;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public String getQ_contents() {
		return q_contents;
	}
	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	@Override
	public String toString() {
		return "Qna [q_no=" + q_no + ", q_clss=" + q_clss + ", q_title=" + q_title + ", q_date=" + q_date
				+ ", q_contents=" + q_contents + ", u_id=" + u_id + "]";
	}
	
	
}