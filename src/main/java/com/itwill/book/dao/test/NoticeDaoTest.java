package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.NoticeDao;
import com.itwill.book.dto.Notice;

public class NoticeDaoTest {

	public static void main(String[] args) throws Exception{
		
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = new ArrayList<Notice>();
		/*
		System.out.println("---공지사항 목록 조회---");
		ArrayList<Notice> noticeList = noticeDao.getNoticeList(1,3);
		for(Notice notice : noticeList)
			System.out.println(notice);
		
		System.out.println("---공지사항 상세 조회---");
		System.out.println(noticeDao.getNoticeDetail(1));
		*/
		noticeList = noticeDao.getNoticeList(1, 3);
		System.out.println(noticeList);
	}

}
