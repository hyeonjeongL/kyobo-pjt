package com.itwill.book.dao.test;

import com.itwill.book.dao.QnaDao;
import com.itwill.book.dto.Qna;

public class QnaTest {
	public static void main(String[] args) throws Exception{
		QnaDao qnaDao = new QnaDao();
		
		System.out.println(qnaDao.selectByNo(1));
		System.out.println(qnaDao.selectById("enbi"));
		
		Qna qna = new Qna(0, "제품문의", "테스트", null, "테스트중", "seongmin");
		System.out.println("insert");
		System.out.println(qnaDao.insert(qna));
		System.out.println("update");
		qna = new Qna(11, "제품문의", "테스트2", null, "테스트중2", "seongmin");
		System.out.println(qnaDao.update(qna));
		System.out.println("delete");
		System.out.println(qnaDao.deleteByNoId(9, "jihun"));
		
		
		
		
	}
}
