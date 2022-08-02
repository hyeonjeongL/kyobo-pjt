package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.Qna;
import com.itwill.book.sql.QnaSQL;



public class QnaDao {
	private DataSource dataSource;
	
	public QnaDao() throws Exception{
		Properties properties=new Properties();
		  properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		  BasicDataSource basicDataSource = new BasicDataSource();
		  basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		  basicDataSource.setUrl(properties.getProperty("url"));
		  basicDataSource.setUsername(properties.getProperty("username"));
		  basicDataSource.setPassword(properties.getProperty("password")); 
		  dataSource = basicDataSource;
	}
	
	
	public int insert(Qna qna)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_INSERT);
		pstmt.setString(1, qna.getQ_clss());
		pstmt.setString(2, qna.getQ_title());
		pstmt.setString(3, qna.getQ_contents());
		pstmt.setString(4, qna.getU_id());
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		
		return rowCount;
	}
	
	public int update(Qna qna) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_UPDATE);
		pstmt.setString(1, qna.getQ_clss());
		pstmt.setString(2, qna.getQ_title());
		pstmt.setString(3, qna.getQ_contents());
		pstmt.setInt(4, qna.getQ_no());
		pstmt.setString(5, qna.getU_id());
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return rowCount;
	}
	
	public int deleteByNoId(int no, String id)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_DELETE_BY_NO_ID);
		pstmt.setInt(1, no);
		pstmt.setString(2, id);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	public Qna selectByNo(int no)throws Exception {
		Qna qna = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_SELECT_BY_NO);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			int q_no = rs.getInt("q_no");
			String q_class = rs.getString("q_class");
			String q_title = rs.getString("q_title");
			String q_contents = rs.getString("q_contents");
			String q_date = rs.getString("q_date");
			String u_id = rs.getString("u_id");
			
			qna = new Qna(q_no, q_class, q_title, q_contents, q_date, u_id);
		}
		return qna;
	}
	
	public Qna selectById(String id)throws Exception {
		Qna qna = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_SELECT_BY_ID);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			int q_no = rs.getInt("q_no");
			String q_class = rs.getString("q_class");
			String q_title = rs.getString("q_title");
			String q_contents = rs.getString("q_contents");
			String q_date = rs.getString("q_date");
			String u_id = rs.getString("u_id");
			
			qna = new Qna(q_no, q_class, q_title, q_contents, q_date, u_id);
		}
		return qna;
	}
}