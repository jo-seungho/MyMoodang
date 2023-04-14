<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->

    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="/resources/css/board/notice_detail.css">
    <link rel="stylesheet" href="../css/footer.css">

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="../js/header.js"></script>

    <title>공지사항상세</title>
  </head>
  <body>
 
		<%@ include file="../common/header.jsp" %>
		
                    <!-- 공지사항 페이지 시작 -->

          <div class="notice_detail">
             <strong>공지사항</strong>
             <div class="notice_detail_title">
               <p>마이무당의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
             </div>
             
             		
             		<br><br>


             <div class="board_view_wrap">
               <div class="notice_view">
                 <div class="title" align="left">
                   	마이무당만의 철학을 알려드립니다!
                 </div>
                 <div class="info" align="left">
                   <dl>
                     <dt class="notice_detail_num">번호 &nbsp;:</dt>
                     <dd>공지</dd>
                   </dl>
                   <dl>
                     <dt class="notice_detail_writer">작성자 &nbsp;:</dt>
                     <dd>health1004</dd>
                   </dl>
                   <dl>
                     <dt class="notice_detail_date">작성일 &nbsp;:</dt>
                     <dd>2023-04-07</dd>
                   </dl>
                   <dl>
                     <dt class="notice_detail_view">조회수 &nbsp;:</dt>
                     <dd>145</dd>
                   </dl>
                 </div>
                 <div class="cont" align="left">
                      
                      <br><br>
			                      마지막 경고입니다.<br>
			                      이제부터 건강을 챙겨야합니다.<br>
			                      무리하게 억지로 맛없는 음식으로 건강을 챙기지 마시고<br>
			                      당장 마이무당에서 맛있고 건강한 음식들을 주문해보세요.<br>
                 </div>

                 
             </div>
            </div>
           </div>

             <br><br>

                           




                        <!-- 공지사항 끝 -->
<%@ include file="../common/footer.jsp" %>

                       
  </body>
</html>
