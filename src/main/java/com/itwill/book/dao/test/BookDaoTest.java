package com.itwill.book.dao.test;

import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dto.Book;

public class BookDaoTest {

	public static void main(String[] args) throws Exception{
		BookDao bookDao=new BookDao();
		
		//전체리스트
		System.out.println(bookDao.selectAll());
		
		/*
		List<Book> bookA=bookDao.selectAll();
		for(Book book: bookA) {
			System.out.println(book);
		}
		*/
		
		//제목 검색
		System.out.println(bookDao.selectByName("마시멜로이야기"));
		
				
		//저자 검색
		System.out.println(bookDao.selectByAuthor("마키타 젠지"));
		//Book findBookAuthor=bookDao.selectByAuthor("마키타 젠지");
		
		/*
		List<Book> bookB=bookDao.selectByAuthor("마키타 젠지");
		for(Book book:bookB) {
			System.out.println(book);
		}
		*/
		
		//카테고리 검색
		System.out.println(bookDao.selectByClass("요리"));
		
		/*
		List<Book> bookC=bookDao.selectByClass("요리");
		for(Book book:bookC) {
			System.out.println(book);
		}*/
		
		/*
		 * Exception in thread "main" java.lang.NullPointerException
			at java.util.Properties$LineReader.readLine(Properties.java:434)
			at java.util.Properties.load0(Properties.java:353)
			at java.util.Properties.load(Properties.java:341)
			at book.BookDao.<init>(BookDao.java:20)
			at book.BookDaoTestMain.main(BookDaoTestMain.java:10)
		 */

		
		
	}

}
