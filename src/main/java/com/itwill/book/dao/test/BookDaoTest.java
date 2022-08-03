package com.itwill.book.dao.test;

import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dto.Book;

public class BookDaoTest {

	public static void main(String[] args) throws Exception{
		BookDao bookDao=new BookDao();
		
		//전체리스트
		System.out.println(bookDao.selectAll());
		
		
		
		//제목 검색
		System.out.println(bookDao.selectByName("마시멜로이야기"));
		
				
		//저자 검색1 (1개)
		Book findBookAuthor=bookDao.selectByAuthor("마키타 젠지");
		System.out.println(findBookAuthor);
		
		
		//저자 검색2 (2개 이상)
		/*
		List<Book> bookB=bookDao.selectByAuthor("마키타 젠지");
		for(Book book:bookB) {
			System.out.println(book);
		}
		*/
		
		//카테고리 검색
		System.out.println(bookDao.selectByClass("요리"));
		
		//번호 검색
		System.out.println(bookDao.selectByNo(1));
		
		
		/* properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"))> 경로수정
		 * 
		 * Exception in thread "main" java.lang.NullPointerException
			at java.util.Properties$LineReader.readLine(Properties.java:434)
			at java.util.Properties.load0(Properties.java:353)
			at java.util.Properties.load(Properties.java:341)
			at book.BookDao.<init>(BookDao.java:20)
			at book.BookDaoTestMain.main(BookDaoTestMain.java:10)
		 */

		
		
	}

}
