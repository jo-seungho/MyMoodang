package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {

		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 어드민 회원관리 페이지에서 회원 리스트 불러오는 메소드
	// 2023-04-14 최명진
	public ArrayList<Member> selectMemberList(Connection conn) {

		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMemberList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setPassword(rset.getString("MEMBER_PWD"));
				m.setName(rset.getString("MEMBER_NAME"));
				m.setBirthDate(rset.getString("BIRTH_DATE"));
				m.setGender(rset.getString("GENDER"));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}


	/**
	 * 이메일 중복 체크 메소드
	 * 2023/04/14 김서영
	 * @param conn
	 * @param checkEmail
	 * @return
	 */
	public int emailCheck(Connection conn, String checkEmail) {

		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("emailCheck");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, checkEmail);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				count = rset.getInt("CNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return count;

	}

}
