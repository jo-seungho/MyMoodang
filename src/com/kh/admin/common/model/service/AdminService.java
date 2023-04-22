package com.kh.admin.common.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.admin.common.model.dao.AdminDao;
import com.kh.admin.common.model.vo.AdminPage;

public class AdminService {

	
	/**
	 * 어드민 대시보드 메소드
	 * 2023-04-22 최명진
	 * @return
	 */
	public AdminPage adminInfo() {
		Connection conn = getConnection();

		AdminPage page = new AdminDao().adminInfo(conn);

		close(conn);
		
		return page;
	}

	

}
