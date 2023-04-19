<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.admin.shop.item.model.vo.*, java.util.ArrayList"%>
<!DOCTYPE html>
<% 
		ArrayList<ItemImg> list = (ArrayList<ItemImg>) request.getAttribute("list");
		Item i = (Item) request.getAttribute("item"); 
		String category = i.getItemCategory(); 

%>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 페이지</title>

        <!-- jquery 및 라이브러리 -->

        <!-- 커스텀 js css -->
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
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
          <!-- Navbar Brand-->
          <a class="navbar-brand ps-3" href="index.html">
            <div><i class="fas fa-bug" style="color: red"></i><b>&nbsp; MY MOODANG</b></div>
          </a>
          <!-- Sidebar Toggle-->
          <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
            <i class="fas fa-bars"></i>
          </button>
          <!-- Navbar Search-->
          <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group"></div>
          </form>
          <!-- Navbar-->
          <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
              <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#!">Logout</a></li>
              </ul>
            </li>
          </ul>
        </nav>
        <div id="layoutSidenav">
          <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark --bs-blue" id="sidenavAccordion">
              <div class="sb-sidenav-menu">
                <div class="nav">
                  <div class="text-center">
                    <img src="/resources/img/logo.png" class="rounded logo" alt="로고" />
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                          <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                  <a class="nav-link" href="main.html">
                    <div class="sb-nav-link-icon">
                      <i class="fas fa-home"></i>
                    </div>
                    메인 / 통계
                  </a>
                  <a class="nav-link" href="item.html">
                    <div class="sb-nav-link-icon">
                      <i class="fa fa-fw fa-gift"></i>
                    </div>
                    상품 관리
                  </a>
                  <a class="nav-link" href="order.html">
                    <div class="sb-nav-link-icon">
                      <i class="fas fa-shopping-cart"></i>
                    </div>
                    주문 관리
                  </a>
                  <a class="nav-link" href="member.html">
                    <div class="sb-nav-link-icon">
                      <i class="fas fa-chart-area"></i>
                    </div>
                    회원 관리
                  </a>
                  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon">
                      <i class="fas fa-list"></i>
                    </div>
                    게시판 관리
                    <div class="sb-sidenav-collapse-arrow">
                      <i class="fas fa-angle-down"></i>
                    </div>
                  </a>
                  <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="notice.html">공지사항 관리</a> <a class="nav-link" href="inquiry.html">1:1 문의 관리</a> <a class="nav-link" href="review.html">리뷰 관리</a></nav>
                  </div>
                </div>
              </div>
            </nav>
          </div>

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
                      <textarea class="form-control" name="text" style="height: 200px; resize: none; margin-bottom: 15px"><%=i.getItemText()%></textarea>
                      <label for="floatingTextarea2">상품 상세설명</label>
                    </div>

                    <div class="col form-floating mb-3"><input type="number" class="form-control" value="<%=i.getItemDiscount() * 100%>" name="discount" /> <label for="floatingPassword">할인율 (%)</label></div>

                    <div class="col form-floating mb-3">
                      <select class="form-select" name="status">
                        <% if (i.getItemStatus().equals("Y")) { %>
                        <option value="1" selected>판매중</option>
                        <option value="2">판매중지</option>
                        <% } else { %>
                        <option value="1">판매중</option>
                        <option value="2" selected>판매중지</option>
                        <% } %>
                      </select>
                      <label for="floatingSelect">* 판매 상태</label>
                    </div>

                    <div class="col form-floating mb-3">
                      <select class="form-select" id="category" name="category">
                        <option value="1" <% if (i.getItemCategory().equals("제로음료")) out.print("selected"); %>>제로음료</option>
                        <option value="2" <% if (i.getItemCategory().equals("단백질")) out.print("selected"); %>>단백질</option>
                        <option value="3" <% if (i.getItemCategory().equals("무가당")) out.print("selected"); %>>무가당</option>
                      </select>
                      <label for="floatingSelect">* 카테고리</label>
                    </div>

                    <div>
                      <img id=detailImg1 src="" class="img-thumbnail" style="width: 200px; height: 200px" />
                      <img id=detailImg2 src="" class="img-thumbnail" style="width: 200px; height: 200px" />
                      <img id=detailImg3 src="" class="img-thumbnail" style="width: 200px; height: 200px" />
                    </div>

                    <div class="row">
                    <% if(!list.isEmpty()) { %>
                      <% for(int j = 1; j < list.size(); j++) { %>
                      <p class="div" id="img<%=j%>" style="font-size: 13px"><%= list.get(j).getItemImg() %></p>
                      <% } %>
                      <% } %>
                    </div>

                    <div id="file-area">
                      <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);" />
                      <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);" />
                      <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);" />
                      <input type="file" id="file4" name="file4" onchange="loadImg(this, 4);" />
                    </div>
                    
                    	<input type="hidden" name="code" value=<%= i.getItemCode() %> />
                    
                    <%
					    for (int j = 0; j < Math.min(list.size(), 3); j++) {
					    	
					%>
					    <input type="hidden" name="names<%= j+1 %>" value="<%= list.get(j).getItemImg() %>">
					    
					<%
					    }
					%>
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
        </div>

        <!-- layoutSidenav_content -->

        <script>
          $(function () {
            $('#file-area').hide();

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
                  case 2:
                    $('#detailImg1').attr('src', e.target.result);
                    $('#img1').text(inputFile.files[0].name);
                    break;
                  case 3:
                    $('#detailImg2').attr('src', e.target.result);
                    $('#img2').text(inputFile.files[0].name);
                    break;
                  case 4:
                    $('#detailImg3').attr('src', e.target.result);
                    $('#img3').text(inputFile.files[0].name);
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
                case 2:
                  $('#detailImg1').attr('src', null);
                  $('#titleImg').text('');
                  break;
                case 3:
                  $('#detailImg2').attr('src', null);
                  $('#titleImg').text('');
                  break;
                case 4:
                  $('#detailImg3').attr('src', null);
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
        <!-- <script src="assets/demo/chart-area-demo.js">
    </script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    -->
      </body>
    </html>
  </ItemImg>
</ItemImg>
