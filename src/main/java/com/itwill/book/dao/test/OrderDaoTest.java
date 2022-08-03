package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dao.CartDao;
import com.itwill.book.dao.OrderDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Orders;

public class OrderDaoTest {

	public static void main(String[] args) throws Exception{
		 OrderDao orderDao = null;
		 CartDao cartDao = null;
		 BookDao bookDao = null;
		//주문을 넣어보자 상품 페이지에서 직접 주문
		// book 번호 1
		 String b_name = "마시멜로이야기";
		
		 List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		 Book book = bookDao.selectByName(b_name);
	}

}
