package com.kh.user.shop.order.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.user.shop.order.model.dao.OrderDao;
import com.kh.user.shop.order.model.vo.Order;

// 2023-04-24 조승호
public class OrderService {

	/**
	 * 2023-04-24 조승호
	 * 배송주소 조회
	 * @param userNo
	 * @return
	 */
	public int SelectAddress(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().SelectAddress(conn, userNo);
		
		close(conn);
		
		return result;
	}

	/**
	 * 2023-04-24 조승호
	 * 주문 테이블에 정보 추가
	 * @param o
	 * @return
	 */
	public int insertOrder(Order o) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().insertOrder(conn, o);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/**
	 * 2023-04-24 조승호
	 * 결제 완료시 장바구니 목록 삭제
	 * @param userNo
	 * @return
	 */
	public int DeleteCart(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().DeleteCart(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}



}
