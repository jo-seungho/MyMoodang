package com.kh.admin.shop.order.model.dao;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.common.model.vo.AdminPageInfo;
import com.kh.admin.shop.item.model.dao.ItemDao;
import com.kh.admin.shop.order.model.vo.Order;

public class OrderDao {

	private Properties prop = new Properties();

	public OrderDao() {

		String fileName = ItemDao.class.getResource("/sql/admin/order/order-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 전체게시글 갯수 조회
	 * 2023-04-22 최명진
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectListCount");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			if (rset.next()) {
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
	 * 카테고리에 따른 주문 갯수 조회
	 * 2023-04-21 최명진
	 * @param conn
	 * @param category
	 * @return
	 */
	public int selectOrderStatusCount(Connection conn, String category) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectOrderStatusCount");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();

			if (rset.next()) {
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
	 * 모든 주문내역 조회
	 * 2023-04-21 최명진
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Order> selectAllOrderList(Connection conn, AdminPageInfo pi) {

		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectAllOrderList");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				list.add(new Order(rset.getInt("ORDER_NO"), rset.getString("MEMBER_ID"), rset.getInt("PAYMENT_AMOUNT"),
						rset.getString("ORDER_DATE"), rset.getString("SHIP_ADDR"), rset.getString("ORDER_STATUS")

				));
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
	 * 모든 검색결과에 대한 주문내역 리스트
	 * 2023-04-21 최명진
	 * @param conn
	 * @param pi
	 * @param search
	 * @param value
	 * @return
	 */
	public ArrayList<Order> selectSearchAllOrderList(Connection conn, AdminPageInfo pi, String search, String value) {
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = "";


		if (search.equals("MEMBER_ID")) {
			sql = prop.getProperty("selectSearchAllOrderList1");
			
		} else {
			sql = prop.getProperty("selectSearchAllOrderList2");
		}

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, "%" + value + "%");

			rset = pstmt.executeQuery();

			while (rset.next()) {

				list.add(new Order(rset.getInt("ORDER_NO"), rset.getString("MEMBER_ID"), rset.getInt("PAYMENT_AMOUNT"),
						rset.getString("ORDER_DATE"), rset.getString("SHIP_ADDR"), rset.getString("ORDER_STATUS")));
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
	 * 카테고리를 통한 주문내역 조회
	 * 2023-04-21 최명진
	 * @param conn
	 * @param pi
	 * @param category
	 * @return
	 */
	public ArrayList<Order> selectStatusOrderList(Connection conn, AdminPageInfo pi, String category) {

		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectStatusOrderList");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				list.add(new Order(rset.getInt("ORDER_NO"), rset.getString("MEMBER_ID"), rset.getInt("PAYMENT_AMOUNT"),
						rset.getString("ORDER_DATE"), rset.getString("SHIP_ADDR"), rset.getString("ORDER_STATUS")));
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
	 * 회원 배송상태 업데이트
	 * 2023-04-21 최명진
	 * @param conn
	 * @param orderNo
	 * @param status
	 * @return
	 */
	public Order updateOrderStatus(Connection conn, int orderNo, String status) {

		Order o = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("updateOrderStatus");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, orderNo);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				o = new Order();
				o.setOrderNo(orderNo);
				o.setOrderStatus(status);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return o;
	}

	/**
	 * 검색결과에 따른 목록 개수 조회
	 * 2023-04-21 최명진
	 * @param conn
	 * @param value
	 * @param keyword
	 * @return
	 */
	public int selectSearchAllCount(Connection conn, String value, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = "";
		if (value.equals("MEMBER_ID")) {
			sql = prop.getProperty("selectSearchAllCount1");
		} else if(value.equals("SHIPPING_ADDR")) {
			sql = prop.getProperty("selectSearchAllCount2");
		}

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();

			if (rset.next()) {
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
	 * 주문내역 1개 상세조회
	 * 2023-042-21 최명진
	 * @param conn
	 * @param id
	 * @return
	 */
	public Order selectOrder(Connection conn, int id) {
		
		Order o = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectOrder");
		
		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			rset = pstmt.executeQuery();
			
		
			
			if(rset.next()) {
				o = new Order(rset.getInt("ORDER_NO"), 
				rset.getString("MEMBER_ID"), 
				rset.getInt("TOTAL_PRICE"), 
				rset.getString("ORDER_DATE"), 
				rset.getString("SHIP_ADDR"), 
				rset.getString("ORDER_STATUS"), 
				rset.getString("ITEM_LIST"), 
				rset.getString("REQUEST"), 
				rset.getString("RES_PHONE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return o;
	}

}
