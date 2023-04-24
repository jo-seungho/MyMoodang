package com.kh.user.shop.order.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.shop.order.model.dao.OrderDao;
import com.kh.user.shop.order.model.vo.OrderImg;
import com.kh.user.shop.order.model.vo.OrderList;

public class OrderService {


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


}
