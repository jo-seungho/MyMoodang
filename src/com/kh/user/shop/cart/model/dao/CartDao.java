package com.kh.user.shop.cart.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.user.shop.cart.model.vo.Cart;
import com.kh.user.shop.item.model.dao.ItemDao;

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
	 * 장바구니 추가
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

    

}


