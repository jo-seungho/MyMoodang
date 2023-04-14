package com.kh.board.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.notice.model.vo.Notice;
import com.kh.common.JDBCTemplate;

public class NoticeDao {

	private Properties prop = new Properties();

	public NoticeDao() {

		String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public ArrayList<Notice> selectNoticeList(Connection conn) {

		// 필요한 변수셋팅해주고
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 실행할 쿼리
		String sql = prop.getProperty("selectNoticeList");

		try {

			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				// 1번 방법 setter 이용하기
//				Notice n = new Notice();
//				n.setNoticeNo(rset.getInt("NOTICE_NO"));
//				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
//				n.setCreateDate(rset.getString("CREATE_DATE"));
//				n.setViews(rset.getInt("VIEWS")); 
				
				list.add(new Notice(rset.getInt("NOTICE_NO"), rset.getString("NOTICE_TITLE"),
						rset.getString("CREATE_DATE"), rset.getInt("VIEWS")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}

		return list;

	}

}
