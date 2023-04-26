package com.kh.user.shop.review.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;


import com.kh.user.shop.review.model.dao.itemReviewDao;
import com.kh.user.shop.review.model.vo.Review;

public class itemReviewService {

//	public Review selectReview(int rno) {
//		Connection conn = getConnection();
//		
//		Review result = new itemReviewDao().selectReview(conn, rno);
//		
//		close(conn);
//		
//		return result;
	
       
    //}
	public int deleteReview(int rno) {
		Connection conn = getConnection();
		
		int result = new itemReviewDao().deleteReview(conn, rno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateReview(Review re) {
		Connection conn = getConnection();
		
		int result = new itemReviewDao().updateReview(conn, re);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertReview(Review re) {
		Connection conn = getConnection();
		
		int result = new itemReviewDao().insertReview(conn, re);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
