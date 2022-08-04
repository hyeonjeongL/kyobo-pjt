package com.itwill.book.service;

import java.util.List;

import com.itwill.book.dao.CartDao;
import com.itwill.book.dao.test.cartDaoTest;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;

public class CartService {
	private CartDao cartDao;
	public CartService() throws Exception{
		cartDao = new CartDao();

	}
	
	 
	/*
	 * 카트추가 or 수정
	 */
	
	public int addCart (Cart newCart) throws Exception {
		Cart cart = new Cart(0, newCart.getC_qty(), newCart.getU_id(),
							new Book(newCart.getBook().getB_no(), null, null, 0, null, null, null, null));
		int book_count = cartDao.cartBookCount(cart);
		if(book_count == 0) {
			cartDao.cartInsert(cart);
		} else if (book_count >=1) {
			cartDao.cartUpdateQty(cart);
		}
		
		return book_count;
	}
	
	
	/*
	 * 카트리스트보기
	 */
	public List<Cart> getCartList (String u_id) throws Exception{
		return cartDao.cartList(u_id);
	}
	
	
	
	/*
	 * 카트아이템1개삭제
	 */
	public int cartDeleteByNo (int b_no) throws Exception{
		return cartDao.cartDeleteByNo(b_no);
	}
	
	/*
	 * 카트전체삭제
	 */
	public int cartDeleteAll (String u_id) throws Exception{
		return cartDao.cartDeleteAll(u_id);
	}
	


}
