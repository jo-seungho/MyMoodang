DROP TABLE NOTICE_FILE;
DROP TABLE NOTICE;

DROP TABLE INQUIRY;
DROP SEQUENCE SEQ_INQ;

DROP TABLE REVIEW;
DROP SEQUENCE REVIEW_SEQ;

DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_NNO;
DROP SEQUENCE SEQ_FNO;
DROP SEQUENCE SEQ_INO;

DROP TABLE WISHLIST;
DROP TABLE CART;

DROP SEQUENCE SEQ_CNO;

DROP TABLE ITEM_LIST;

DROP TABLE ITEM_IMG;
DROP TABLE ITEM;

DROP TABLE ORDERS;
DROP TABLE SHIPPING_ADDRESS;

DROP TABLE MEMBER;
DROP TABLE MEMBER_GRADE;
DROP TABLE COUPON;

DROP SEQUENCE SEQ_SHIP_NO;
DROP SEQUENCE SEQ_ORDER_NO;
----------------------------------
CREATE SEQUENCE SEQ_MNO
NOCACHE;

--회원 등급--
CREATE TABLE MEMBER_GRADE (
    GRADE_NO VARCHAR2(2) PRIMARY KEY,
    GRADE_NAME VARCHAR2(30) NOT NULL
);

--CREATE TABLE COUPON(
--    COUPON_NO NUMBER PRIMARY KEY,
--    NAME VARCHAR2(30) NOT NULL,
--    DEDUCTED_AMOUNT NUMBER NOT NULL,
--    MEMBER_NO NUMBER NOT NULL
--    CONSTRAINT FK_MEM_NO FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
--    );
--회원--
CREATE TABLE MEMBER (
	MEMBER_NO NUMBER PRIMARY KEY,
	MEMBER_ID VARCHAR2(60) UNIQUE NOT NULL,
	PASSWORD VARCHAR2(30) NOT NULL,
	NAME VARCHAR2(30) NOT NULL,
	BIRTH_DATE VARCHAR2(10) NOT NULL,
	GENDER CHAR(1) DEFAULT 'N' CHECK (GENDER IN('N', 'M', 'F')),
	EMAIL VARCHAR2(30) NOT NULL,
	PHONE VARCHAR2(11),
	ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    TOTAL_MONEY NUMBER DEFAULT 0 NOT NULL,
	GRADE_NO VARCHAR(2) DEFAULT '01' NOT NULL,
    CONSTRAINT FK_GRADE_NO FOREIGN KEY (GRADE_NO) REFERENCES MEMBER_GRADE (GRADE_NO)
);
--------------------------회원 코멘트-------------------------------------------
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원의 아이디는 중복이 안되서 UNIQUE';
COMMENT ON COLUMN MEMBER.BIRTH_DATE IS '1999-01-01 형식으로 입력';
COMMENT ON COLUMN MEMBER.GENDER IS 
'N - 선택 안함
M - 남성
F - 여성';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원의 이메일 작성
이메일 인증이기 때문에 필수 작성';
COMMENT ON COLUMN MEMBER.PHONE IS '회원 전화번호';
COMMENT ON COLUMN MEMBER.NON_MEMBER IS '탈퇴 여부 판별' ;




CREATE SEQUENCE SEQ_INO 
NOCACHE;

CREATE TABLE ITEM (
    ITEM_CODE NUMBER PRIMARY KEY,
	ITEM_CATEGORY VARCHAR2(100) NOT NULL,
	ITEM_DATE DATE DEFAULT SYSDATE,
	ITEM_NAME VARCHAR2(100) NOT NULL,
	ITEM_STOCK NUMBER DEFAULT 0 NOT NULL,
	ITEM_PRICE NUMBER NOT NULL,
	ITEM_HITS NUMBER DEFAULT 0 NOT NULL,
	ITEM_TEXT VARCHAR2(2000) NOT NULL,
	ITEM_DISCOUNT NUMBER,
    ITEM_STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL CHECK(ITEM_STATUS IN ('Y', 'N'))
);


