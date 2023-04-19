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

    public ArrayList<Review> selectReviewList(int bno) {

        // Connection 객체 생성
        Connection conn = getConnection();

        // Dao 로 Connection 넘기면서 요청 후 결과 받기
        ArrayList<Review> list = new itemReviewDao().selectReviewList(conn,bno);

        // Connection 반납
        close(conn);

        // 결과 반환
        return list;
       
    }
	public int deleteReview(int bno) {
		Connection conn = getConnection();
		
		int result = new itemReviewDao().deleteReview(conn, bno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
