package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.Book;
import com.itwill.book.sql.BookSQL;

public class BookDao {
	private DataSource dataSource;

	public BookDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	// 제목 검색
	public Book selectByName(String b_name) throws Exception {
		Book book = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookSQL.BOOK_SELECT_BY_NAME);
		pstmt.setString(1, b_name);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"), rs.getInt("b_price"),
					rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
					rs.getString("b_publisher")

			);
		}
		return book;
	}
 
	//번호검색
	public Book selectByNo(int b_no) throws Exception {
		Book book = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookSQL.BOOK_SELECT_BY_NO);
		pstmt.setInt(1, b_no);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"), rs.getInt("b_price"),
					rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
					rs.getString("b_publisher")

			);
		}
		return book;
	}

	// 저자 검색1 (2개 이상)
	/*
	public List<Book> selectByAuthor(String b_author) throws Exception {
		List<Book> bookList = new ArrayList<Book>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookSQL.BOOK_SELECT_BY_B_CLASS);
		pstmt.setString(1, b_author);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"),
					rs.getInt("b_price"), rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
					rs.getString("b_publisher")

			);
			bookList.add(book);
		}
		return bookList;
	}*/

	// 저자 검색2 (1개)
		public Book selectByAuthor(String b_author) throws Exception{
			Book book=null;
			Connection con = dataSource.getConnection();
			PreparedStatement pstmt = con.prepareStatement(BookSQL.BOOK_SELECT_BY_AUTHOR);
			pstmt.setString(1, b_author);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"),
						rs.getInt("b_price"), rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
						rs.getString("b_publisher"));
			}
			return book;
		}
	

	// 카테고리 검색
	public List<Book> selectByClass(String b_class) throws Exception {
		List<Book> bookList = new ArrayList<Book>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookSQL.BOOK_SELECT_BY_B_CLASS);
		pstmt.setString(1, b_class);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"),
					rs.getInt("b_price"), rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
					rs.getString("b_publisher"));
			bookList.add(book);

		}
		return bookList;
	}

	// 전체 검색
	public List<Book> selectAll() throws Exception {
		List<Book> bookList = new ArrayList<Book>();

		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookSQL.BOOK_LIST);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"),
					rs.getInt("b_price"), rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
					rs.getString("b_publisher"));
			bookList.add(book);
		}
		return bookList;
	}

}