COMMENT ON COLUMN ITEM.ITEM_CODE IS '상품코드';
COMMENT ON COLUMN ITEM.ITEM_CATEGORY IS '상품카테고리';
COMMENT ON COLUMN ITEM.ITEM_DATE IS '등록날짜';
COMMENT ON COLUMN ITEM.ITEM_NAME IS '상품이름';
COMMENT ON COLUMN ITEM.ITEM_STOCK IS '상품수량(재고)';
COMMENT ON COLUMN ITEM.ITEM_PRICE IS '상품가격';
COMMENT ON COLUMN ITEM.ITEM_HITS IS '상품조회수';
COMMENT ON COLUMN ITEM.ITEM_TEXT IS '상품내용';
COMMENT ON COLUMN ITEM.ITEM_DISCOUNT IS '상품할인율';
COMMENT ON COLUMN ITEM.ITEM_DISCOUNT IS '상품상태';


CREATE TABLE ITEM_IMG (
	ITEM_IMG_CODE NUMBER NOT NULL,
	ITEM_IMG_T_F VARCHAR2(1) DEFAULT 'Y' CHECK (ITEM_IMG_T_F IN('Y', 'N')),
    ITEM_IMAGE VARCHAR2(300) NOT NULL,
	ITEM_IMG_DELETE_T_F	VARCHAR2(1) DEFAULT 'Y' CHECK (ITEM_IMG_DELETE_T_F IN('Y', 'N')),
    FOREIGN KEY (ITEM_IMG_CODE) REFERENCES ITEM(ITEM_CODE)
);

COMMENT ON COLUMN ITEM_IMG.ITEM_IMG_CODE IS '상품이미지번호';
COMMENT ON COLUMN ITEM_IMG.ITEM_IMG_T_F IS '썸네일대표유무';
COMMENT ON COLUMN ITEM_IMG.ITEM_IMG_DELETE_T_F IS '파일 삭제 유무';
COMMENT ON COLUMN ITEM_IMG.ITEM_IMAGE IS '상품이미지';


 -- 장바구니번호 시퀀스


