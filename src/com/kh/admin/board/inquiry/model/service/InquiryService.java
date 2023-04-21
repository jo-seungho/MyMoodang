package com.kh.admin.board.inquiry.model.service;

import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.admin.board.inquiry.model.dao.InquiryDao;
import com.kh.admin.board.inquiry.model.vo.Inquiry;


public class InquiryService {


	/**
	 * 1:1 문의 리스트 갯수 조회용 메소드
	 * 2023-04-17 김서영
	 * @return
	 */
	public int selectListCount() {

		Connection conn = getConnection();

//		System.out.println("짜잔");
		int listCount = new InquiryDao().selectListCount(conn);

		JDBCTemplate.close(conn);

		return listCount;

	}


	/**
	 * 1:1 문의 리스트 조회용 메소드
	 * 2023-04-17 김서영
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectList(PageInfo pi) {

		Connection conn = getConnection();

		ArrayList<Inquiry> list = new ArrayList<>();

		list = new InquiryDao().selectList(conn, pi);

		JDBCTemplate.close(conn);

		return list;
	}

}
