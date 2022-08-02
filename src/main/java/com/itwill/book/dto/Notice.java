package com.itwill.book.dto;

import java.util.Date;

public class Notice {
	private int n_no;
	private String n_class;
	private String n_title;
	private Date n_date;
	private String n_contents;
	private int n_views;
	
	public Notice() {
		
	}
	public Notice(int n_no, String n_class, String n_title, Date n_date, String n_contents, int n_views) {
		super();
		this.n_no = n_no;
		this.n_class = n_class;
		this.n_title = n_title;
		this.n_date = n_date;
		this.n_contents = n_contents;
		this.n_views = n_views;
	}
	
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_class() {
		return n_class;
	}
	public void setN_class(String n_class) {
		this.n_class = n_class;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public String getN_contents() {
		return n_contents;
	}
	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}
	public int getN_views() {
		return n_views;
	}
	public void setN_views(int n_views) {
		this.n_views = n_views;
	}
	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_class=" + n_class + ", n_title=" + n_title + ", n_date=" + n_date
				+ ", n_contents=" + n_contents + ", n_views=" + n_views + "]";
	}
	
	
}
