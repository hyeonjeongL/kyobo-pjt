package com.itwill.book.service;

import com.itwill.book.dao.CartDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;

public class CartService {
	
	
//	public boolean cartInsert(Cart newCart) throws Exception {
//		boolean isSuccess = false;
//
//		if (cartDao.selectById(newCart.getU_id()) == null) {
//			int rowCount = cartDao.cartInsert(newCart);
//			isSuccess = true;
//
//		} else {
//			isSuccess = false;
//		}
//
//		return isSuccess;
//	}
	public static void main(String[] args) throws Exception{
		
		CartDao cartDao = new CartDao();
		Cart newCart = new Cart(0,1,"hunjeong", new Book(1,"자기개발서","마시멜로이야기",12000,"달콤한 유혹에서 이겨낼 때 비로소 얻게 된다",	"1_marshmallow","호아킴 데 포사다",	"한국경제신문사"));
		System.out.println("--------cart add(insert)------");
		cartDao.cartInsert(newCart);
		System.out.println(cartDao.cartInsert(newCart));
		System.out.println("--------cart update------");
		cartDao.cartUpdateQty(newCart);
		System.out.println("--------cart deleteByNo------");
		cartDao.cartDeleteByNo(newCart);
		System.out.println("--------cart deleteAll------");
		cartDao.cartDeleteAll(newCart);
		System.out.println("--------cart selectById------");
		cartDao.cartList("hunjeong");
		
		
	}

}
