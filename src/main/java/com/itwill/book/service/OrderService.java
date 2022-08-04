package com.itwill.book.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dao.CartDao;
import com.itwill.book.dao.OrderDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Orders;

public class OrderService {
	private OrderDao orderDao;
	private BookDao bookDao;
	private CartDao cartDao;
	
	//상품에서 주문
	public int creat(String sUserId, int b_no, int od_qty) throws Exception {
		Book book = bookDao.selectByNo(b_no);
		OrderDetail orderDetail = new OrderDetail(0, od_qty, b_no, book);
		ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		orderDetailList.add(orderDetail);
		Orders creatOrder =
				new Orders(b_no,
							null,
							orderDetailList.get(0).getOd_qty()*orderDetailList.get(0).getBook().getB_price(),
							sUserId,
							orderDetailList);
		
		
		return orderDao.create(creatOrder);
	}
		public int crerat(String sUserId) throws Exception {
			List<Cart> cartList = cartDao.cartList(sUserId);
			ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
			int o_tot_price = 0;
			int od_tot_count = 0;
			for (Cart cart : cartList) {
				OrderDetail orderDetail = new OrderDetail(0, cart.getC_qty(), 0, cart.getBook());
				orderDetailList.add(orderDetail);
				o_tot_price+=orderDetail.getOd_qty()*orderDetail.getBook().getB_price();
				od_tot_count+=orderDetail.getOd_qty();
			
			}
				Orders creatOrder = new Orders(0, null, o_tot_price, sUserId, orderDetailList);
				orderDao.create(creatOrder);
				cartDao.cartDeleteAll(sUserId);
				return 0;				
			
		}
	
	
	
	
}
