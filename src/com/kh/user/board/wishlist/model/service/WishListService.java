package com.kh.user.board.wishlist.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.shop.item.model.dao.ItemDao;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.user.board.wishlist.model.dao.WishListDao;
import com.kh.user.board.wishlist.model.vo.WishList;

public class WishListService {
	
	public int selectListCount(int id) {

		Connection conn = getConnection();

		int listCount = new WishListDao().selectListCount(conn, id);

		JDBCTemplate.close(conn);

		return listCount;

	}


	/**
	 * 찜목록 조회용 메소드
	 * 2023-04-23 최명진
	 * @param pi
	 * @return
	 */
	public ArrayList<WishList> selectWishList(PageInfo pi, int id) {

		Connection conn = getConnection();

		ArrayList<WishList> list = new ArrayList<>();

		list = new WishListDao().selectWishList(conn, pi, id);

		JDBCTemplate.close(conn);

		return list;
	}
	
	/**
	 * 찜목록 체크
	 * 2023-04-22 최명진
	 * @param code
	 * @param mno
	 * @return
	 */
	public int checkFavorite(int code, int mno) {
		
		Connection conn = getConnection();
		
		int result = new ItemDao().checkFavorite(conn, code, mno);
		
		close(conn);
		
		return result;
	}

	/**
	 * 찜목록 추가
	 * 2023-04-22 최명진
	 * @param code
	 * @param mno
	 * @return
	 */
	public int addFavorite(int code, int mno) {
		
		Connection conn = getConnection();
		
		int result = new ItemDao().addFavorite(conn, code, mno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/**
	 * 찜목록 삭제
	 * 2023-04-22 최명진
	 * @param code
	 * @param mno
	 * @return
	 */
	public int deleteFavorite(int code, int mno) {
		
		Connection conn = getConnection();
		
		int result = new ItemDao().deleteFavorite(conn, code, mno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


}
