package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.Notice;
import com.itwill.book.sql.NoticeSQL;

public class NoticeDao {
	private DataSource dataSource;
	
	public NoticeDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
	// 공지사항 전체 출력 selectAll
	
	public List<Notice> NoticeSelectAll() throws Exception{
		List<Notice> noticeList = new ArrayList<Notice>();
		
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(NoticeSQL.NOTICE_SELECT_ALL);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Notice notice = new Notice(rs.getInt("n_no"),
									   rs.getString("n_class"),
									   rs.getString("n_title"),
									   rs.getDate("n_date"),
									   rs.getString("n_contents"),
									   rs.getInt("n_views"));
			noticeList.add(notice);
		}
		return noticeList;
	}
	
	// 공지사항 하나 출력 selectByNo 공지사항 번호로 출력
	
	public Notice selectByNo(int n_no) throws Exception{
		Notice notice = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(NoticeSQL.NOTICE_SELECTBYNO);
		pstmt.setInt(1, n_no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			notice = new Notice(rs.getInt("n_no"),
								rs.getString("n_class"),
								rs.getString("n_title"),
								rs.getDate("n_date"),
								rs.getString("n_contents"),
								rs.getInt("n_views"));
		}
		return notice;
	}
}
