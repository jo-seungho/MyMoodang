<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="common2.jsp"%>
    <title>관리자 페이지</title>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="/resources/js/common/summernote-ko-KR.js"></script>
    <script src="/resources/js/common/summernote-ko-KR.min.js"></script>
    
    
    
    
    <script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
	 	function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "/uploadFile",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
	 	        	$(editor).summernote('editor.insertImage', data.url);
	 	        }
	 	    });
	 	}
	</script>
    
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

        <script>
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
              
              callbacks: { // 콜백을 사용
                  // 이미지를 업로드할 경우 이벤트를 발생
				    onImageUpload: function(files, editor, welEditable) {
					    sendFile(files[0], this);
					}
              }
            });
          });
        </script>
      </div>
  </body>
</html>