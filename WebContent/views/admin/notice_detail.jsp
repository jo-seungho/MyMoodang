<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.admin.board.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("n");
	
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="common2.jsp"%>
    <title>관리자 페이지</title>
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="/resources/js/common/summernote-ko-KR.js"></script>
    <script src="/resources/js/common/summernote-ko-KR.min.js"></script>

    
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
    .form-control {
      resize: none;
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
            <h2>공지사항 수정</h2>
            <hr />

            <form action="/noticeUpdate.ad" method="post">
            <input type="hidden" name="nno" value="<%=n.getNoticeNo()%>">
            
              <div class="row center">
                <div class="col">제목</div>
                <div class="col-xl-6"><input text class="form-control col-xl-6" name="title" value="<%=n.getNoticeTitle() %>" /></div>
                <div class="col">작성일</div>
                <div class="col-xl-2"><%=n.getCreateDate() %></div>
              </div>
              <hr />
              
              <textarea id="summernote" name="content"><%=n.getNoticeContent() %></textarea>
              <div class="btns">
                <button id="btn" class="btn" onclick="Noticedelete();" type="button">삭제</button>
                
                <button id="btn" class="btn" type="submit">수정</button>
                <button id="btn" class="btn" onclick="NoticeList();" type="button">목록</button>
              </div>
            </form>
          </div>
        </main>
      </div>
    
    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
    <script>
    	function NoticeList() {
    		location.href = "/noticelist.ad?currentPage=1";
    	};	
    	
    	function Noticedelete(){
    		location.href = "/noticedelete.ad?nno="+<%=n.getNoticeNo()%>;
    	};
   
          $(document).ready(function () {
            //여기 아래 부분
            $('#summernote').summernote({
              height: 400, // 에디터 높이
              focus: true, // 에디터 로딩후 포커스를 맞출지 여부
              lang: 'ko-KR', // 한글 설정
              placeholder: '내용',
              disableResizeEditor: true, // 크기 조절 기능 삭제
              toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                ['color', ['forecolor', 'color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['picture', 'link', 'video']],
                ['view', ['fullscreen', 'help']],
              ],
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
              fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
            });
          });
        </script>
  </body>
</html>