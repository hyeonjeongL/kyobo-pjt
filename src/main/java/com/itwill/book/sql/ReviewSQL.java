package com.itwill.book.sql;

public class ReviewSQL {
	public static final String INSERT_REVIEW_NEW = "insert into review (r_no,r_title,r_contents,r_date,r_grade,u_id,od_no,r_groupno,r_step,r_depth) values(REVIEW_R_NO_SEQ.nextval, ?,?,sysdate,?,?,?, REVIEW_R_NO_SEQ.nextval,?,?)";
	
	public static final String INSERT_REVIEW_REPLY = "";
	
	
}
