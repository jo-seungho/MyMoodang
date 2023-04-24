package com.kh.user.shop.order.model.dao;

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
import com.kh.user.shop.order.model.vo.OrderImg;
import com.kh.user.shop.order.model.vo.OrderList;

public class OrderDao {


	private Properties prop = new Properties();

    public OrderDao() {
        String fileName = OrderDao.class.getResource("/sql/user/order/order-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
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
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(++i, memberNo);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return listCount;
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
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(++i, memberNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				OrderList ol = new OrderList(rset.getInt("ORDER_NO")
											, rset.getString("ORDER_STATUS")
											, rset.getString("ORDER_DATE")
											, rset.getString("ITEM_LIST")
											, rset.getInt("TOTAL_PRICE"));
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


}
