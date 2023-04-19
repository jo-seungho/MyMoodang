package com.kh.user.shop.item.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.shop.item.model.dao.ItemDao;
import com.kh.user.shop.item.model.vo.Attachment;
import com.kh.user.shop.item.model.vo.Item;
import com.kh.user.shop.review.model.dao.itemReviewDao;
import com.kh.user.shop.review.model.vo.Review;


public class ItemService {
	
	/**
	 * 상품 상세보기에서 조회수 증가
     * 2023-04-16 이태화
	 * @param bno
	 * @param conn
	 * @return
	 */
	
	public int increaseCount(int bno) {
		
		Connection conn = getConnection();

		int result = new ItemDao().increaseCount(conn, bno);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	/**
	 * 상품 상세보기
	 * 2023-04-16 이태화
	 * @param bno
	 * @param conn
	 * @return
	 */
	public Item selectItem(int bno) {
		Connection conn = getConnection();

		Item i = new ItemDao().selectItem(conn, bno);

		close(conn);

		return i;
	}

	/**
	 * 상품 상세보기에서 이미지 조회
	 * 2023-04-16 이태화
	 * @param bno
	 * @param conn
	 * @return
	 */
	public ArrayList<Attachment> selelctAttachmentList(int bno) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new ItemDao().selectAttachmentList(conn, bno);
		
		close(conn);
		
		return list;
	}
	
	/**
     * 상품 상세보기에서 같은 카테고리 조회
     * 2023-04-18 이태화
     * @param category
     * @return
     */
	public ArrayList<Attachment> selelctAttachmentCategory(String category) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new ItemDao().selelctAttachmentCategory(conn, category);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Review> selectReviewList(int bno) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ItemDao().selectReviewList(conn, bno);
		
		close(conn);
		
		return list;
	}

	

	
	
//	-----------------------------어드민-------------------------------------
	/**
	 * 상품관리에서 총 상품 갯수 조회
     * 2023-04-15 최명진
	 * @return
	 */
	public int selectListCount() {

		// 1. Connection 객체 생성
		Connection conn = getConnection();

		// 2. Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int listCount = new ItemDao().selectListCount(conn);

		// 3. 트랜잭션 처리 => SELECT 문이므로 패스

		// 4. Connection 객체 반납
		close(conn);

		// 5. 결과 반환
		return listCount;
	}
	
	
	/**
	 * 2023-04-15 최명진
	 * 어드민 SelectItemList(전체 상품 리스트)
	 * @return
	 */
	public ArrayList<Item> selectItemListAd(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Item> list = new ItemDao().selectItemListAd(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 2023-04-16 조승호
	 * 리스트 갯수 조회용
	 * @return
	 */
	public int selectListCountUser(String category) {
		
		Connection conn = getConnection();
		
		int listCount = new ItemDao().selectListCountUser(conn, category);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 2023-04-16 조승호
	 * 전체 상품 리스트
	 * @return
	 */
	public ArrayList<Item> selectItemList(PageInfo pi, String category) {
		
		Connection conn = getConnection();
		
		ArrayList<Item> list = new ItemDao().selectItemList(conn, pi, category);
		
		close(conn);
		
		
		return list;
	}
	/**
	 * 2023-04-17 조승호
	 * 베스트 상품 리스트
	 * @return
	 */
	public ArrayList<Item> selectBestItemList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Item> list = new ItemDao().selectBestItemList(conn, pi);
		
		close(conn);
		
		return list;
	}

	/**
	 * 2023-04-17 조승호
	 * 신규 상품 리스트
	 * @return
	 */
	public ArrayList<Item> selectNewItemList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Item> list = new ItemDao().selectNewItemList(conn, pi);
		
		close(conn);
		
		return list;
	}

	/**
	 * 2023-04-17 조승호
	 * 할인 상품 리스트
	 * @return
	 */
	public ArrayList<Item> selectDiscountItemList(PageInfo pi) {

		Connection conn = getConnection();
		
		ArrayList<Item> list = new ItemDao().selectDiscountItemList(conn, pi);
		
		close(conn);
		
		return list;
	}

	
}