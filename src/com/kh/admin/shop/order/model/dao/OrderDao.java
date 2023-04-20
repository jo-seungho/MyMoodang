package com.kh.admin.shop.order.model.dao;

import static com.kh.common.JDBCTemplate.close;

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

				list.add(new Order(rset.getInt("ORDER_NO"),
						rset.getString("MEMBER_ID"),rset.getInt("PAYMENT_AMOUNT"),
						rset.getString("ORDER_DATE"),rset.getString("SHIP_ADDR"),
						rset.getString("ORDER_STATUS")
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

				list.add(new Order(rset.getInt("ORDER_NO"),
						rset.getString("MEMBER_ID"),rset.getInt("PAYMENT_AMOUNT"),
						rset.getString("ORDER_DATE"),rset.getString("SHIP_ADDR"),
						rset.getString("ORDER_STATUS")
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

	//회원의 배송상태를 업데이트
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
			
			if(result > 0) {
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

}
