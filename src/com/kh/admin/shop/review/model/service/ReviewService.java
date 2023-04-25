package com.kh.admin.shop.review.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.shop.review.model.dao.ReviewDao;
import com.kh.admin.shop.review.model.vo.Review;
import com.kh.common.model.vo.PageInfo;

public class ReviewService {

	
	
	public int selectListCount() {

		Connection conn = getConnection();

		int listCount = new ReviewDao().selectListCount(conn);

		close(conn);

		return listCount;

	}


	/**
	 * 리뷰관리 리스트 조회용 메소드
	 * 2023-04-25 소현아
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectReviewList(PageInfo pi) {

		Connection conn = getConnection();

		ArrayList<Review> list = new ReviewDao().selectReviewList(conn, pi);

		close(conn);

		return list;
	}
	
	
	
	
	
}
