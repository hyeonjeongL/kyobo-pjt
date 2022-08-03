package com.itwill.book.sql;

public class NoticeSQL {
	public final static String NOTICE_SELECT_ALL =
			"select * from notice";
	public final static String NOTICE_SELECTBYNO =
			"select * from notice where n_no = ?";
	public final static String NOTICE_READ_COUNT = 
			"update notice set n_views = n_views + 1 WHERE n_no = ?";
}
