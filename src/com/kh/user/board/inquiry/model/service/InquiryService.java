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
	public int selectListCount(int memberNo) {

		Connection conn = getConnection();

//		System.out.println("짜잔");
		int listCount = new InquiryDao().selectListCount(conn, memberNo);

		JDBCTemplate.close(conn);

		return listCount;

	}


	/**
	 * 1:1 문의 리스트 조회용 메소드
	 * 2023-04-17 김서영
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectList(PageInfo pi, int memberNo) {

		Connection conn = getConnection();

		ArrayList<Inquiry> list = new ArrayList<>();

		list = new InquiryDao().selectList(conn, pi, memberNo);

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


	/**
	 * 작성한 1:1 문의사항 정보 조회용 메소드
	 * 2023-04-18 김서영
	 * @param in
	 * @return
	 */
	public Inquiry selectInquiry(int ino) {

		Connection conn = getConnection();

		Inquiry inAll = new InquiryDao().selectInquiry(conn, ino);

		JDBCTemplate.close(conn);

		return inAll;
	}


	/**
	 * 1:1 문의 수정용 메소드
	 * 2023-04-18 김서영	 *
	 * @param in
	 * @return
	 */
	public int updateInquiry(Inquiry in) {

		Connection conn = getConnection();

//		Inquiry inAll = new InquiryDao().selectInquiry(conn, in)

		int result = new InquiryDao().updateInquiry(conn, in);

		if(result > 0) { // 등록 성공
			commit(conn);
		} else { // 등록 실패
			rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}



	/**
	 * 1:1 문의 삭제용 메소드
	 * 2023-04-19 김서영
	 * @param ino
	 * @return
	 */
	public int deleteInquiry(int ino) {

		Connection conn = getConnection();

		int result = new InquiryDao().deleteInquiry(conn, ino);

//		System.out.println("서비스임" + result);
		if(result > 0) {  // 삭제 성공
			commit(conn);
		} else { // 삭제 실패
			rollback(conn);
		}

		return ino;
	}


}
