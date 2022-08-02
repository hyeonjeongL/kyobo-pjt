package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dao.CartDao;
import com.itwill.book.dao.OrderDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.OrderDetail;

public class OrderDaoTest {

	public static void main(String[] args) throws Exception{
		OrderDao orderDao = new OrderDao();
		CartDao cartDao = new CartDao();
		BookDao bookDao = new BookDao();
		
		int b_no = 1;
		int b_qty = 1;
		
		List<OrderDetail> OrderDetailList = new ArrayList<OrderDetail>();
		//Book book = bookDao.selectByName("마시멜로이야기");
		ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
	//미완성
	
	}

}