-- 찜목록 테이블
CREATE TABLE WISHLIST(
ITEM_CODE NUMBER NOT NULL,
MEMBER_NO NUMBER NOT NULL,
FOREIGN KEY (ITEM_CODE) REFERENCES ITEM(ITEM_CODE),
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

-- 찜목록 코멘트
COMMENT ON COLUMN WISHLIST.ITEM_CODE IS '상품코드번호';
COMMENT ON COLUMN WISHLIST.MEMBER_NO IS '회원번호';


--장바구니 시퀀스
CREATE SEQUENCE SEQ_CNO
NOCACHE;

-- 장바구니 테이블
CREATE TABLE CART(
CART_NO NUMBER PRIMARY KEY,
CART_STOCK NUMBER,
PRICE NUMBER,
MEMBER_NO NUMBER,
ITEM_CODE NUMBER,
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
FOREIGN KEY (ITEM_CODE) REFERENCES ITEM(ITEM_CODE)
);


-- 장바구니 코멘트
COMMENT ON COLUMN CART.CART_NO IS '장바구니번호';
COMMENT ON COLUMN CART.CART_STOCK IS '수량';
COMMENT ON COLUMN CART.PRICE IS '상품하나가격';
COMMENT ON COLUMN CART.MEMBER_ID IS '회원아이디';
COMMENT ON COLUMN CART.ITEM_CODE IS '상품코드번호';

-- 장바구니 예시 데이터

CREATE SEQUENCE SEQ_ORDER_NO
NOCACHE;
CREATE SEQUENCE SEQ_SHIP_NO
NOCACHE;


-- 배송지 관리
CREATE TABLE SHIPPING_ADDRESS (
    SHIP_NO NUMBER PRIMARY KEY,
    SHIP_ADDR VARCHAR2(100) NOT NULL,
    SHIP_ADDR_INFO VARCHAR2(100) NOT NULL,
    PHONE VARCHAR2(11) NOT NULL,
    SHIP_NAME VARCHAR2(30) NOT NULL,
    MEMBER_NO NUMBER NOT NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);
-- 2023-04-09 일 수정--
ALTER TABLE SHIPPING_ADDRESS ADD ZIPCODE VARCHAR2(5);


CREATE TABLE ORDERS (
    ORDER_NO NUMBER PRIMARY KEY,
	DELIVERY_FEE NUMBER	DEFAULT 3000 NOT NULL,
	REQUEST	VARCHAR2(100),
	RES_PHONE CHAR(11),
	ORDER_DATE DATE DEFAULT SYSDATE NOT NULL,
	ORDER_STATUS CHAR(1) DEFAULT 'Y' NOT NULL CHECK(ORDER_STATUS IN ('Y', 'N')),
    IS_VISIBLE CHAR(1) DEFAULT 'Y' NOT NULL CHECK(IS_VISIBLE IN ('Y', 'N')),
	TRACKING_NO	VARCHAR(255),
	PAYMENT_AMOUNT VARCHAR(255) NOT NULL,
    PAYMENT_NO	VARCHAR(255) NOT NULL,
	PAYMENT_STATUS	CHAR(1)	NOT NULL,
    MEMBER_NO NUMBER NOT NULL,
	SHIP_NO NUMBER NOT NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (SHIP_NO) REFERENCES SHIPPING_ADDRESS(SHIP_NO)
);

COMMENT ON COLUMN ORDERS.SHIP_NO IS 'SEQ';
COMMENT ON COLUMN ORDERS.DELIVERY_FEE IS '기본 배송비는 3000 으로 설정했습니다';
COMMENT ON COLUMN ORDERS.ORDER_STATUS IS '배송중 환불 배송완료';

------------------------------------- 1:1 문의 테이블 -------------------------------


CREATE SEQUENCE SEQ_INQ;

CREATE TABLE INQUIRY (
                      INQ_NO NUMBER PRIMARY KEY,
                      TITLE VARCHAR2(50) NOT NULL,
                      DESCRIPTION VARCHAR2(4000) NOT NULL,
                      DATE_CREATE DATE DEFAULT SYSDATE,
                      INQUIRY_TYPE VARCHAR2(30) NOT NULL,
                      REPLY_CONTENTS VARCHAR2(4000),
                      REPLY_DATE DATE DEFAULT SYSDATE,
                      MEMBER_NO NUMBER NOT NULL,
                      FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
                      );
                      

COMMENT ON COLUMN INQUIRY.INQ_NO IS '문의번호';
COMMENT ON COLUMN INQUIRY.TITLE IS '제목';
COMMENT ON COLUMN INQUIRY.DESCRIPTION IS '문의내용';
COMMENT ON COLUMN INQUIRY.DATE_CREATE IS '작성일';
COMMENT ON COLUMN INQUIRY.INQUIRY_TYPE IS '문의유형';
COMMENT ON COLUMN INQUIRY.REPLY_CONTENTS IS '답변내용';
COMMENT ON COLUMN INQUIRY.REPLY_DATE IS '답변일';
COMMENT ON COLUMN INQUIRY.MEMBER_NO IS '회원번호';

---------------------------------------- 리뷰 테이블 -------------------------------------------------


CREATE SEQUENCE REVIEW_SEQ
NOCACHE;

CREATE TABLE REVIEW(
                     REVIEW_NO NUMBER PRIMARY KEY,
                     TITLE VARCHAR2(40) NOT NULL,
                     CONTENT VARCHAR2(4000),
                     WRITE_DATE DATE DEFAULT SYSDATE,
                     STAR_POINT NUMBER NOT NULL,
                     FILE_PATH_NAME VARCHAR2(50),
                     ORDER_NO NUMBER NOT NULL,
                     ITEM_CODE NUMBER NOT NULL,
                     FOREIGN KEY (ORDER_NO) REFERENCES ORDERS(ORDER_NO),
                     FOREIGN KEY (ITEM_CODE) REFERENCES ITEM(ITEM_CODE)
);


COMMENT ON COLUMN REVIEW.REVIEW_NO IS '게시판번호';
COMMENT ON COLUMN REVIEW.TITLE IS '제목';
COMMENT ON COLUMN REVIEW.CONTENT IS '내용';
COMMENT ON COLUMN REVIEW.WRITE_DATE IS '작성일';
COMMENT ON COLUMN REVIEW.STAR_POINT IS '별점';
COMMENT ON COLUMN REVIEW.FILE_PATH_NAME IS '경로포함한 파일수정명';
COMMENT ON COLUMN REVIEW.ORDER_NO IS '주문번호';
-- 공지사항 시퀀스
CREATE SEQUENCE SEQ_NNO
NOCACHE;

-- 공지사항 테이블
CREATE TABLE NOTICE(
NOTICE_NO NUMBER NOT NULL PRIMARY KEY,
NOTICE_TITLE VARCHAR2(200) NOT NULL,
NOTICE_CONTENT CLOB NOT NULL,
CREATE_DATE DATE DEFAULT SYSDATE,
VIEWS NUMBER DEFAULT 0 NOT NULL,
DELETE_STATUS CHAR(1) DEFAULT 'N' NOT NULL,
CONSTRAINT CHECK_DELETE_STATUS CHECK(DELETE_STATUS IN ('N', 'Y'))
);
    
-- 공지사항 코멘트     
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항번호';      
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항제목';      
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지내용';      
COMMENT ON COLUMN NOTICE.CREATE_DATE IS '작성일';      
COMMENT ON COLUMN NOTICE.VIEWS IS '조회수';      
COMMENT ON COLUMN NOTICE.DELETE_STATUS IS '삭제여부(N/Y)';      
      
      
-- 파일정보 테이블
CREATE TABLE NOTICE_FILE(
    FILE_NO NUMBER NOT NULL PRIMARY KEY,
    FILE_NAME VARCHAR2(30) NOT NULL,
    NOTICE_NO NUMBER NOT NULL,
    CONSTRAINT FK_NOTICE_NO FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO)
    ON DELETE CASCADE
);

