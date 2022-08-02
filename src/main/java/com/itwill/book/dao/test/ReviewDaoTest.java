package com.itwill.book.dao.test;

import java.util.List;

import com.itwill.book.dao.ReviewDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Review;

public class ReviewDaoTest {

	public static void main(String[] args) throws Exception{
		/*
		private int r_no;
		private String r_title;
		private Date r_date;
		private int r_grade;
		private String r_contents;
		private String u_id;
		private OrderDetail orderDetail;
		 */
		//<< insert >>
		ReviewDao reviewDao = new ReviewDao();
		Review reviewInsert = new Review(1, "리뷰제목", null, 5, "리뷰내용 길게써야지", "enbi",
								new OrderDetail(1, 0, 9, 
									new Book(1, null, null, 0, null, null, null, null)));
		//System.out.println(reviewDao.reviewInsert(reviewInsert)); 
		
		//<< update >>
		Review reviewUpdate = new Review(11, "리뷰제목수정", null, 4, "리뷰내용 수정했음", null,
								new OrderDetail(0, 0, 0, 
									new Book(0, null, null, 0, null, null, null, null)));
		System.out.println(reviewDao.reviewUpdate(reviewUpdate));
		
		//<< delete >>
		System.out.println(reviewDao.reviewDelete(10));
		
		
		//<< select r_no >>
		System.out.println(reviewDao.reviewSelectNo(11));
		
		//<< select b_no >>
		List<Review> selectReviewB_no = reviewDao.reviewSelectB_no(1);
		for (Review review : selectReviewB_no) {
			System.out.println(review);
		}
		
		
		//<< select u_id >>
		List<Review> selectReviewId = reviewDao.reviewSelectU_id("enbi");
		for (Review review : selectReviewId) {
			System.out.println(review);
		}
	}

}
