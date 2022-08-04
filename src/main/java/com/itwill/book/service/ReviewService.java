package com.itwill.book.service;

import java.util.List;

import com.itwill.book.dao.ReviewDao;
import com.itwill.book.dto.Review;

public class ReviewService {
	private ReviewDao reviewDao;
	
	public ReviewService() throws Exception{
		reviewDao = new ReviewDao();
	}
	
	//리뷰생성
	public int create(Review review) throws Exception{
		return reviewDao.create(review);
	}
	
	//리뷰댓글작성
	public int createReply(Review review)throws Exception{
		return reviewDao.createReply(review);
	}
	
	//리뷰수정
	public int reviewUpdateByNo(Review review) throws Exception{
		return reviewDao.reviewUpdateByNo(review);
	}
	
	//리뷰삭제 -- 댓글 삭제에 쓰려나
	public int reviewDeleteByNo(int r_no) throws Exception{
		return reviewDao.reviewDeleteByNo(r_no);
	}
	
	//리뷰 원글을 삭제하면 댓글까지 모두 삭제
	public int reviewDeleteByNoAll (int r_groupno) throws Exception{
		return reviewDao.reviewDeleteByNoAll(r_groupno);
	}
	
	
	//리뷰 번호로 리뷰조회
	public Review reviewSelectNo(int r_no) throws Exception{
		return reviewDao.reviewSelectNo(r_no);
	}
	
	//책 번호로 리뷰 조회
	public List<Review> reviewSelectByBookNo(Review review) throws Exception{
		return reviewDao.reviewSelectByBookNo(review);
	}
	
	//회원 아이디로 리뷰 조회
	public List<Review> reviewSelectByUserId(String u_id) throws Exception{
		return reviewDao.reviewSelectByUserId(u_id);
	}
	
	//총 리뷰 수 구하기
	public int reviewCountAll() throws Exception{
		return reviewDao.reviewCountAll();
	}
	
	//해당 리뷰의 총 댓글 수
	public int reviewReplyCount(int groupno) throws Exception{
		return reviewDao.reviewReplyCount(groupno);
	}
	
	
	
	
	
	
	
	
	
}
