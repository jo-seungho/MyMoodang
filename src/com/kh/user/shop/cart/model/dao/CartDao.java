package com.kh.user.shop.cart.model.dao;

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
import com.kh.user.shop.cart.model.vo.Cart;
import com.kh.user.shop.order.model.vo.ItemList;

public class CartDao {

    private Properties prop = new Properties();

    public CartDao() {
        String fileName = CartDao.class.getResource("/sql/user/cart/cart-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

	public ArrayList<Cart> selectCartList(Connection conn, int userNo) {

		ArrayList<Cart> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectCartList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Cart(
						rset.getInt("CART_NO")
					  , rset.getInt("CART_STOCK")
					  , rset.getInt("ITEM_PRICE")
					  , rset.getInt("DISCOUNTPRICE")
					  , rset.getInt("TOTAL_PRICE")
					  , rset.getInt("TOTAL_DISCOUNT_PRICE")
					  , rset.getInt("DIFFERENCE_PRICE")
					  , rset.getInt("MEMBERNO")
					  , rset.getString("ITEM_NAME")
					  , rset.getString("ITEM_IMG_PATH")
					  , rset.getInt("ITEM_CODE")
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
	 * 장바구니 상품 추가
	 * 2023-04-21 조승호
	 * @param conn
	 * @param userNo
	 * @param countValue
	 * @param priceItem
	 * @param itemCodeNo
	 * @return
	 */
	public int insertBoard(Connection conn, int userNo, int countValue, int priceItem, int itemCodeNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCart");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, countValue);
			pstmt.setInt(2, priceItem);
			pstmt.setInt(3, userNo);
			pstmt.setInt(4, itemCodeNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
/**
 * 장바구니 상품 삭제
 * 2023-04-21 조승호
 * @param conn
 * @param userNo
 * @param itemCode
 * @return
 */
	public int DeleteCartItem(Connection conn, int userNo, int itemCode) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCartItem");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userNo);
			pstmt.setInt(2, itemCode);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * 메인페이지 장바구니 갯수 조회
	 * 2023-04-21 조승호
	 * @param conn
	 * @param userNo
	 * @return
	 */
public int countItem(Connection conn, int userNo) {

	int result = 0;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = prop.getProperty("countItem");

	try {
		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, userNo);

		rset = pstmt.executeQuery();

		if(rset.next()) {
			result = rset.getInt("COUNT(*)");
		}

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}

	return result;
}



}


