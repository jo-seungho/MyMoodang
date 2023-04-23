package com.kh.user.board.wishlist.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.board.wishlist.model.vo.WishList;

public class WishListDao {
	
	private Properties prop = new Properties();

	public WishListDao() {

		String fileName = WishListDao.class.getResource("/sql/user/wishList/wishList-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int selectListCount(Connection conn, int id) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String sql =prop.getProperty("selectListCount");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(++i, id);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
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
	 * 찜목록 리스트 조회
	 * 2023-04-23 최명진
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<WishList> selectWishList(Connection conn, PageInfo pi, int no) {
		ArrayList<WishList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectWishList");

		try {
			pstmt = conn.prepareStatement(sql);

			int i = 0;
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(++i, no);
			pstmt.setInt(++i, startRow);
			pstmt.setInt(++i, endRow);
			

			rset = pstmt.executeQuery();

			while(rset.next()) {
				WishList wi = new WishList();
			
				wi.setItemCode(rset.getInt("ITEM_CODE"));
				wi.setItemName(rset.getString("ITEM_NAME"));
				wi.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
				wi.setItemPrice(rset.getInt("ITEM_PRICE"));
				wi.setItemDiscount(rset.getDouble("ITEM_DISCOUNT"));
				wi.setItemImgPath(rset.getString("ITEM_IMG_PATH"));


				list.add(wi);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	/**
	 * 찜목록 상태 확인
	 * 2023-04-21 최명진
	 * @param conn
	 * @param code
	 * @param mno
	 * @return
	 */
	public int checkFavorite(Connection conn, int code, int mno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkFavorite");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setInt(2, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				result = rset.getInt("COUNT");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 찜목록 추가
	 * 2023-04-21 최명진
	 * @param conn
	 * @param code
	 * @param mno
	 * @return
	 */
	public int addFavorite(Connection conn, int code, int mno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("addFavorite");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setInt(2, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 찜목록 삭제
	 * 2023-04-21 최명진
	 * @param conn
	 * @param code
	 * @param mno
	 * @return
	 */
	public int deleteFavorite(Connection conn, int code, int mno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFavorite");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setInt(2, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

}
