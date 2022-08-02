package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.Book;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Review;
import com.itwill.book.sql.ReviewSQL;

public class ReviewDao {
	
	private DataSource dataSource;
	
	public ReviewDao() throws Exception{
		  Properties properties=new Properties();
		  properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		  BasicDataSource basicDataSource = new BasicDataSource();
		  basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		  basicDataSource.setUrl(properties.getProperty("url"));
		  basicDataSource.setUsername(properties.getProperty("username"));
		  basicDataSource.setPassword(properties.getProperty("password")); 
		  dataSource = basicDataSource;
		  
	}
	
	/*
	private int r_no;
	private String r_title;
	private Date r_date;
	private int r_grade;
	private String r_contents;
	private String u_id;
	private OrderDetail orderDetail;
	 */
	
	//리뷰등록
	public int reviewInsert(Review review) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.REVIEW_INSERT);
		// r_title,r_contents, r_grade,u_id,od_no
		pstmt.setString(1, review.getR_title());
		pstmt.setString(2, review.getR_contents());
		pstmt.setInt(3, review.getR_grade());
		pstmt.setString(4, review.getU_id());
		pstmt.setInt(5, review.getOrderDetail().getO_no());
		int insertRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return insertRowCount;
	}
	
	//리뷰수정
	public int reviewUpdate(Review review) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.REVIEW_UPDATE);
		//r_title=?, r_contents=?, r_grade=? where r_no=?
		pstmt.setString(1, review.getR_title());
		pstmt.setString(2, review.getR_contents());
		pstmt.setInt(3, review.getR_grade());
		pstmt.setInt(4, review.getR_no());
		int updateRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return updateRowCount;
	}
	
	//리뷰번호로 리뷰삭제
	public int reviewDelete(int r_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.REVIEW_DELETE);
		pstmt.setInt(1, r_no);
		int deleteRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return deleteRowCount;
	}
	
	/*
	private int r_no;
	private String r_title;
	private Date r_date;
	private int r_grade;
	private String r_contents;
	private String u_id;
	private OrderDetail orderDetail;
	 */
	
	//리뷰번호로 리뷰 1개 조회
	public Review reviewSelectNo(int r_no) throws Exception{
		Review findReviewR_no = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_R_NO);
		pstmt.setInt(1, r_no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			findReviewR_no=new Review(rs.getInt("r_no"), 
										rs.getString("r_title"), 
										rs.getDate("r_date"), 
										rs.getInt("r_grade"),
										rs.getString("r_contents"),
										rs.getString("u_id"),
										new OrderDetail(0, 0, 0,
										new Book(0, null, null, 0, null, null, null, null)));
			/*
			 new OrderDetail(0, 0, rs.getInt("o_no"),
			new Book(rs.getInt("b_no"), null, null, 0, null, null, null, null)));
			 */
			
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return findReviewR_no;
	}
	
	//책 번호로 리뷰조회
	public List<Review> reviewSelectB_no(int b_no) throws Exception{
		List<Review> reviewBookList = new ArrayList<Review>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_B_NO);
		pstmt.setInt(1, b_no);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			reviewBookList.add(new Review(rs.getInt("r_no"), 
					rs.getString("r_title"), 
					rs.getDate("r_date"), 
					rs.getInt("r_grade"),
					rs.getString("r_contents"),
					rs.getString("u_id"),
					new OrderDetail(0, 0, rs.getInt("o_no"),
					new Book(rs.getInt("b_no"), null, null, 0, null, null, null, null))));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		
		return reviewBookList;
	}
	
	//아이디로 리뷰 조회
	public List<Review> reviewSelectU_id(String u_id) throws Exception{
		List<Review> reviewIdList = new ArrayList<Review>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_U_ID);
		pstmt.setString(1, u_id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			reviewIdList.add(new Review(rs.getInt("r_no"), 
					rs.getString("r_title"), 
					rs.getDate("r_date"), 
					rs.getInt("r_grade"),
					rs.getString("r_contents"),
					rs.getString("u_id"),
					new OrderDetail(0, 0, rs.getInt("o_no"),
					new Book(rs.getInt("b_no"), null, null, 0, null, null, null, null))));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewIdList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
