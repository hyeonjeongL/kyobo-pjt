package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.sql.DataSource;

import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Review;
import com.itwill.book.sql.ReviewSQL;

public class ReviewDao {
	
	private DataSource dataSource;
	

	
	/*
	private int r_no;
	private String r_title;
	private Date date;
	private int r_grade;
	private String r_contents;
	private String u_id;
	private OrderDetail orderDetail;
	 */
	
	public int reviewInsert(Review review) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.REVIEW_INSERT);
		// r_title,r_contents, r_grade,u_id,od_no
		pstmt.setString(1, review.getR_title());
		pstmt.setString(2, review.getR_contents());
		pstmt.setInt(3, 5);
		
		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
