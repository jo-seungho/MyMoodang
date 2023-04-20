package com.kh.user.board.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.board.notice.model.dao.NoticeDao;
import com.kh.user.board.notice.model.vo.Notice;

public class NoticeService {
	
	/**
	 * 공지사항 리스트 갯수 조회용 서비스
	 * 2023-04-18 소현아
	 * @return
	 */
	public int selectListCount() {

		Connection conn = getConnection();

		int listCount = new NoticeDao().selectListCount(conn);

		close(conn);

		return listCount;

	}
	
	
	 /**
	  * 공지사항 리스트 조회용 서비스
	  * 2023-04-14 소현아
	  * @return
	  */
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {

		// Connection 객체 생성
		Connection conn = getConnection();

		// Dao 로 Connection 넘기면서 요청 후 결과 받기
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, pi);

		// Connection 반납
		close(conn);

		// 결과 반환
		return list;

	}
	
	
	/**
	 * 공지사항 상세보기 조회수 증가용  서비스
	 * 2023-04-14 소현아
	 * @return
	 */
	public int increaseCount(int noticeNo) {
		
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		
		// 2. Dao 로 Connection 과 전달값 넘기면서 요청 후 결과받기
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		// 3. 트랜잭션 처리
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		// 4. Connection 반납
		close(conn);
		
		// 5. 결과 반환
		return result;
	}
	
	
	  /**
	   * 공지사항 상세조회용 서비스
	   * 2023-04-18 소현아
	   * @return
	   */
	public Notice selectNotice(int noticeNo) {
		
		// 1. Connection 생성
		Connection conn = getConnection();
		
		// 2. Dao 로 Connection 과 전달값을 넘기면서 요청 후 결과받기
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		
		// 3. 트랜잭션 처리 => 패스
		
		// 4. Connection 반납
		close(conn);
		
		// 5. 결과 반환
		return n;
	}
		
	

}