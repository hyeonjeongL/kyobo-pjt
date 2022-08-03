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
		 OrderDao orderDao = new OrderDao(); 
		 //List<Orders> orderList = orderDao.List_detail("seongmin");
		 //System.out.println(orderList);
		//System.out.println(orderDao.deleteByOrdersNo(1));
		 System.out.println(orderDao.orderDetail("seongmin", 2));
	
		//orderDao.deleteByOrdersNo(1);
		// orderDao.delete("jihun");
	}

}
