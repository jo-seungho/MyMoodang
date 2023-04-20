package com.kh.admin.board.notice.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.admin.board.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop = new Properties();

	public NoticeDao() {

		String fileName = NoticeDao.class.getResource("/sql/admin/notice/notice-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 관리자 공지사항 리스트 갯수 조회용 메소드
	 * 2023-04-18 소현아
	 * @param conn
	 * @return
	 */
public int selectListCount(Connection conn) {
		
		// SELECT 문 => ResultSet (1행 1열, 단일값, 숫자값) => int
		
		// 1. 필요한 변수들 먼저 셋팅
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("selectListCount");
		
		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			
			
			// 3_2. 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 4. 조회된 결과를 변수로 가공하기
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT"); // 별칭으로도 데이터 뽑기 가능
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 5. 자원 반납 (생성 순서의 역순)
			close(rset);
			close(pstmt);
		}
		
		// 6. 결과 반환
		return listCount;
	}
	

	/**
	 * 관리자 공지사항 리스트 조회용 메소드 
	 * 2023-04-19 소현아
	 * @param conn
	 * @return
	 */
	public ArrayList<Notice> selectNoticeList(Connection conn, PageInfo pi) {

		// 필요한 변수셋팅해주고
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 실행할 쿼리
		String sql = prop.getProperty("selectNoticeList");

		try {

			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				
				list.add(new Notice(rset.getInt("NOTICE_NO")
						          , rset.getString("NOTICE_TITLE")
						          , rset.getString("CREATE_DATE")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(rset);
			close(pstmt);

		}

		return list;

	}
	
	/**
	 * 공지사항 수정용 메소드 
	 * 2023-04-18 소현아
	 * @param conn
	 * @return
	 */
	public Notice selectNotice(Connection conn, int noticeNo) {
		
		// SELECT 문 => ResultSet (단일행 조회) => Board
		
		// 1. 필요한 변수들 먼저 셋팅
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("selectNotice");
		
		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 3_1. 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, noticeNo);
			
			// 3_2. 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 4. 조회된 결과를 VO 로 가공
			if(rset.next()) {
				
				n = new Notice(rset.getInt("NOTICE_NO")
							, rset.getString("NOTICE_TITLE")
							, rset.getString("NOTICE_CONTENT")
							, rset.getString("CREATE_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 5. 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		// 6. 결과 반환
		return n;
	}

	/**
	 * 관리자 공지사항 수정용 메소드 
	 * 2023-04-19 소현아
	 * @param conn
	 * @return
	 */
	public int updateNotice(Connection conn, Notice n) {
	
		int result = 0;
		PreparedStatement pstmt = null;
				
		// 실행할 쿼리문
		String sql = prop.getProperty("updateNotice");
				
		try {
			pstmt = conn.prepareStatement(sql);
						
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			System.out.println(n.getNoticeTitle());
			result = pstmt.executeUpdate();
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		
	}
	

	
	
}
