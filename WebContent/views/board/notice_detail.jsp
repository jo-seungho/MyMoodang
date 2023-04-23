<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.user.board.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/board/notice_detail.css">

    <title>공지사항 상세</title>
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
                   	<%= n.getNoticeTitle() %>
                 </div>
                 <div class="info" align="left">
                   <dl>
                     <dt class="notice_detail_num">번호: &nbsp;<%=n.getNoticeNo()%> </dt>
                   </dl>
                   <dl>
                     <dt class="notice_detail_date">작성일: &nbsp;<%=n.getCreateDate() %></dt>
                   </dl>
                   <dl>
                     <dt class="notice_detail_view">조회수: &nbsp;<%=n.getViews() %></dt>
                   </dl>
                 </div>
                 <div class="cont" align="left"><%=n.getNoticeContent() %></div>


             </div>
            </div>
           </div>

             <br><br>

                        <!-- 공지사항 끝 -->
<%@ include file="../common/footer.jsp" %>


  </body>
</html>
