package com.kh.user.shop.cart.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.shop.cart.model.dao.CartDao;
import com.kh.user.shop.cart.model.vo.Cart;
import com.kh.user.shop.order.model.vo.ItemList;

/**
 * 장바구니 목록 조회
 * 2023-04-19 조승호
 * @param conn
 * @return
 */
public class CartService {

	public ArrayList<Cart> selectCartList(int userNo) {

		Connection conn = getConnection();

		ArrayList<Cart> list = new CartDao().selectCartList(conn, userNo);

		close(conn);

		return list;
	}

	/**
	 * 장바구니 물품 추가
	 * 2023-04-21 조승호
	 * @param userNo
	 * @param countValue
	 * @param priceItem
	 * @param itemCodeNo
	 * @return
	 */
	public int insertCart(int userNo, int countValue, int priceItem, int itemCodeNo) {

		Connection conn = getConnection();

		int result = new CartDao().insertBoard(conn, userNo, countValue, priceItem, itemCodeNo);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

 		close(conn);

		return result;
	}

	/**
	 * 장바구니 물품 삭제
	 * 2023-04-21 조승호
	 * @param userNo
	 * @param itemCode
	 * @return
	 */
	public int DeleteCartItem(int userNo, int itemCode) {

		Connection conn = getConnection();

		int result = new CartDao().DeleteCartItem(conn, userNo, itemCode);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	/**
	 * 메인페이지 장바구니 갯수 조회
	 * 2023-04-21 조승호
	 * @param userNo
	 * @return
	 */
	public int countItem(int userNo) {

		Connection conn = getConnection();

		int result = new CartDao().countItem(conn, userNo);

		close(conn);

		return result;
	}




}
