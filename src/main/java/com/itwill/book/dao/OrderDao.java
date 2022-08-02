package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Orders;
import com.itwill.book.sql.OrderSQL;

public class OrderDao {
	
	private DataSource dataSource;
	
	public OrderDao() throws Exception{
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
	public int creat(Orders orders)throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			//Orders
			pstmt1 = con.prepareStatement(OrderSQL.ORDER_INSERT);
			pstmt1.setInt(1, orders.getO_price());
			pstmt1.setString(2, orders.getU_id());
			pstmt1.executeUpdate();
			//orderDetail
			pstmt2 = con.prepareStatement(OrderSQL.ORDER_DETAIL_INSERT);
			for (OrderDetail orderDetail : orders.getOrdersList()) {			
				pstmt2.clearParameters();
				pstmt2.setInt(1, orderDetail.getOd_qty());
				pstmt2.setInt(2, orderDetail.getBook().getB_no());
				pstmt2.executeUpdate();
			}	
			con.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
		
			con.rollback();
			throw e;
		}
		return 0;
	}
	public int delete(String sUserId)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(OrderSQL.ORDER_DELETE_ALL_BY_U_ID);
			pstmt.setString(1, sUserId);
			rowCount = pstmt.executeUpdate();
			con.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
			
			con.rollback();
			throw e;
		}finally {
			if(con!=null)con.close();
		}
		return rowCount;
	}
	//미완성
}
