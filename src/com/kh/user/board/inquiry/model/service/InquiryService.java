package com.kh.user.board.inquiry.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.user.board.inquiry.model.dao.InquiryDao;
import com.kh.user.board.inquiry.model.vo.Inquiry;


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


	/**
	 * 1:1 문의 등록용 메소드
	 * 2023-04-18 김서영
	 * @param in
	 * @return
	 */
	public int insertInquiry(Inquiry in) {

		Connection conn = getConnection();

		int result = new InquiryDao().insertInquiry(conn, in);

		if(result > 0) { // 등록 성공
			commit(conn);
		} else { // 등록 실패
			rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

}
