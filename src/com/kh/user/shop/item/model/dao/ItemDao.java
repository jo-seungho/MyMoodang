package com.kh.user.shop.item.model.dao;

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
import com.kh.user.shop.item.model.vo.Attachment;
import com.kh.user.shop.item.model.vo.Item;
import com.kh.user.shop.review.model.vo.Review;

public class ItemDao {
	
	private Properties prop = new Properties();

	public ItemDao() {

		String fileName = ItemDao.class.getResource("/sql/user/item/item-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//-------------------------------------------------------------------------------------------------


	/**
     * 상품 상세보기에서 조회수 증가
     * 2023-04-16 이태화
     * @param bno
	 * @param conn
     * @return
     */
    public int increaseCount(Connection conn, int bno) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("increaseCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
	/**
     * 상품 상세보기
     * 2023-04-16 이태화
     * @param bno
	 * @param conn
     * @return
     */
    public Item selectItem(Connection conn, int bno) {
        Item i = null;	//보따리 형태 선언(보따리 주문)
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectItem");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);
            
            rset = pstmt.executeQuery();

			if(rset.next()) {
				i = new Item();//새 보따리 준비  보따리를 펼친다.
				
				//보따리에 물건 담기
				i.setItemCode(rset.getInt("ITEM_CODE"));
				i.setItemCategory(rset.getString("ITEM_CATEGORY"));
				i.setItemName(rset.getString("ITEM_NAME"));
				i.setItemPrice(rset.getInt("ITEM_PRICE"));
				i.setItemText(rset.getString("ITEM_TEXT"));
				i.setItemDiscount(rset.getDouble("ITEM_DISCOUNT"));
				i.setItemhits(rset.getInt("ITEM_HITS"));
				i.setItemImg(rset.getString("ITEM_IMG_PATH"));
				i.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
				i.setDescription(rset.getString("DESCRIPTION"));
				
				
			}
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	JDBCTemplate.close(rset);
        	JDBCTemplate.close(pstmt);
        }
        
        return i;
    }
    
	/**
     * 상품 상세보기에서 이미지 조회
     * 2023-04-16 이태화
     * @param bno
	 * @param conn
     * @return
     */
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int bno) {

		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();

				
				at.setItemImgPath(rset.getString("ITEM_IMG_PATH"));
				at.setItemImgCode(rset.getInt("ITEM_IMG_CODE"));
				
				
				
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
     * 상품 상세보기에서 같은 카테고리 조회
     * 2023-04-18 이태화
     * @param category
	 * @param conn
     * @return
     */
	public ArrayList<Attachment> selelctAttachmentCategory(Connection conn, String category) {
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selelctAttachmentCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Attachment at = new Attachment();
				
				at.setItemImgPath(rset.getString("ITEM_IMG_PATH"));
				at.setItemName(rset.getString("ITEM_NAME"));
				at.setItemPrice(rset.getInt("ITEM_PRICE"));
				at.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
				at.setItemImgCode(rset.getInt("ITEM_IMG_CODE"));
				
				list.add(at);
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
     * 상품 리뷰 리스트 조회
     * 2023-04-19 이태화
     * @param bno
     * @param conn
     * @return
     */

	public ArrayList<Review> selectReviewList(Connection conn, int bno) {

        // 필요한 변수 셋팅
        ArrayList<Review> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        // 실행할 쿼리
        String sql = prop.getProperty("selectReviewList");

        try {

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);
            
            rset = pstmt.executeQuery();

            while (rset.next()) {



				Review re = new Review();

				re.setReviewNo(rset.getInt("REVIEW_NO"));
				re.setTitle(rset.getString("TITLE"));
				re.setContent(rset.getString("CONTENT"));
				re.setWriteDate(rset.getString("WRITE_DATE"));
				re.setStarPoint(rset.getInt("STAR_POINT"));
				re.setItemCode(rset.getInt("ITEM_CODE"));
				re.setMemberNo(rset.getInt("MEMBER_NO"));
				re.setMemberId(rset.getString("MEMBER_ID"));

				list.add(re);
                
       
            }
      

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            close(rset);
            close(pstmt);

        }

        return list;

    }



    
    
    
    
    
//	-----------------------어드민-------------------------------
    /**
     * 상품관리에서 총 상품 갯수 조회
     * 2023-04-15 최명진
     * @param conn
     * @return
     */
    public int selectListCount(Connection conn) {
		// SELECT 문 => ResultSet (1행1열, 단일값, 숫자값) => int

				// 1. 필요한 변수들 먼저 셋팅
				int listCount = 0;
				PreparedStatement pstmt = null;
				ResultSet rset = null;

				// 2. 쿼리문 작성
				String sql = prop.getProperty("selectListCount");

				// 3. 쿼리문 실행
				try {
					pstmt = conn.prepareStatement(sql);
					rset = pstmt.executeQuery();

					if (rset.next()) {
						listCount = rset.getInt("COUNT");
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}

				return listCount;
			}

    
    /**
     * 어드민 상품관리 리스트 출력
     * 2023-04-15 최명진
     * @param conn
     * @param pi
     * @return
     */
	public ArrayList<Item> selectItemListAd(Connection conn, PageInfo pi) {
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectItemListAd");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				
				Item i = new Item();
				
				i.setItemCode(rset.getInt("ITEM_CODE"));
				i.setItemDate(rset.getString("ITEM_DATE"));
				i.setItemImg(rset.getString("ITEM_IMAGE"));
				i.setItemName(rset.getString("ITEM_NAME"));
				i.setItemStock(rset.getInt("ITEM_STOCK"));
				i.setItemPrice(rset.getInt("ITEM_PRICE"));
				i.setItemStatus(rset.getString("ITEM_STATUS"));
				
				list.add(i);
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
     * 게시글 개수 조회
     * 2023-04-17 조승호
     * @param conn
     * @param pi
     * @return
     */
	public int selectListCountUser(Connection conn, String category) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCountUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, category);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	
	
    /**
     * 전체 상품 리스트 조회
     * 2023-04-16 조승호
     * @param conn
     * @param pi
     * @return
     */
	public ArrayList<Item> selectItemList(Connection conn, PageInfo pi, String category, String keyword, String filter) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectItemList");
		
	    /**
	     * 상품 필터 기능
	     * 2023-04-25 이태화
	     */
		//--------필터에 따른 정렬 구분------------------------------------
		if(filter.equals("1")) {	//낮은가격
			sql += prop.getProperty("selectItemList_lowPrice");
		} 
		else if( filter.equals("2")) {	//높은가격
			sql += prop.getProperty("selectItemList_highPrice");
		}
		else if( filter.equals("3")) {	//등록순
			sql += prop.getProperty("selectItemList_datePrice");
		}
		else if( filter.equals("4")) {	//조회높은순
			sql += prop.getProperty("selectItemList_viewPrice");
		}
		else if( filter.equals("전체")) {	//전체보기
			sql += prop.getProperty("selectItemList_all");
			//null 조건 추가 (최명진)
		} else if (filter.equals(null)) {
			sql += prop.getProperty("selectItemList_all");
		}
		//----------------------------------------------------------
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = pi.getCurrentPage() * pi.getBoardLimit();
			
			pstmt.setString(1, category);
			pstmt.setString(2, category);
			pstmt.setString(3, keyword);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						  rset.getInt("ITEM_CODE")
						, rset.getString("ITEM_DATE")
						, rset.getString("ITEM_CATEGORY")
						, rset.getString("ITEM_IMG_PATH")
						, rset.getString("ITEM_NAME")
						, rset.getString("ITEM_TEXT")
						, rset.getInt("ITEM_STOCK")
						, rset.getInt("ITEM_PRICE")
						, rset.getInt("ITEM_HITS")
						, rset.getString("ITEM_STATUS")
						, rset.getString("DESCRIPTION")
						, rset.getInt("DISCOUNTPRICE")
						, rset.getDouble("ITEM_DISCOUNT")
						));
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
     * 인기 리스트 조회
     * 2023-04-17 조승호
     * @param conn
     * @param pi
     * @return
     */
	public ArrayList<Item> selectBestItemList(Connection conn, PageInfo pi) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBestItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = pi.getCurrentPage() * pi.getBoardLimit();
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						  rset.getInt("ITEM_CODE")
						, rset.getString("ITEM_DATE")
						, rset.getString("ITEM_CATEGORY")
						, rset.getString("ITEM_IMG_PATH")
						, rset.getString("ITEM_NAME")
						, rset.getString("ITEM_TEXT")
						, rset.getInt("ITEM_STOCK")
						, rset.getInt("ITEM_PRICE")
						, rset.getInt("ITEM_HITS")
						, rset.getString("ITEM_STATUS")
						, rset.getString("DESCRIPTION")
						, rset.getInt("DISCOUNTPRICE")
						, rset.getDouble("ITEM_DISCOUNT")
						));
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
     * 신규 리스트 조회
     * 2023-04-17 조승호
     * @param conn
     * @param pi
     * @return
     */
	public ArrayList<Item> selectNewItemList(Connection conn, PageInfo pi) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNewItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = pi.getCurrentPage() * pi.getBoardLimit();
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						  rset.getInt("ITEM_CODE")
						, rset.getString("ITEM_DATE")
						, rset.getString("ITEM_CATEGORY")
						, rset.getString("ITEM_IMG_PATH")
						, rset.getString("ITEM_NAME")
						, rset.getString("ITEM_TEXT")
						, rset.getInt("ITEM_STOCK")
						, rset.getInt("ITEM_PRICE")
						, rset.getInt("ITEM_HITS")
						, rset.getString("ITEM_STATUS")
						, rset.getString("DESCRIPTION")
						, rset.getInt("DISCOUNTPRICE")
						, rset.getDouble("ITEM_DISCOUNT")
						));
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
     * 할인 리스트 조회
     * 2023-04-17 조승호
     * @param conn
     * @param pi
     * @return
     */
	public ArrayList<Item> selectDiscountItemList(Connection conn, PageInfo pi) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectDiscountItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = pi.getCurrentPage() * pi.getBoardLimit();
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						  rset.getInt("ITEM_CODE")
						, rset.getString("ITEM_DATE")
						, rset.getString("ITEM_CATEGORY")
						, rset.getString("ITEM_IMG_PATH")
						, rset.getString("ITEM_NAME")
						, rset.getString("ITEM_TEXT")
						, rset.getInt("ITEM_STOCK")
						, rset.getInt("ITEM_PRICE")
						, rset.getInt("ITEM_HITS")
						, rset.getString("ITEM_STATUS")
						, rset.getString("DESCRIPTION")
						, rset.getInt("DISCOUNTPRICE")
						, rset.getDouble("ITEM_DISCOUNT")
						));
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
	 * 2023-04-18 조승호
	 * 메인페이지 탑 슬라이드 리스트
	 * @param conn
	 * @return
	 */
	public ArrayList<Item> discountList(Connection conn) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mainDiscountList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						rset.getInt("ITEM_CODE")
					  , rset.getString("ITEM_CATEGORY")	
					  , rset.getString("ITEM_DATE")	
					  , rset.getInt("ORIGINALPRICE")
					  , rset.getInt("DISCOUNTPRICE")
					  , rset.getString("ITEM_NAME")
					  , rset.getString("ITEM_TEXT")
					  , rset.getDouble("ITEM_DISCOUNT")
					  , rset.getString("ITEM_IMG_PATH")
					  , rset.getString("DESCRIPTION")
					  
					  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public ArrayList<Item> newList(Connection conn) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("newList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						rset.getInt("ITEM_CODE")
					  , rset.getString("ITEM_CATEGORY")	
					  , rset.getString("ITEM_DATE")	
					  , rset.getInt("ORIGINALPRICE")
					  , rset.getInt("DISCOUNTPRICE")
					  , rset.getString("ITEM_NAME")
					  , rset.getString("ITEM_TEXT")
					  , rset.getDouble("ITEM_DISCOUNT")
					  , rset.getString("ITEM_IMG_PATH")
					  , rset.getString("DESCRIPTION")
					  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public ArrayList<Item> bestList(Connection conn) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("bestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						rset.getInt("ITEM_CODE")
					  , rset.getString("ITEM_CATEGORY")	
					  , rset.getString("ITEM_DATE")	
					  , rset.getInt("ORIGINALPRICE")
					  , rset.getInt("DISCOUNTPRICE")
					  , rset.getString("ITEM_NAME")
					  , rset.getString("ITEM_TEXT")
					  , rset.getDouble("ITEM_DISCOUNT")
					  , rset.getString("ITEM_IMG_PATH")
					  , rset.getString("DESCRIPTION")
					  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Item> selectItemListSearch(Connection conn, PageInfo pi, String category, String keyword) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectItemListSearch");
		
		
		try {
		pstmt = conn.prepareStatement(sql);
			
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		
		pstmt.setString(1, category);
		pstmt.setString(2, category);
		pstmt.setString(3, keyword);
		pstmt.setInt(4, startRow);
		pstmt.setInt(5, endRow);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			list.add(new Item(
					  rset.getInt("ITEM_CODE")
					, rset.getString("ITEM_CATEGORY")
					, rset.getString("ITEM_DATE")
					, rset.getString("ITEM_NAME")
					, rset.getInt("ITEM_STOCK")
					, rset.getInt("ITEM_PRICE")
					, rset.getInt("ITEM_HITS")
					, rset.getString("ITEM_TEXT")
					, rset.getDouble("ITEM_DISCOUNT")
					, rset.getString("ITEM_IMG_PATH")
					, rset.getString("ITEM_STATUS")
					, rset.getInt("DISCOUNTPRICE")
					));
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return list;
 

	}
	public int selectReviewListCount(Connection conn, int bno) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			

			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public int selectItemListSearchCount(Connection conn, String keyword) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItemListSearchCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			

			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

}

