//package com.kh.user.shop.cart.model.dao;
//
//import static com.kh.common.JDBCTemplate.*;
//import java.io.FileReader;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.Properties;
//
//import com.kh.user.shop.cart.model.vo.Cart;
//
//public class CartDao {
//
//    private Properties prop = new Properties();
//
//    public CartDao() {
//        String fileName = CartDao.class.getResource("/sql/user/cart/cart-mapper.xml").getPath();
//        try {
//            prop.load(new FileReader(fileName));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//	public ArrayList<Cart> selectCartList(Connection conn, int userNo) {
//		
//		ArrayList<Cart> list = new ArrayList<>();
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectCartList");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(1, userNo);
//			
//			rset = pstmt.executeQuery();
//			System.out.println(sql);
//			while(rset.next()) {
//				list.add(new Cart(
//						rset.getInt("CART_NO")
//					  , rset.getInt("CART_STOCK")	
//					  , rset.getInt("ITEM_PRICE")	
//					  , rset.getInt("DISCOUNTPRICE")	
//					  , rset.getInt("TOTAL_PRICE")	
//					  , rset.getInt("TOTAL_DISCOUNT_PRICE")	
//					  , rset.getInt("DIFFERENCE_PRICE")	
//					  , rset.getInt("MEMBERNO")	
//					  , rset.getString("ITEM_NAME")	
//						));
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		System.out.println(list);
//		return list;
//	}
//
//    
//
//}
//
//
