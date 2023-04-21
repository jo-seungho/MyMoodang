package com.kh.admin.board.inquiry.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.admin.board.inquiry.model.dao.InquiryDao;
import com.kh.admin.board.inquiry.model.vo.Inquiry;


public class InquiryService {


	/**
	 * 1:1 문의 리스트 갯수 조회용 메소드
	 * 2023-04-21 소현아
	 * @return
	 */
	public int selectListCount() {

		Connection conn = getConnection();

		int listCount = new InquiryDao().selectListCount(conn);

		close(conn);

		return listCount;

	}


	/**
	 * 1:1 문의 리스트 조회용 메소드
	 * 2023-04-21 소현아
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectInquiryList(PageInfo pi) {

		Connection conn = getConnection();

		ArrayList<Inquiry> list = new InquiryDao().selectInquiryList(conn, pi);

		close(conn);

		return list;
	}

}
