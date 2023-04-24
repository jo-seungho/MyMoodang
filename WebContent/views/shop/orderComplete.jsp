<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" href="/resources/css/shop/payment_order.css">
<link rel="stylesheet" href="/resources/css/shop/list.bundle.css">
<link rel="stylesheet" href="/resources/css/shop/cart1.css">
<link rel="stylesheet" href="/resources/css/shop/orderComplete.css">

<script src="/resources/js/shop/payment.js"></script>




<title>주문내역</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
    <div id="container" style="margin-top: 40px;">
        
        <div id="main" class="order_complete">
            <div id="content">
                
                <div class="page_aticle aticle_type2">
                    
                    
                    <div class="section_orderview">
                        <div class="head_aticle">
                            <h2 class="tit">주문내역</h2>
                        </div>

                        <div class="head_section link_type">
                            <h3 class="tit">주문번호 [주문번호 입력]</h3>
                            <span class="link">
                                배송 또는 상품에 문제가 있나요?
                                <a href="#">1:1 문의하기</a>
                            </span>
                        </div>

                        <form name="frmOrdView" method="POST" action="">
                            <table class="tbl tbl_type1">
                                <colgroup>
                                    <col style="width:80px;">
                                    <col style="width:auto">
                                    <col style="width:100px;">
                                    <col style="width:136px;">
                                </colgroup>

                                <tbody>
                                    <tr>
                                        <td class="thumb">
                                            <a href="#" style="background-image:url(https://res.kurly.com/mobile/img/1808/img_none_x2.png)"></a>
                                        </td>
                                        <td class="info">
                                            <div class="name">
                                                <a href="#" class="link">[상품명]</a>
                                            </div>
                                            <div class="name_package">
                                                <a href="#" class="link">[상품 카테고리]</a>
                                            </div>

                                            <div class="desc">
                                                <span class="price">가격</span>
                                                <span class="ea">0개</span>
                                            </div>
                                        </td>
                                        <td class="progress">
                                            <span class="end">
                                                결제완료
                                            </span>
                                        </td>
                                        <td class="action">
                                            <button type="button" class="btn btn_cart ga_tracking_event btn_cancel" >주문 취소</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="thumb">
                                            <a href="#" style="background-image:url(https://res.kurly.com/mobile/img/1808/img_none_x2.png)"></a>
                                        </td>
                                        <td class="info">
                                            <div class="name">
                                                <a href="#" class="link">[상품명]</a>
                                            </div>
                                            <div class="name_package">
                                                <a href="#" class="link">[상품 카테고리]</a>
                                            </div>

                                            <div class="desc">
                                                <span class="price">가격</span>
                                                <span class="ea">0개</span>
                                            </div>
                                        </td>
                                        <td class="progress">
                                            <span class="end">
                                                결제완료
                                            </span>
                                        </td>
                                        <td class="action">
                                            <button type="button" class="btn btn_cart ga_tracking_event btn_cancel" >주문 취소</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="thumb">
                                            <a href="#" style="background-image:url(https://res.kurly.com/mobile/img/1808/img_none_x2.png)"></a>
                                        </td>
                                        <td class="info">
                                            <div class="name">
                                                <a href="#" class="link">[상품명]</a>
                                            </div>
                                            <div class="name_package">
                                                <a href="#" class="link">[상품 카테고리]</a>
                                            </div>

                                            <div class="desc">
                                                <span class="price">가격</span>
                                                <span class="ea">0개</span>
                                            </div>
                                        </td>
                                        <td class="progress">
                                            <span class="end">
                                                결제완료
                                            </span>
                                        </td>
                                        <td class="action">
                                            <button type="button" class="btn btn_cart ga_tracking_event btn_cancel" >주문 취소</button>
                                        </td>
                                    </tr>

                                    
                                </tbody>
                            </table>
                        </form>

                        <div id="orderCancel" class="order_cancel">
                            <p class="cancel_notice">직접 주문취소는 ‘입금확인’ 상태일 경우에만 가능합니다.</p>
                        </div>

                        

                        <div class="head_section ">
                            <h3 class="tit">
                                결제정보
                            </h3>
                        </div>

                        <table class="tbl tbl_type2 tbl_type3">
                            <colgroup>
                                <col style="width:160px">
                                <col style="width:auto">
                            </colgroup>

                            <tbody>
                                <tr>
                                    <th>상품금액</th>
                                    <td>
                                        <span id="paper_goodsprice">
                                            0
                                        </span>
                                        원
                                    </td>
                                </tr>

                                <tr>
                                    <th>배송비</th>
                                    <td>
                                        <span id="paper_delivery_msg1">
                                            3,000
                                        </span>
                                        원
                                    </td>
                                </tr>

                                

                               

                                <tr>
                                    <th>적립금사용</th>
                                    <td>
                                        <span id="paper_emoney">
                                            0
                                        </span>
                                        원
                                    </td>
                                </tr>

                                <tr>
                                    <th>결제금액</th>
                                    <td>
                                        <span id="paper_settlement">
                                            999,999,999
                                        </span>
                                        원
                                    </td>
                                </tr>

                                <tr>
                                    <th>적립예정금액</th>
                                    <td>
                                        0원
                                    </td>
                                </tr>

                                <tr>
                                    <th>결제방법</th>
                                    <td>
                                        카카오페이
                                    </td>
                                </tr>

                                
                            </tbody>
                        </table>

                        <div class="head_section">
                            <h3 class="tit">주문정보</h3>
                        </div>

                        <table class="tbl tbl_type2">
                            <colgroup>
                                <col style="width:160px">
                                <col style="width:auto">
                            </colgroup>

                            <tbody>
                                <tr>
                                    <th>주문 번호</th>
                                    <td>[주문 번호]</td>
                                </tr>

                                <tr>
                                    <th>주문자명</th>
                                    <td>[이름]</td>
                                </tr>

                                <tr>
                                    <th>보내는 분</th>
                                    <td>[이름]</td>
                                </tr>

                                <tr>
                                    <th>결제일시</th>
                                    <td>[날짜데이터 ex)2020-12-17 12:29:04]</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="head_section">
                            <h3 class="tit">배송 정보</h3>
                        </div>

                        <table class="tbl tbl_type2">
                            <colgroup>
                                <col style="width:160px">
                                <col style="width:auto">
                            </colgroup>

                            <tbody>
                                <tr>
                                    <th>받는 분</th>
                                    <td>[이름]</td>
                                </tr>

                                <tr>
                                    <th>핸드폰</th>
                                    <td>
                                        010-1111-1234
                                    </td>
                                </tr>

                                <tr>
                                    <th>배송방법</th>
                                    <td>샛별배송</td>
                                </tr>

                                <tr>
                                    <th>주소</th>
                                    <td>
                                        [우편번호]
                                        [상세주소]
                                    </td>
                                </tr>

                                <tr>
                                    <th>받으실 장소</th>
                                    <td>문 앞</td>
                                </tr>

                            </tbody>
                        </table>



                    </div>

                </div>
            </div>
        </div>
    </div>	
	
	<%@ include file="../common/footer.jsp"%>
</body>
</html>