-- 파일정보 시퀀스
CREATE SEQUENCE SEQ_FNO
NOCACHE;

-- 파일정보 예시 데이터
INSERT INTO NOTICE_FILE
VALUES(SEQ_FNO.NEXTVAL, '파일1', 1);

INSERT INTO NOTICE_FILE
VALUES(SEQ_FNO.NEXTVAL, '파일2', 2);

-- 파일정보 코멘트
COMMENT ON COLUMN NOTICE_FILE.FILE_NO IS '파일일련번호';      
COMMENT ON COLUMN NOTICE_FILE.FILE_NAME IS '경로를포함한수정명';      
COMMENT ON COLUMN NOTICE_FILE.NOTICE_NO IS '공지사항번호';  


-- 주문상품 테이블
CREATE TABLE ITEM_LIST(
    ITEM_LIST_NO NUMBER PRIMARY KEY,
    ORDER_ITEM NUMBER NOT NULL,
    PRICE NUMBER NOT NULL,
    ORDER_NO NUMBER NOT NULL,
    ITEM_CODE NUMBER NOT NULL,
    CONSTRAINT FK_ORDER_NO FOREIGN KEY(ORDER_NO) REFERENCES ORDERS(ORDER_NO)
    ON DELETE CASCADE,
    CONSTRAINT FK_ITEM_CODE FOREIGN KEY(ITEM_CODE) REFERENCES ITEM(ITEM_CODE)
    ON DELETE CASCADE
    );

-- 주문상품 코멘트
COMMENT ON COLUMN ITEM_LIST.ITEM_LIST_NO IS '주문상품번호';   
COMMENT ON COLUMN ITEM_LIST.ORDER_NO IS '주문번호';   
COMMENT ON COLUMN ITEM_LIST.ITEM_CODE IS '상품코드';   
COMMENT ON COLUMN ITEM_LIST.ORDER_ITEM IS '주문상품수량';   
COMMENT ON COLUMN ITEM_LIST.PRICE IS '상품한개의가격';   


INSERT INTO MEMBER(MEMBER_NO,MEMBER_ID,PASSWORD,NAME,BIRTH_DATE,GENDER,EMAIL)
VALUES(SEQ_MNO.NEXTVAL,'admin','1234','관리자','19970303','M','dunghasd@gmail.com');

INSERT INTO MEMBER(MEMBER_NO,MEMBER_ID,PASSWORD,NAME,BIRTH_DATE,GENDER,EMAIL)
VALUES(SEQ_MNO.NEXTVAL,'user01','1234','홍길동','19960304','F','qwer@gmail.com');

INSERT INTO MEMBER(MEMBER_NO,MEMBER_ID,PASSWORD,NAME,BIRTH_DATE,GENDER,EMAIL)
VALUES(SEQ_MNO.NEXTVAL,'user02','1234','관리자','19950305','M','wqer@gmail.com');



INSERT INTO SHIPPING_ADDRESS
VALUES(
    SEQ_SHIP_NO.NEXTVAL,
    '경기도 광명시 하안동',
    '우리집',
    '01012345678',
    '리시버',
    1
);

