package com.itwill.book.service.test;

import com.itwill.book.service.BookService;

public class BookServiceTest {

	public static void main(String[] args) throws Exception{
		BookService bookService=new BookService();
		System.out.println("1.리스트 보기");
		System.out.println(" "+bookService.selectAll());
		
		System.out.println("2.분야별 보기");
		System.out.println(" "+bookService.selectByClass("공포"));
		
		System.out.println("3.번호로 찾기");
		System.out.println(" "+bookService.selectByNo(8));
		
		System.out.println("4.저자로 찾기");
		System.out.println(" "+bookService.selectByAuthor("로버트 C. 마틴"));
		
		System.out.println("5.제목으로 찾기");
		System.out.println(" "+bookService.selectByName("악몽"));
		
		

	}

}
