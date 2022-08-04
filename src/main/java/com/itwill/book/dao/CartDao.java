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
import com.itwill.book.dto.Cart;
import com.itwill.book.sql.CartSQL;

public class CartDao {
		private DataSource dataSource;
		public CartDao() throws Exception{
			
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
		//수량체크
	public int cartBookCount (Cart cart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.BOOK_COUNT_BY_ID_NO);
		pstmt.setString(1, cart.getU_id());
		pstmt.setInt(2, cart.getBook().getB_no());
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int book_count = rs.getInt("book_count");
		con.close();
		return book_count;
	}
		
		
	//cart insert 기존수량
	public int cartInsert(Cart newCart) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_INSERT);
		pstmt.setInt(1, newCart.getC_qty());
		pstmt.setString(2, newCart.getU_id() );
		pstmt.setInt(3, newCart.getBook().getB_no());
		
		int insertCount = pstmt.executeUpdate();
		return insertCount;

		
	}
	//cart update_qty 카트수량변경 (장바구니 추가할때마다 카드 번호가 바뀌는게 맞는걸까?? 고정되야하는건 아닐까)
	public int cartUpdateQty(Cart newCart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_UPDATE_QTY);
		
		pstmt.setInt(1, newCart.getC_qty() );
		pstmt.setString(2, newCart.getU_id());
		pstmt.setInt(3, newCart.getBook().getB_no());
		
		int updateQtyCount = pstmt.executeUpdate();
		return updateQtyCount;
	}

	
	//cart deleteByNo 카트 선택삭제
	public int cartDeleteByNo (int b_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_DELETE_BY_CNO);
		pstmt.setInt(1, b_no);
		
		int deleteNoCount = pstmt.executeUpdate();
		return deleteNoCount;
	}
	
	
	//cart deleteAll 카트 전체삭제
	public int cartDeleteAll (String u_id) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_DELETE_ALL);
		pstmt.setString(1, u_id);
		int deleteAllCount  = pstmt.executeUpdate();
		return deleteAllCount;
	}
	
	
	//cart selectById 카트리스트
	public List<Cart> cartList(String u_id) throws Exception{
		List<Cart> cartList = new ArrayList<Cart>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_SELECT_BY_ID);
		pstmt.setString(1, u_id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Cart cart = new Cart(rs.getInt("c_no"),
								 rs.getInt("c_qty"),
								 rs.getString("u_id"),
								 new Book(rs.getInt("b_no"),
										 rs.getString("b_class"),
										 rs.getString("b_name"),
										  rs.getInt("b_price"),
										  rs.getString("b_summary"),
										  rs.getString("b_image"),
										  rs.getString("b_author"),
										  rs.getString("b_publisher")));
							cartList.add(cart);
		}
		con.close();
		return cartList;
	}
	
	//카트리스트(카트넘버) 주문용
	public List<Cart> cartListOder(String c_no) throws Exception{
		
		List<Cart> cartListOrder = new ArrayList<Cart>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_SELECT_BY_CNO);
		pstmt.setString(1, c_no);
		ResultSet rs = pstmt.executeQuery(); 
		while(rs.next()) {
			Cart cart = new Cart(rs.getInt("c_no"),
								 rs.getInt("c_qty"),
								 rs.getString("u_id"),
								 new Book(rs.getInt("b_no"),
										 rs.getString("b_class"),
										 rs.getString("b_name"),
										  rs.getInt("b_price"),
										  rs.getString("b_summary"),
										  rs.getString("b_image"),
										  rs.getString("b_author"),
										  rs.getString("b_publisher")));
							cartListOrder.add(cart);
		}
		con.close();
		return cartListOrder;
		
	}
	
	

	
}
