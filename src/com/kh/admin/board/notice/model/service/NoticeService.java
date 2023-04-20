package com.kh.admin.board.notice.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.admin.board.notice.model.dao.NoticeDao;
import com.kh.admin.board.notice.model.vo.Notice;

public class NoticeService {
	
	/**
	 * 관리자 공지사항 리스트 갯수 조회용 메소드
	 * 2023-04-18 소현아
	 * @return
	 */
	public int selectListCount() {

		Connection conn = getConnection();

		int listCount = new NoticeDao().selectListCount(conn);

		JDBCTemplate.close(conn);

		return listCount;

	}
	
	
		/**
		 * 관리자 공지사항 리스트 조회용 메소드
		 * 2023-04-18 소현아
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
	
	/**
	 * 관리자 공지사항 수정용 메소드
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
	
	
	
	/**
	 * 관리자 공지사항 업데이트 메소드
	 * 2023-04-18 소현아
	 * @return
	 */
	public int updateNotice(Notice n) {
		
		Connection conn = getConnection();
				
	    // 2_1. BOARD UPDATE 하는 요청 먼저 실행
		int result = new NoticeDao().updateNotice(conn, n);
				
			
		// 3. 트랜잭션 처리
		if(result > 0 ) { // 둘 다 성공할 경우만 commit
			commit(conn);
		} else { // 하나라도 실패할 경우 rollback
			rollback(conn);
		}
				
		// 4. Connection 반납
		close(conn);
				
		// 5. 결과 반환
		return result;
	}
	
	

}
