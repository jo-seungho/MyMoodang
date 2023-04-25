package com.kh.admin.shop.review.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.shop.review.model.vo.Review;
import com.kh.common.model.vo.PageInfo;

public class ReviewDao {

	private Properties prop = new Properties();

	public ReviewDao() {

		String fileName = ReviewDao.class.getResource("/sql/admin/review/review-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 리뷰관리 리스트 조회수 메소드
	 * 2023-04-25 소현아
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String sql =prop.getProperty("selectListCount");

		try {
			
			pstmt = conn.prepareStatement(sql); 

			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;

	}



	/**
	 * 리뷰관리 리스트 조회용 메소드
	 * 2023-04-25 소현아
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectReviewList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				 Review r = new Review();
				 r.setOrderNo(rset.getInt("ORDER_NO"));
				 r.setStarPoint(rset.getInt("STAR_POINT"));
				 r.setTitle(rset.getString("TITLE"));
				 r.setMemberId(rset.getString("MEMBER_ID"));
				 r.setWriteDate(rset.getString("WRITE_DATE"));

				 list.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		
		return list;

	}
	
	
	
}
