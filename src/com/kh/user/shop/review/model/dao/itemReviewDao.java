package com.kh.user.shop.review.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.user.shop.review.model.vo.Review;

public class itemReviewDao {

    	private Properties prop = new Properties();

    public itemReviewDao() {            

		String fileName = itemReviewDao.class.getResource("/sql/user/item/review-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

    }
    public ArrayList<Review> selectReviewList(Connection conn, int bno) {

        // 필요한 변수 셋팅
        ArrayList<Review> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        // 실행할 쿼리
        String sql = prop.getProperty("selectReviewList");

        try {

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);

            rset = pstmt.executeQuery();

            while (rset.next()) {

            list.add(new Review(rset.getInt("REVIEW_NO"),
                                rset.getString("TITLE"),
                                rset.getString("CONTENT"),
                                rset.getString("WRITE_DATE"),
                                rset.getInt("STAR_POINT"),
                                rset.getInt("ORDER_NO"),
                                rset.getInt("ITEM_CODE")));
                
       
            }

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            close(rset);
            close(pstmt);

        }

        return list;

    }
	public int deleteReview(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
    



}