INSERT INTO ORDERS
VALUES(
    SEQ_ORDER_NO.NEXTVAL,
    3000,
    '요청사항 없음',
    '01012345678',
    SYSDATE,
    'Y',
    'Y',
    '배송번호?',
    '사용자1',
    '요기요',
    'Y',
    1,
    1
);

INSERT INTO ITEM 
VALUES (SEQ_INO.NEXTVAL 
            , '샐러드'
            , DEFAULT
            , '무당 닭가슴살 샐러드'
            ,20
            ,8900
            ,DEFAULT
            ,'맛있게 건강한 무당 닭가슴살 샐러드'
            ,0.03
            ,'Y');




INSERT INTO ITEM_IMG 
VALUES (1
        ,DEFAULT
        ,'https://picsum.photos/id/237/200/300'
        ,DEFAULT
        );


INSERT INTO CART
VALUES(SEQ_CNO.NEXTVAL
     , 5
     , 1000
     , 1
     , 1
);


INSERT INTO SHIPPING_ADDRESS
VALUES (
    SEQ_SHIP_NO.NEXTVAL
  , '경기도 고양시 일산동구 중앙로 1256'
  , '일산동구청 주민자치과'
  , '0319788159'
  , '직장'
  , 1
    );


INSERT INTO NOTICE
VALUES(SEQ_NNO.NEXTVAL, 
      '공지사항1', 
      '과연 얼마나 들어가는지 궁금합니다',
      SYSDATE,
      1,
      'N');
INSERT INTO NOTICE
VALUES(SEQ_NNO.NEXTVAL, 
      '공지사항2', 
      '되게 많이 들어가나봐여',
      SYSDATE,
      1,
      'N');
    



INSERT INTO INQUIRY VALUES (SEQ_INQ.NEXTVAL
                                           , '도대체 언제 도착하나요?'
                                           , '주문한지 일주일이나 됐는데, 왜 아직도 안오죠?'
                                           , DEFAULT
                                           , 'QNA'
                                           , '상품이 오늘 입고되어 오늘 출고되었습니다. 1~2일 내 도착예정입니다.'
                                           , DEFAULT
                                           , 1);
                                            
                                            

INSERT INTO INQUIRY VALUES ( SEQ_INQ.NEXTVAL
                                           , '반품하고 싶습니다.'
                                           , '제로콜라 반품 원합니다.'
                                           , DEFAULT
                                           , 'QNA'
                                           , '마이페이지에서 반품신청 해주시기 바랍니다.'
                                           , DEFAULT
                                           , 1);


INSERT INTO ITEM_LIST
VALUES(
    SEQ_INO.NEXTVAL,
    3,
    1000,
    1,
    1
);




INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL
                                          , '신선해요.'
                                          , '샐러드에 채소들이 싱싱하네요.'
                                          , '2023-04-01'
                                          , '5'
                                          , NULL
                                          , 1
                                          , 1
);

INSERT INTO REVIEW VALUES (REVIEW_SEQ.NEXTVAL
                                          , '형편 없네, 진짜.'
                                          , '그래도 음식인데 이런식으로 장사합니까? 입고가 안 되면 안 됐다, 늦게 배송한다고 알려줘야지! 연락도 안 되고 말이야'
                                          , DEFAULT
                                          , '0'
                                          , NULL
                                          , 1
                                          , 1
);

INSERT INTO WISHLIST VALUES(1,1);

COMMIT;

SELECT * FROM MEMBER;
SELECT * FROM MEMBER_GRADE;

SELECT * FROM ITEM;
SELECT * FROM ITEM_IMG;

SELECT * FROM ORDERS;
SELECT * FROM SHIPPING_ADDRESS;

SELECT * FROM ITEM_LIST;

SELECT * FROM REVIEW;
SELECT * FROM INQUIRY;

SELECT * FROM CART;
SELECT * FROM WISHLIST;

SELECT * FROM NOTICE;
        
SELECT * FROM MEMBER_GRADE;




INSERT INTO MEMBER_GRADE VALUES('01', '왕초보당');
INSERT INTO MEMBER_GRADE VALUES('02', '초보당');
INSERT INTO MEMBER_GRADE VALUES('03', '중수당');
INSERT INTO MEMBER_GRADE VALUES('04', '고수당');

COMMIT;