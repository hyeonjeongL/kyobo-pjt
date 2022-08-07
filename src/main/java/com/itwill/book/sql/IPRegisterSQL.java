package com.itwill.book.sql;

public class IPRegisterSQL {
	public static final String INSERT= "insert into IPRegister values(seq, ?, ?, ?)";
	public static final String UPDATE= "update ipregister set i_name=? where u_id=?";
	public static final String DELETE= "delete ipregister where i_no=?";
	public static final String SELECT_BY_ID= "select * from ipregister where u_id=?";
}
