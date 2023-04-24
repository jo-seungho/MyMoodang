package com.kh.user.shop.order.model.dao;
// 2023-04-24 조승호

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.user.shop.cart.model.dao.CartDao;
import com.kh.user.shop.order.model.vo.Order;

public class OrderDao {
	
    private Properties prop = new Properties();

    public OrderDao() {
        String fileName = CartDao.class.getResource("/sql/user/order/order-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 2023-04-24 조승호
     * 배송주소 조회
     * @param conn
     * @param userNo
     * @return
     */
	public int SelectAddress(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("SelectAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("SHIP_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 2023-04-24 조승호
	 * 주문테이블에 정보 추가
	 * @param conn
	 * @param o
	 * @return
	 */
	public int insertOrder(Connection conn, Order o) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("OrderService");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, o.getResPhone());
			pstmt.setInt(2, o.getMemberNo());
			pstmt.setInt(3, o.getShipNo());
			pstmt.setInt(4, o.getPaymentAmount());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 2023-04-24 조승호
	 * 결제 완료시 장바구니 목록 삭제 
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int DeleteCart(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("DeleteCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



}
