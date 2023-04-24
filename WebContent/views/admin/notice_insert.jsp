<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="common2.jsp"%>
    <%@ include file="summernote.jsp"%>
    <title>관리자 페이지</title>

   
  </head>

  <style>
    #btn {
      background-color: #fe7477;
      color: white;
      border: 1px solid white;
      float: right;
      margin-right: 4px;
    }
    /* 자체적인 css */
    .row {
      float: none;
      margin: 0 auto;
    }
    /* col과 input text 라인 맞춰주기 */
    .col {
      line-height: 35px;
    }
    .btns {
      height: 100%;
      margin-top: 15px;
    }
  </style>

  <body class="sb-nav-fixed">
  	<%@ include file="sidebar.jsp" %>
    

      <div id="layoutSidenav_content">
        <main style="height: 100%">
          <div class="container px-6 white">
            <br />
            <h2>공지사항 작성</h2>
            <hr />

            <form action="/noticeInsert.ad" method="post">
            
            
              <div class="row center">
                <div class="col-xl-12"><input type="text" name="title" class="form-control col-xl-6" value="" placeholder="제목을 입력해주세요" /></div>
              </div>
              <br />
              <textarea id="summernote" name="content"></textarea>
              <div class="btns">
                <button id="btn" class="btn" type="reset">취소</button>
                <button id="btn" class="btn" type="submit">작성</button>
              </div>
            </form>
          </div>
        </main>

        <script src="/resources/js/admin/note.js"></script>
      </div>
  </body>
</html>