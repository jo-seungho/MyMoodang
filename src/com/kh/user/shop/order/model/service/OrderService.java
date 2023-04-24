package com.kh.user.shop.order.model.service;


import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.shop.order.model.dao.OrderDao;
import com.kh.user.shop.order.model.vo.Order;
import com.kh.user.shop.order.model.vo.OrderImg;
import com.kh.user.shop.order.model.vo.OrderList;


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

	/**
	 * 주문내역 리스트 갯수 조회용 메소드
	 * 2023-04-24 김서영
	 * @param memberNo
	 * @return
	 */
	public int selectListCount(int memberNo) {

		Connection conn = getConnection();

		int listCount = new OrderDao().selectListCount(conn, memberNo);

		close(conn);

		return listCount;

	}


	/**
	 * 주문내역 리스트 조회용 메소드
	 * 2023-04-24 김서영
	 * @param pi
	 * @param memberNo
	 * @return
	 */
	public ArrayList<OrderList> selectList(PageInfo pi, int memberNo) {

		Connection conn = getConnection();

		ArrayList<OrderList> list = new OrderDao().selectList(conn, pi, memberNo);

		close(conn);

		return list;
	}



	/**
	 * 주문목록 중 최대 가격 이미지 불러오는 메소드
	 * 2023-04-24 김서영
	 * @param memberNo
	 * @return
	 */
	public OrderImg maxImgSelect(int memberNo) {

		Connection conn = getConnection();

		OrderImg img = new OrderDao().maxImgSelect(conn, memberNo);

		close(conn);

		return img;
	}

	public int SelectOrderNo() {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().SelectOrderNo(conn);
		
		close(conn);
		
		return result;
	}



}
