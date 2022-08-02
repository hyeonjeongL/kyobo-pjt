package com.itwill.book.sql;

public class QnaSQL {
	public static final String QNA_INSERT = "insert into qna values(QNA_q_no_SEQ.nextval, ?,?,sysdate,?,?)";
	public static final String QNA_UPDATE = "update qna set q_class=?, q_title=?, q_contents=? where q_no=? and u_id=?";
	public static final String QNA_DELETE_BY_NO_ID = "delete qna where q_no=? and u_id=?";
	public static final String QNA_SELECT_BY_NO = "select * from qna where q_no=?";
	public static final String QNA_SELECT_BY_ID = "select * from qna where u_id=?";
}
