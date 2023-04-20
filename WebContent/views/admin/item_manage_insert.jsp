<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	
    <title>관리자 페이지</title>


	<%@ include file="common2.jsp" %>
	
    <link rel="stylesheet" href="/resources/css/shop/item_management.css" />
    <link rel="stylesheet" href="/resources/css/shop/item_manage_insert.css" />
    <link rel="stylesheet" href="/resources/css/shop/item_manage_detail.css" />
  </head>

  <style>
    #btn {
      background-color: #fe7477;
      color: white;
      border: 1px solid white;
      float: right;
      margin-left: 10px;
      margin-bottom: 10px;
    }
  </style>

 
    <%@ include file="sidebar.jsp" %>
    

      <div id="layoutSidenav_content">
        <main style="height: 100%">
          <div class="container px-6 white">
            <br />
            <h2>상품 추가</h2>
            <hr />

            <form id="myForm" action="/itemInsert.ad" method="POST" enctype="multipart/form-data">
              <div class="mx-auto col-10 col-md-8 col-lg-6 center">
                <div id="img_view">
                  <label for="titleImg" style="margin-bottom: 10px">* 대표 이미지</label>
                  <div class="col">
                    <img id="titleImg" name="img1" src="/resources/img/noimage.png" class="img-thumbnail" style="width: 500px; height: 300px" />
                  </div>

                  <div class="col form-floating mb-4">
                    <input type="text" name="itemName" class="form-control" value="" required />
                    <label for="floatingInput">* 상품명</label>
                  </div>
                  <div class="col form-floating mb-3">
                    <input type="number" name="itemStock" class="form-control" />
                    <label for="floatingPassword">* 수량(재고)</label>
                  </div>
                  <div class="col form-floating mb-3">
                    <input type="number" name="itemPrice" class="form-control" />
                    <label for="floatingPassword">* 판매 가격</label>
                  </div>

                  <div class="col form-floating mb-3">
                    <textarea class="form-control" name="itemText" style="height: 200px; resize: none; margin-bottom: 15px" required></textarea>
                    <label for="floatingTextarea2">상품 상세설명</label>

                    <div class="col form-floating mb-3">
                      <input type="number" class="form-control" name="itemDiscount" />
                      <label for="floatingPassword">할인율 (%)</label>
                    </div>

                    <div class="col form-floating mb-3">
                      <select class="form-select" name="itemStatus">
                        <option value="1">판매중</option>
                        <option value="2">판매중지</option>
                      </select>
                      <label for="floatingSelect">* 판매 상태</label>
                    </div>

                    <div class="col form-floating mb-3">
                      <select class="form-select" name="itemCategory">
                        <option value="1">제로음료</option>
                        <option value="2">단백질</option>
                        <option value="2">무가당</option>
                      </select>
                      <label for="floatingSelect">* 카테고리</label>
                    </div>

                    <!-- 추가 사진 3개 -->
                    <div class="file-area">
                    <div class="form-group">
                    <input type="file" id="file1" name="file1" class="form-control" onchange="loadImg(this, 1);" required style="margin-top: 20px; margin-bottom: 20px" />
                      <label class="col image">상품 이미지1</label>
                      <input type="file" id="file2" name="file2" class="form-control" onchange="loadImg(this, 2);" />
                    </div>

                    <div class="form-group">
                      <label class="col image">상품 이미지2</label>
                      <input type="file" id="file3" name="file3" class="form-control" onchange="loadImg(this, 3);" />
                    </div>

                    <div class="form-group">
                      <label class="col image">상품 이미지3</label>
                      <input type="file" id="file4" name="file4" class="form-control" onchange="loadImg(this, 4);" />
                    </div>
                    <br />
                    
                    </div>
                    
                    <img id="detailImg1" name="img2" src="/resources/img/noimage.png" class="img-thumbnail" style="width: 200px; height: 200px" />
                    <img id="detailImg2" name="img3" src="/resources/img/noimage.png" class="img-thumbnail" style="width: 200px; height: 200px" />
                    <img id="detailImg3" name="img4" src="/resources/img/noimage.png" class="img-thumbnail" style="width: 200px; height: 200px" />
                    
                    <div class="insert-form">
                      <button type="submit" class="btn btn-primary" id="addBtn" style="font-size: larger">추가</button>
                      <a href="/itemList.ad?page=1&category=a" class="btn btn-primary" id="listBtn" style="font-size: larger">목록</a>
                    </div>
                  </div>
                  <br /><br />
                </div>
              </div>
            </form>
          </div>
        </main>
      </div>
      </div>
      <!-- layoutSidenav_content -->

    <script>
    
    $(function () {
        $('.file-area').hide();

        // 각 자리에 맞는 이미지 태그를 클릭했을 경우
        // input type="file" 요소가 클릭되게끔 처리하기
        $('#titleImg').click(function () {
          $('#file1').click();
        });
        $('#detailImg1').click(function () {
          $('#file2').click();
        });
        $('#detailImg2').click(function () {
          $('#file3').click();
        });
        $('#detailImg3').click(function () {
          $('#file4').click();
        });
      });
      // class img-thumbnail 에 첨부파일 이미지 띄우기
      //이미지 파일이 아니면 업로드 안되게 하기

      function loadImg(inputFile, num) {
        
    	let fileExtension = inputFile.files[0].name.split('.').pop().toLowerCase();
    	let allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
    	if (!allowedExtensions.includes(fileExtension)) {
    	    alert('이미지 파일을 제외하고 첨부할 수 없습니다.');
    	    inputFile.value = ''; // Clear the file input
    	    return;
    	  }
    	  
        if (inputFile.files.length == 1) {
          // 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기
          // 파일을 읽어들일 FileReader 객체 생성
          let reader = new FileReader(); //생성자 함수

          // FileReader 객체에서 제공하는 파일을 읽어들이는 메소드 호출
          // 단, 어느 파일을 읽어들일 건지 매개변수로 제시해야함
          // => 우리가 읽어들일 파일은 inputFile.files[0]에 저장되어 있음
          reader.readAsDataURL(inputFile.files[0]);
          //해당 파일을 읽어들이는 순간 해당 그 파일만의 고유한 url 주소가 부여됨
          //이 url 주소를 img 태그의 src 속성에 지정하면 미리보기 가능

          // 파일 읽기가 완료되었을 때 실행하게끔 처리
          reader.onload = function (e) {
            // e 의 target.result 에 각 파일의 url 주소가 담겨있음
            // e.target == this == reader
            switch (num) {
              case 1:
                $('#titleImg').attr('src', e.target.result);
                break;
              case 2:
                $('#detailImg1').attr('src', e.target.result);
                break;
              case 3:
                $('#detailImg2').attr('src', e.target.result);
                break;
              case 4:
                $('#detailImg3').attr('src', e.target.result);
                break;

              default:
                break;
            }
          };
        } else {
          // 파일이 선택되지 않았을 때
          switch (num) {
            case 1:
              $('#titleImg').attr('src', null);
              break;
            case 2:
              $('#detailImg1').attr('src', null);
              break;
            case 3:
              $('#detailImg2').attr('src', null);
              break;
            case 4:
              $('#detailImg3').attr('src', null);
              break;

            default:
              break;
          }
        }
      }

      //숫자 외에 입력 못하게 하기
      $("#myForm input[type='number']").on('input', function () {
        var inputValue = $(this).val();
        var numericValue = inputValue.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
        $(this).val(numericValue);
      });
    </script>
    <!-- <script src="assets/demo/chart-area-demo.js">
    </script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    -->
  </body>
</html>
