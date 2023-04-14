package com.kh.board.notice.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.notice.model.dao.NoticeDao;
import com.kh.board.notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> selectNoticeList() {

		// Connection 객체 생성
		Connection conn = getConnection();

		// Dao 로 Connection 넘기면서 요청 후 결과 받기
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);

		// Connection 반납
		close(conn);

		// 결과 반환
		return list;

	}

}
