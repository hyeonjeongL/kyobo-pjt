package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.IPRegister;
import com.itwill.book.sql.IPRegisterSQL;

public class IPRegisterDao {
	private DataSource dataSource;
	
	public IPRegisterDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
	
	/*
	 * private int i_no;
	private String i_name;
	private String i_ipno;
	private String u_id;
	 * 
	 */
	
	public int insert(IPRegister ipRegister) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(IPRegisterSQL.INSERT);
		pstmt.setString(1, ipRegister.getI_name());
		pstmt.setString(2, ipRegister.getI_ipno());
		pstmt.setString(3, ipRegister.getU_id());
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	
	public int delete(int i_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(IPRegisterSQL.DELETE);
		pstmt.setInt(1, i_no);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	public List<IPRegister> selectById(String u_id) throws Exception{
		List<IPRegister> ipRegisterList = new ArrayList<IPRegister>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(IPRegisterSQL.SELECT_BY_ID);
		pstmt.setString(1, u_id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int i_no = rs.getInt("i_no");
			String i_name = rs.getString("i_name");
			String i_ipno = rs.getString("i_ipno");
			String i_date = rs.getString("i_date");
			
			ipRegisterList.add(new IPRegister(i_no, i_name, i_ipno, u_id, i_date));
		}
		return ipRegisterList;
	}
	
	
	
	
	
	
}
