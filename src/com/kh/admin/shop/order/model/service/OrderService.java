package com.kh.admin.shop.order.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.common.model.vo.AdminPageInfo;
import com.kh.admin.shop.item.model.dao.ItemDao;
import com.kh.admin.shop.item.model.vo.Item;
import com.kh.admin.shop.order.model.dao.OrderDao;
import com.kh.admin.shop.order.model.vo.Order;

//2023-04-19 최명진 관리자 주문관리 페이지 서비스
public class OrderService {

	// 모든 주문목록 카운트 조회용
	public int selectListCount() {

		Connection conn = getConnection();

		int listCount = new OrderDao().selectListCount(conn);

		close(conn);

		return listCount;
	}

	// 주문상태에 따른 숫자 조회용
	public int selectOrderStatusCount(String category) {

		Connection conn = getConnection();

		int listCount = new OrderDao().selectOrderStatusCount(conn, category);

		close(conn);

		return listCount;
	}

	// 모든 주문목록 조회용
	public ArrayList<Order> selectAllOrderList(AdminPageInfo pi) {

		Connection conn = getConnection();

		ArrayList<Order> list = new OrderDao().selectAllOrderList(conn, pi);

		close(conn);

		return list;
	}

	// 주문 상태에 따른 조회용
	public ArrayList<Order> selectStatusOrderList(AdminPageInfo pi, String category) {

		Connection conn = getConnection();

		ArrayList<Order> list = new OrderDao().selectStatusOrderList(conn, pi, category);

		close(conn);

		return list;
	}

	public Order updateOrderStatus(int orderNo, String status) {
		
		Connection conn = getConnection();
		
		Order o = new OrderDao().updateOrderStatus(conn, orderNo, status);
		
		close(conn);
		
		return o;
	}

}
