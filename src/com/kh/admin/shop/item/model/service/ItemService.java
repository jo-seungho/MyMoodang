package com.kh.admin.shop.item.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.common.model.vo.AdminPageInfo;
import com.kh.admin.shop.item.model.dao.ItemDao;
import com.kh.admin.shop.item.model.vo.Item;


public class ItemService {
	
	
	public int increaseCount(int itemNo) {
		
		Connection conn = getConnection();

		int result = new ItemDao().increaseCount(conn, itemNo);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public Item selectItem(int itemNo) {
		Connection conn = getConnection();

		Item i = new ItemDao().selectItem(conn, itemNo);

		close(conn);

		return i;
	}
	

	
	
//	-----------------------------어드민-------------------------------------
	/**
	 * 상품관리에서 총 상품 갯수 조회
     * 2023-04-15 최명진
	 * @return
	 */
	public int selectListCount() {

		// 1. Connection 객체 생성
		Connection conn = getConnection();

		// 2. Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int listCount = new ItemDao().selectListCount(conn);

		// 3. 트랜잭션 처리 => SELECT 문이므로 패스

		// 4. Connection 객체 반납
		close(conn);

		// 5. 결과 반환
		return listCount;
	}
	
	
	public int selectListSale(String category) {

		// 1. Connection 객체 생성
		Connection conn = getConnection();

		// 2. Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int listCount = new ItemDao().selectListSale(conn, category);

		// 3. 트랜잭션 처리 => SELECT 문이므로 패스

		// 4. Connection 객체 반납
		close(conn);

		// 5. 결과 반환
		return listCount;
	}
	
	
	/**
	 * 2023-04-15 최명진
	 * 어드민 SelectItemList(전체 상품 리스트)
	 * @return
	 */
	public ArrayList<Item> selectItemList(AdminPageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Item> list = new ItemDao().selectItemList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Item> selectSaleItemList(AdminPageInfo pi, String category) {
		Connection conn = getConnection();
		
		ArrayList<Item> list = new ItemDao().selectSaleItemList(conn, pi, category);
		
		close(conn);
		
		return list;
	}
	

	

	
}
