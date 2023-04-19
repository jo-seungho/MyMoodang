//package com.kh.user.shop.cart.model.service;
//
//import static com.kh.common.JDBCTemplate.*;
//
//import java.sql.Connection;
//import java.util.ArrayList;
//
//import com.kh.user.shop.cart.model.dao.CartDao;
//import com.kh.user.shop.cart.model.vo.Cart;
//
///**
// * 장바구니 목록 조회
// * 2023-04-19 조승호
// * @param conn
// * @return
// */
//public class CartService {
//
//	public ArrayList<Cart> selectCartList(int userNo) {
//		
//		Connection conn = getConnection();
//		
//		ArrayList<Cart> list = new CartDao().selectCartList(conn, userNo);
//		
//		close(conn);
//		
//		return list;
//	}
//
//
//
//
//}
