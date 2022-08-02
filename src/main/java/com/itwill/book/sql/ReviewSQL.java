package com.itwill.book.sql;

public class ReviewSQL {
	public static final String REVIEW_INSERT = 
			"insert into review (r_no, r_title,r_contents, r_date,r_grade,u_id,od_no) values(REVIEW_R_NO_SEQ.nextval,?,?,sysdate,?,?,?)";
	public static final String REVIEW_UPDATE = 
			"update review set r_title=?, r_contents=?, r_grade=? where r_no=?";
	
	public static final String REVIEW_DELETE = "delete review where r_no=?";
	
	
	//리뷰 번호로 리뷰 조회
	public static final String REVIEW_SELECT_BY_R_NO = "select * from review where r_no=?";
	
	//책 번호로 리뷰 조회
	public static final String REVIEW_SELECT_BY_B_NO = "select * from review where b_no=?";
	
/*	
	//회원아이디로 리뷰 조회(마이페이지에서 리뷰조회)
	public static final String REVIEW_SELECT_BY_U_ID = 
			"select * from (select * from review r join orders o on r.o_no=o.o_no) join userinfo on u.u_id=ro.u_id where u.u_id=?";
*/	
	//회원아이디로 리뷰조회-아이디만 이용
	public static final String REVIEW_SELECT_BY_U_ID = 
			"select * from review where u_id=?";
}
