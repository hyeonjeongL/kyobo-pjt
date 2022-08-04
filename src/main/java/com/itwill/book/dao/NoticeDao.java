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
	
	public Notice getNoticeDetail(int n_no) throws Exception{
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
	
	// 공지사항 총 개수
	public int getNoticeCount() throws Exception{
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM NOTICE");
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);

		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}
		}
		return count;
	}
	// 공지사항 목록 조회
	public ArrayList<Notice> getNoticeList(int start, int last) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Notice> noticeList = new ArrayList<Notice>();

		try {
			conn = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(500);
			sql.append("SELECT * ");
			sql.append("FROM ");
			sql.append("( ");
			sql.append("	SELECT ");
			sql.append("		rownum idx, s.* ");
			sql.append("	FROM ");

			sql.append("	( ");
			sql.append("		SELECT ");
			sql.append("			n_no, n_class, n_title, ");
			sql.append("			n_date, n_contents, n_views ");
			sql.append("		FROM ");
			sql.append("			notice ");
			sql.append("		ORDER BY n_no DESC ");
			sql.append("	) s ");

			sql.append(") ");
			sql.append("WHERE idx >= ? AND idx <= ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Notice notice = new Notice();
				notice.setN_no(rs.getInt(2));
				notice.setN_class(rs.getString(3));
				notice.setN_title(rs.getString(4));
				notice.setN_date(rs.getDate(5));
				notice.setN_contents(rs.getString(6));
				notice.setN_views(rs.getInt(7));

				noticeList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return noticeList;
	}
	
	// 공지사항 조회수 증가.
	public void increaseNoticeReadCount(int noticeNo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(NoticeSQL.NOTICE_READ_COUNT);
			pstmt.setInt(1, noticeNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	
	
}
