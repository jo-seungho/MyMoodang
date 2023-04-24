<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.admin.shop.item.model.vo.*, java.util.ArrayList"%>
<% 
		ArrayList<ItemImg> list = (ArrayList<ItemImg>) request.getAttribute("list");
		Item i = (Item) request.getAttribute("item");
		
		String category = i.getItemCategory(); 
		
%>
<!DOCTYPE html>
   <html lang="en">
      <head>
      	<%@ include file="common2.jsp" %>
      	<%@ include file="summernote.jsp"%>
        <title><%= i.getItemName() %></title>
       
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

        .image {
          margin-bottom: 10px;
          margin-top: 5px;
        }

        /* 고유한 */
      </style>

      <body class="sb-nav-fixed">
        <%@ include file="sidebar.jsp"%>
        

          <div id="layoutSidenav_content">
            <div class="container px-6 white">
              <br />
              <h2>상품 수정</h2>
              <hr />
              <div class="mx-auto col-10 col-md-8 col-lg-6 center">
                <div id="img_view">
                  <form method="POST" action="/itemUpdate.ad" enctype="multipart/form-data">
                    <div class="col">
                      <img id="titleImg" src=" <%= i.getItemImg() %> " class="img-thumbnail" style="width: 500px; height: 300px" />
                    </div>													
                    <label for="titleImg" style="margin-bottom: 10px" id="img0"><%= i.getImgName() %></label>

                    <div class="col form-floating mb-4"><input type="text" class="form-control" name="name" value="<%=i.getItemName()%>" /> <label for="floatingInput">* 상품명</label></div>
                    <div class="col form-floating mb-3"><input type="number" class="form-control" name="stock" value="<%=i.getItemStock()%>" /> <label for="floatingPassword">* 수량(재고)</label></div>
                    <div class="col form-floating mb-3"><input type="number" class="form-control" name="price" value="<%=i.getItemPrice()%>" /> <label for="floatingPassword">* 판매 가격</label></div>

                    <div class="col form-floating mb-3">
                    <textarea id="summernote" name="content" required><%= i.getItemText() %></textarea>
                  	</div>  

                    <div class="col form-floating mb-3"><input type="number" class="form-control" value="<%=i.getItemDiscount() * 100%>" name="discount" /> <label for="floatingPassword">할인율 (%)</label></div>

                    <div class="col form-floating mb-3">
                      <select class="form-select" name="status">
                        <% if (i.getItemStatus().equals("Y")) { %>
                        <option value="Y" selected>판매중</option>
                        <option value="N">판매중지</option>
                        <% } else { %>
                        <option value="Y">판매중</option>
                        <option value="2N" selected>판매중지</option>
                        <% } %>
                      </select>
                      <label for="floatingSelect">* 판매 상태</label>
                    </div>

                    <div class="col form-floating mb-3">
                      <select class="form-select" id="category" name="category">
                        <option value="제로음료" <% if (i.getItemCategory().equals("제로음료")) out.print("selected"); %>>제로음료</option>                       
                        <option value="무가당" <% if (i.getItemCategory().equals("무가당")) out.print("selected"); %>>무가당</option>
                        <option value="단백질" <% if (i.getItemCategory().equals("단백질")) out.print("selected"); %>>단백질</option>
                        <option value="도시락" <% if (i.getItemCategory().equals("도시락")) out.print("selected"); %>>도시락</option>
                        <option value="기타" <% if (i.getItemCategory().equals("기타")) out.print("selected"); %>>기타</option>
                      </select>
                      <label for="floatingSelect">* 카테고리</label>
                    </div>

                    <div id="titleImg">
                    
                    
                    
                    </div>

                    <div class="row">
                    </div>

                    <div id="file-area">
                      <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);" />
                    </div>
                    	<input type="hidden" name="fileName" value=<%= i.getImgName() %> />
                    	<input type="hidden" name="code" value=<%= i.getItemCode() %> />
                    
                    <div class="insert-form">
                      <button class="btn btn-primary" id="addBtn" style="margin-top: 40px; font-size: larger">수정</button>
                      <a href="/itemDetail.ad?code=<%=i.getItemCode()%>" class="btn btn-primary" id="listBtn" style="margin-top: 40px; font-size: larger">목록</a> <a href="/itemDelete.ad?code=<%=i.getItemCode()%>" class="btn btn-primary" id="listBtn" style="margin-top: 40px; font-size: larger">삭제</a>
                    </div>
                  </form>
                </div>
                <br />
                <br />
              </div>
            </div>
          </div>

        <!-- layoutSidenav_content -->

        <script>

      
   

          function loadImg(inputFile, num) {
            // inputFile = 현재 변화가 생긴 input type="file" 요소 객체
            // num 몇번째 input 요소인지 확인 후 해당 영역에 미리보기 하기 위한 매개변수

            //input type=file의 요소객체의 특징
            //file에  걸 수 있는 multiple 이라는 속성이 있음
            //=> 한번에 업로드 파일을 여러개 선택가능, 단 cos.jar 에서는 사용 불가.
            // 우리는 input type="file" 하나에 한개의 파일의 파일만 업로드 할 예정
            // files.length == 1 이냐 0 이냐에 따라 파일이 올라갔는지 검사 가능
            // 즉, 파일의 존재 유무를 알 수 있다.

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
                    $('#img0').text(inputFile.files[0].name);
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
                  $('#titleImg').text('');
                  break;

                default:
                  break;
              }
            }
          }

          let selectElement = document.getElementById('category'); // Replace 'yourSelectElementId' with the actual ID of your select element

          // Add an event listener for the change event on the select element
          selectElement.addEventListener('change', function () {
            // Get the selected option
            let selectedOption = selectElement.options[selectElement.selectedIndex];

            // Check if the selected option value matches the desired values
            if (selectedOption.value === '제로콜라' || selectedOption.value === '단백질' || selectedOption.value === '무가당') {
              // Apply the selected effect, e.g., adding a class or setting a selected attribute
              selectedOption.classList.add('selected'); // Replace 'selected' with the desired class name or attribute
            } else {
              // Remove the selected effect, e.g., removing a class or unsetting a selected attribute
              selectedOption.classList.remove('selected'); // Replace 'selected' with the class name or attribute that was previously set
            }
          });

          $("#myForm input[type='number']").on('input', function () {
            var inputValue = $(this).val();
            var numericValue = inputValue.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
            $(this).val(numericValue);
          });
        </script>
        
        <script src="/resources/js/admin/note.js"></script>
      </body>
    </html>
