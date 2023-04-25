package com.kh.user.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.user.member.model.dao.MemberDao;
import com.kh.user.member.model.util.UUIDRandom;
import com.kh.user.member.model.vo.Member;
import com.kh.user.member.model.vo.ShippingAddress;

public class MemberService {


	/**
	 * 아이디 중복 체크 메소드 2023-04-14 김서영
	 *
	 * @param checkId
	 * @return
	 */
	public int idCheck(String checkId) {
		Connection conn = getConnection();

		int count = new MemberDao().idCheck(conn, checkId);

		JDBCTemplate.close(conn);

		return count;
	}


	/**
	 * 회원가입 시 회원정보, 주소를 입력하는 메소드 2023-04-16 김서영
	 *
	 * @param m
	 * @param addr
	 * @return
	 * @throws SQLException
	 */
	public int insertMember(Member m, ShippingAddress addr) {

		Connection conn = getConnection();

		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
		}

		int memberNo = new MemberDao().selectMemberNo(conn);
		m.setMemberNo(memberNo);

		int result1 = new MemberDao().insertMember(conn, m);

		addr.setMemberNo(memberNo);
		addr.setPhone(m.getPhone());

		int result2 = 0;

		if (result1 > 0) { // 회원정보 추가가 된 상황
			// 주소도 등록해야 함 (멤버 번호 받아야 하므로 => 핸드폰 번호가 똑같은 멤버의 번호 가져오기)
			result2 = new MemberDao().insertMemberAddr(conn, addr);
		}

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;

	}

	/* 로그인한 회원 본인 2023.04.17 이지환 */

	public ArrayList<ShippingAddress> selectShippingAddressList(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<ShippingAddress> list = new MemberDao().selectShippingAddressList(conn, memberNo);

		close(conn);

		return list;
	}

	/**
	 * 아이디 찾기 메소드 2023-04-17 김서영
	 *
	 * @param m
	 * @return
	 */
	public Member findId(Member m) {

		Connection conn = getConnection();

		Member fi = new MemberDao().findId(conn, m);

		close(conn);

		return fi;
	}

	/**
	 * 회원정보 수정 조회용 메소드 2023-04-17 김서영
	 *
	 * @param memberId
	 * @return
	 */
	public Member selectMemberInfo(String memberId) {

		Connection conn = getConnection();

		Member m = new MemberDao().selectMemberInfo(conn, memberId);

		close(conn);

		return m;
	}

	



	/**
	 * * 회원 정보 수정(기본정보 수정) 용 메소드
	 * 2023-04-20 김서영
	 * @param m
	 * @return
	 */
	public int updateInfoMember(Member m) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().updateInfoMember(conn, m);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}



	/**
	 * 회원 비밀번호 수정 용 메소드
	 * 2023-04-20 김서영
	 * @param m
	 * @param upPwd
	 * @return
	 */
	public boolean updatePwdMember(Member m, String upPwd) {

		Connection conn = JDBCTemplate.getConnection();

		boolean result = new MemberDao().updatePwdMember(conn, m, upPwd);

		System.out.println("서비스" + upPwd);
		if(result = true) {  // 비밀번호 수정 성공
			commit(conn);
		} else {  // 비밀번호 수정 실
			rollback(conn);
		}
		close(conn);

		return result;
	}


	/**
	 * 회원탈퇴용 메소드
	 * 김서영
	 * @param m
	 * @return
	 */
	public int deleteMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().deleteMember(conn, m);

//		System.out.println("서비스 : " + result);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}


	/**
	 * 비밀번호 찾기 회원의 정보조회용 메소드
	 * 2023-04-24 김서영
	 * @param m
	 * @return
	 */
	public int findPwdMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().findPwdMember(conn, m);

		close(conn);

		return result;
	}


	/**
	 * 임시비밀번호로 수정하는 메소드
	 * 2023-04-24 김서영
	 * @param extraPwd
	 * @param m
	 * @return
	 */
	public int updateExtraPwd(String extraPwd, Member m) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().updateExtraPwd(conn, extraPwd, m);

		if(result > 0) {

			String title = "안녕하세요. 마이무당입니다. 임시비밀번호 메일입니다.";
			String content =  "안녕하세요. "
					+ "\n 즐겁고 건강한 음식, 마이무당 입니다. "
					+ "\n\n 임시 비밀번호는 " + extraPwd + " 입니다. \n\n"
					+ "로그인 시, 비밀번호 입력 창에 해당 번호를 입력해주시기 바랍니다. "
					+ "\n\n 즐겁고 건강한 음식, 마이무당을 앞으로도 많이 찾아주시기 바랍니다. "
					+ "\n 사랑합니다. 고객님!";

			boolean sendResult = new EmailService().sendEmail(m.getEmail(), title, content);

			if(sendResult) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}/**
	 * 로그인 기능 2023-04-18 이지환
	 * 로그인 요청 기능
	 * @param m
	 * @return
	 */
	public Member loginUser(Member m) {


		Connection conn = JDBCTemplate.getConnection();

		Member loginUser =  new MemberDao().loginUser(conn, m);

		close(conn);


		return loginUser;
	}

	/**
	 * 2023.04.19 / 내 배송지 목록 조회/ 이지환
	 * @param memberNo
	 * @return
	 */
	public ArrayList<ShippingAddress> manageMyShippingAddressList(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();

		// 내 배송지 목록 조회
		ArrayList<ShippingAddress> shippingAddressList = new MemberDao().selectShippingAddressList(conn, memberNo);

		close(conn);

		return shippingAddressList;
	}



	public int updateShippingAddress(ShippingAddress updateMS) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().updateShippingAddress(conn, updateMS);
		System.out.println("update에서 얻어온 result");
		System.out.println(result);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	 /**
		 * 2023.04.21 / shipNo 를 기준으로 조회하기 위한 메소드 / 이지환
		 * @param shipNo
		 * @return
		 */
		public ShippingAddress selectByShipNo(int shipNo) {
			
			Connection conn = getConnection();
			
			// shipNo 를 기반으로 그 shipNo 에 해당하는 배송지 정보 조회
			// 2023.04.24 / selectShippingAddressByShipNo 에서 h 로 변경 / 이지환 */
			 ShippingAddress h = new MemberDao().selectListByShipNo(conn, shipNo);
			 
			 
				 close(conn);
				 
				 return h;
			 
	
		}

}

