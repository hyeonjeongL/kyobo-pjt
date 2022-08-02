package com.itwill.book.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.NoticeDao;
import com.itwill.book.dto.Notice;

public class NoticeService {
	private NoticeDao noticeDao;
	
	// 공지사항 하나 출력
	public Notice noticeSelectByNo(int n_no) throws Exception{
		Notice findNotice = noticeDao.selectByNo(n_no);
		return findNotice;
	}
	
	// 공지사항 전체 출력
	public List<Notice> noticeSelectAll() throws Exception{
		List<Notice> noticeList = new ArrayList<Notice>();
		noticeList = noticeDao.NoticeSelectAll();
		return noticeList;
	}
}
