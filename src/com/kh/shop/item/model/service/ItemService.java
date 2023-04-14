package com.kh.shop.item.model.service;

import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.shop.item.model.dao.ItemDao;
import com.kh.shop.item.model.vo.Item;


public class ItemService {
	
	
	public int increaseCount(int itemNo) {
		
		Connection conn = getConnection();

		int result = new ItemDao().increaseCount(conn, itemNo);

		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}

	public Item selectItem(int itemNo) {
		Connection conn = getConnection();

		Item i = new ItemDao().selectItem(conn, itemNo);

		JDBCTemplate.close(conn);

		return i;
	}
}
