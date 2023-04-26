package com.kh.user.shop.order.model.dao;
// 2023-04-24 조승호
import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.shop.cart.model.dao.CartDao;
import com.kh.user.shop.order.model.vo.Order;
import com.kh.user.shop.order.model.vo.OrderImg;
import com.kh.user.shop.order.model.vo.OrderList;

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
			close(rset);
			close(pstmt);
		}
		return result;
	}


	/**
	 * 주문내역 리스트 갯수 조회용 메소드
	 * 2023-04-24 김서영
	 * @param conn
	 * @param memberNo
	 * @return
	 */
	public int selectListCount(Connection conn, int memberNo) {

		int listCount = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("selectListCount");

		try {
			// int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);

			listCount = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return listCount;
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
			pstmt.setString(2, o.getTrackingNo());
			pstmt.setInt(3, o.getMemberNo());
			pstmt.setInt(4, o.getShipNo());
			pstmt.setInt(5, o.getPaymentAmount());
			
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


	/**
	 * 주문내역 리스트 조회용 메소드
	 * 2023-04-24 김서영
	 * @param conn
	 * @param pi
	 * @param memberNo
	 * @return
	 */
	public ArrayList<OrderList> selectList(Connection conn, PageInfo pi, int memberNo) {

		ArrayList<OrderList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			// int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

//			if(rset.next()) {
//				OrderList ol = new OrderList(rset.getInt("ORDER_NO")
//											, rset.getString("ORDER_STATUS")
//											, rset.getString("ORDER_DATE")
//											, rset.getString("ITEM_LIST")
//											, rset.getInt("TOTAL_PRICE"));
//				list.add(ol);
//			}
			while(rset.next()) {
				OrderList ol = new OrderList(rset.getInt("ORDER_NO")
				, rset.getString("ORDER_STATUS")
				, rset.getString("ORDER_DATE")
				, rset.getString("ITEM_LIST")
				, rset.getInt("TOTAL_PRICE")
				, rset.getString("ITEM_IMG_PATH"));
					list.add(ol);
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
	 * 주문목록 중 최대 가격 이미지 불러오는 메소드
	 * 2023-04-24 김서영
	 * @param conn
	 * @param memberNo
	 * @return
	 */
	public OrderImg maxImgSelect(Connection conn, int memberNo) {

		OrderImg img = new OrderImg();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("maxImgSelect");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(++i, memberNo);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				img.setMaxPrice(rset.getInt("MAX_PRICE"));
				img.setItemImgPath(rset.getString("ITEM_IMG_PATH"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return img;
	}


	public int insertListItem(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertListItem");
		
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


	public ArrayList<Order> SelectOrderComplete(Connection conn, int userNo, int orderSelect) {
		
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("SelectOrderComplete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			pstmt.setInt(2, orderSelect);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Order(
						rset.getInt("ORDER_NO"),
						rset.getInt("DELIVERY_FEE"),
						rset.getString("REQUEST"),
						rset.getString("PHONE"),
						rset.getString("ORDER_DATE"),
						rset.getString("TRACKING_NO"),
						rset.getString("PAMENT"),
						rset.getString("PAYMENT_STATUS"),
						rset.getInt("MEMBER_NO"),
						rset.getInt("SHIP_NO"),
						rset.getInt("TOTAL_PRICE"),
						rset.getString("ORDER_STATUS"),
						rset.getInt("QUANTITY"),
						rset.getInt("PRICE"),
						rset.getString("ITEM_IMG"),
						rset.getString("NAME"),
						rset.getString("GRADE"),
						rset.getString("ADDRESS"),
						rset.getInt("ITEM_LIST_NO"),
						rset.getString("ITEM_NAME")
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



}
