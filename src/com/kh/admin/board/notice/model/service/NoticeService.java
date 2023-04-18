package com.kh.admin.board.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.user.board.inquiry.model.dao.InquiryDao;
import com.kh.admin.board.notice.model.dao.NoticeDao;
import com.kh.admin.board.notice.model.vo.Notice;

public class NoticeService {
	
	/**
	 * 공지사항 리스트 갯수 조회용 메소드
	 * 2023-04-18 소현아
	 * @return
	 */
	public int selectListCount() {

		Connection conn = getConnection();

		int listCount = new InquiryDao().selectListCount(conn);

		JDBCTemplate.close(conn);

		return listCount;

	}
	
	
		/**
		 * 공지사항 리스트 조회용 메소드
		 * 2023-04-14 소현아
		 * @return
		 */
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {

		// Connection 객체 생성
		Connection conn = getConnection();

		// Dao 로 Connection 넘기면서 요청 후 결과 받기
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn,pi);

		// Connection 반납
		close(conn);

		// 결과 반환
		return list;

	}

}
