package com.itwill.book.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.common.PageMaker;
import com.itwill.book.dao.NoticeDao;
import com.itwill.book.dto.Notice;
import com.itwill.book.dto.PageMakerDto;

public class NoticeService {
	private static NoticeService instance;
	
	private NoticeDao noticeDao;
	
	public static NoticeService getInstance() throws Exception{
		if(instance==null) {
			instance = new NoticeService();
		}
		return instance;
	}
	
	
	// 공지사항 목록
	public PageMakerDto<Notice> getNoticeList(int currentPage) throws Exception{
		//전체 글 개수 구하기
		int totRecordCount = noticeDao.getNoticeCount();
		//페이지 계산
		PageMaker pageMaker = new PageMaker(totRecordCount, currentPage, 10, 10);
		//게시물 데이터
		List<Notice> noticeList = noticeDao.getNoticeList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<Notice> pageMakerNoticeList = new PageMakerDto<Notice>(noticeList, pageMaker, totRecordCount);
		return pageMakerNoticeList;
	}
	
	// 공지사항 하나 출력
	public Notice noticeSelectByNo(int n_no) throws Exception{
		Notice findNotice = noticeDao.getNoticeDetail(n_no);
		return findNotice;
	}
	
	// 공지사항 전체 출력
	public List<Notice> noticeSelectAll() throws Exception{
		List<Notice> noticeList = new ArrayList<Notice>();
		noticeList = noticeDao.NoticeSelectAll();
		return noticeList;
	}
	
	// 공지사항 조회수 증가
	public void updateviewCount(int noticeNo) throws Exception{
		noticeDao.increaseNoticeReadCount(noticeNo);
	}
}
