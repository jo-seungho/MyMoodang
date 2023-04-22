<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.admin.board.inquiry.model.vo.Inquiry"%> 
<% Inquiry in = (Inquiry)request.getAttribute("in"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="common2.jsp" %>
    <link href="/resources/css/admin/inquiry_detail.css" rel="stylesheet" />
    <title><%= in.getTitle() %></title>

  </head>

  <body class="sb-nav-fixed">
  	<%@ include file="sidebar.jsp" %>

      <div id="layoutSidenav_content">
        <main style="height: 100%">
          <div class="container px-6 white">
            <h2>1대1 문의 내용</h2>
            <hr />
            <div class="container">
              <div class="row center">
                <div class="col-6 xl-6">제목</div>
                <div class="col-2 xl-2">문의유형</div>
                <div class="col-2 xl-2">작성자</div>
                <div class="col-2 xl-2">작성일</div>
              </div>
              <hr />
              <div class="row center">
                <div class="col-6 xl-6"><%=in.getTitle() %></div>
                <div class="col-2 xl-2"><%=in.getInquiryType() %></div>
                <div class="col-2 xl-2"><%=in.getMemberId() %></div>
                <div class="col-2 xl-2"><%=in.getDateCreate() %></div>
              </div>
            </div>
            <hr />
            <textarea class="form-control-plaintext col-sm-5" rows="10" readonly>안녕하세요 상품문의 합니다.</textarea>
            <hr />
            <br />
            <h2>1대1 문의 답변</h2>
            <hr />
            <form action="/inquiryList.ad" method="post">
              <div class="row center">
                <div class="col-xl-12"><input type="text" name="title" class="form-control col-xl-12" value="" placeholder="제목을 입력해주세요" /></div>
              </div>
              <hr />
              <textarea name="content" class="form-control col-sm-5" rows="10"><%=in.getReplyContents() %></textarea>
              <div class="btns">
                <button id="btn" class="btn" onclick="inquiry()">목록</button>
                <button id="btn" class="btn" type="submit">작성</button>
              </div>
              <br /><br />
            </form>
          </div>
        </main>
        
        <script>
        
        function inquiry(){
      	  location.href = "/inquiryList.ad?currentPage=1";
        </script>
        
      </div>
  </body>
</html>
