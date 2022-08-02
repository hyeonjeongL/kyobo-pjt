package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.NoticeDao;
import com.itwill.book.dto.Notice;

public class NoticeDaoTest {

	public static void main(String[] args) throws Exception{
		NoticeDao noticeDao = new NoticeDao();
		List<Notice> noticeList = new ArrayList<Notice>();
		System.out.println(noticeDao.selectByNo(4));
		noticeList = noticeDao.NoticeSelectAll();
		System.out.println(noticeList);
		
		
	}

}
