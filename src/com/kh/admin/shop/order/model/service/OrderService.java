package com.kh.admin.shop.order.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.common.model.vo.AdminPageInfo;
import com.kh.admin.shop.item.model.dao.ItemDao;
import com.kh.admin.shop.item.model.vo.Item;
import com.kh.admin.shop.order.model.dao.OrderDao;
import com.kh.admin.shop.order.model.vo.Order;
import com.kh.common.JDBCTemplate;

//2023-04-19 최명진 관리자 주문관리 페이지 서비스
public class OrderService {

	// 모든 주문목록 카운트 조회용
	public int selectListCount() {

		Connection conn = getConnection();

		int listCount = new OrderDao().selectListCount(conn);

		close(conn);

		return listCount;
	}
	
	//모든 주문목록 검색 카운트 조회용
	public int selectSearchAllCount(String value, String keyword) {

		Connection conn = getConnection();

		int listCount = new OrderDao().selectSearchAllCount(conn, value, keyword);

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
	
	// 모든 주문목록에 대한 검색기록 조회
	public ArrayList<Order> selectSearchAllOrderList(AdminPageInfo pi, String value, String keyword) {

		Connection conn = getConnection();

		ArrayList<Order> list = new OrderDao().selectSearchAllOrderList(conn, pi, value, keyword);

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
	
	//업데이트 조회
	public Order updateOrderStatus(int orderNo, String status) {
		
		Connection conn = getConnection();
		
		Order o = new OrderDao().updateOrderStatus(conn, orderNo, status);
		
		if(o!= null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return o;
	}

	//상품 한개 조회
	public Order selectOrder(int id) {
		
		Connection conn = getConnection();
		
		Order o = new OrderDao().selectOrder(conn, id);
		
		close(conn);
		
		return o;
	}

	

	

}
