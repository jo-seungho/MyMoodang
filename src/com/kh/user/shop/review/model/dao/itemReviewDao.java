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
    
//    public Review selectReview(Connection conn, int rno) {
//
//        Review r = null;
//        PreparedStatement pstmt = null;
//        ResultSet rset = null;
//
//        String sql = prop.getProperty("selectReview");
//
//        try {
//            pstmt = conn.prepareStatement(sql);
//            pstmt.setInt(1, rno);
//
//            rset = pstmt.executeQuery();
//
//            if(rset.next()) {
//                r = new Review(rset.getInt("REVIEW_NO"),
//                        rset.getString("TITLE"),
//                        rset.getString("CONTENT"),
//                        rset.getString("WRITE_DATE"),
//                        rset.getInt("STAR_POINT"),
//                        rset.getString("FILE_PATH_NAME"),
//                        rset.getInt("ORDER_NO"),
//                        rset.getInt("ITEM_CODE"));
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close(rset);
//            close(pstmt);
//        }
//
//        return r;
//
//    }
    
	public int deleteReview(Connection conn, int rno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
    
    public int updateReview(Connection conn, Review re) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("updateReview");

        try{
            pstmt = conn.prepareStatement(sql);
            //pstmt.setString(1, re.getTitle());
            pstmt.setString(1, re.getContent());
            //pstmt.setInt(3, re.getStarPoint());
            pstmt.setInt(2, re.getReviewNo());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;



    }
    public int insertReview(Connection conn, Review re) {

        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("insertReview");

        try{
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, re.getTitle());
            pstmt.setString(2, re.getContent());
            pstmt.setInt(3, re.getStarPoint());
            pstmt.setInt(4,re.getItemCode());
            pstmt.setInt(5,re.getMemberNo());
            

            result = pstmt.executeUpdate();

        }   catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;

    }
    
}



