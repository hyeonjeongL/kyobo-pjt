package com.itwill.book.sql;

public class CartSQL {
	
	//카트수량체크
	public static final String BOOK_COUNT_BY_ID_NO
	= "select count(*) book_count from cart where u_id=? and b_no=?";

	// 카트넣기 (있으면 update, 없으면 insert)
	public static final String CART_INSERT
	= "insert into cart(c_no,c_qty,u_id,b_no) values (cart_c_no_seq.nextval, ?,?,?)";
//	public static final String CART_INSERT_UPDATE
//	= "update cart set c_no=?, c_qty=?, u_id=?, b_no=?";

	//카트 수량변경 보류
	public static final String CART_UPDATE_QTY
	= "update cart set cart_c_no_seq.currval,c_qty=c_qty+? where u_id=? and b_no=?";
	//카트 선택 삭제
	public static final String CART_DELETE_BY_NO
	= "delete from cart where b_no=?";
	//카트 전체삭제
	public static final String CART_DELETE_ALL
	= "delete from cart where u_id=?";
	//카트리스트
	public static final String CART_SELECT_BY_ID
	= "select * from cart c join book b on c.b_no=b.b_no where c.u_id=?"; 


}
