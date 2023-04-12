<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.member.model.vo.Member, java.util.ArrayList"%> <% ArrayList<Member>
  list = (ArrayList<Member
    >) request.getAttribute("list"); %>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 페이지</title>

        <style>
          .member:hover {
            background-color: #f2f2f2;
            cursor: pointer;
          }
        </style>
        <!-- jquery -->
      </head>

      <body class="sb-nav-fixed">
        <%@ include file="index.jsp" %>

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
          <!-- Navbar Brand-->
          <a class="navbar-brand ps-3" href="index.html">
            <div><i class="fas fa-bug" style="color: red"></i><b>&nbsp; MY MOODANG</b></div>
          </a>
          <!-- Sidebar Toggle-->
          <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
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
                    <img src="resources/img/logo.png?after" class="rounded" alt="로고" style="width: 70%; height: 50%; margin-top: 10px" />
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                          <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                  <a class="nav-link" href="index.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                    메인 / 통계
                  </a>
                  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fa fa-fw fa-gift"></i></div>
                    상품 관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                  </a>
                  <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                      <a class="nav-link" href="layout-static.html">Static Navigation</a>
                      <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                    </nav>
                  </div>
                  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                    <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                    주문 관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                  </a>
                  <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                      <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                        Authentication
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                      </a>
                      <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                        <nav class="sb-sidenav-menu-nested nav">
                          <a class="nav-link" href="login.html">Login</a>
                          <a class="nav-link" href="register.html">Register</a>
                          <a class="nav-link" href="password.html">Forgot Password</a>
                        </nav>
                      </div>
                      <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                        Error
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                      </a>
                      <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                        <nav class="sb-sidenav-menu-nested nav">
                          <a class="nav-link" href="401.html">401 Page</a>
                          <a class="nav-link" href="404.html">404 Page</a>
                          <a class="nav-link" href="500.html">500 Page</a>
                        </nav>
                      </div>
                    </nav>
                  </div>
                  <a class="nav-link" href="charts.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                    회원 관리
                  </a>
                  <a class="nav-link" href="tables.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                    게시판 관리
                  </a>
                </div>
              </div>
              <!-- <div class="sb-sidenav-footer"></div> sidenav의 footer-->
            </nav>
          </div>

          <div id="layoutSidenav_content">
            <main style="background-color: #f6fbfd">
              <div class="container-fluid px-4">
                <h1 class="mt-4">2023-04-09(일)</h1>
                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item active">회원 관리 페이지</li>
                </ol>

                <h5>회원 목록</h5>
                <hr />

                <table class="myTable">
                  <thead>
                    <tr>
                      <th>회원 번호</th>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>성별</th>
                      <th>등급</th>
                      <th>가입일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% for(Member m : list) { %>
                    <tr class="member">
                      <td><%= m.getUserNo() %></td>
                      <td><%= m.getUserId() %></td>
                      <td><%= m.getUserName() %></td>
                      <td><%= m.getAddress() %></td>
                      <td><%= m.getEmail() %></td>
                      <td><%= m.getEnrollDate() %></td>
                    </tr>
                    <% } %>
                  </tbody>
                </table>
              </div>
              <br />
            </main>
          </div>

          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Default Bootstrap Modal</h5>
                  <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form action="MyServlet" form="selectTo.me" method="post">
                    <input type="hidden" id="userId" name="userId" value="" />
                    <input type="hidden" name="action" value="create" />
                    <!-- Hidden field to send the action to the server -->
                    <label for="userNo">userNo:</label>
                    <input type="text" name="userNo" id="userNo" value="" />
                    <label for="userId">ID:</label>
                    <input type="text" name="userId" id="userId" value="" />
                    <label for="userName">userName:</label>
                    <input type="text" name="userName" id="userName" value="" />
                    <label for="email">email:</label>
                    <input type="email" name="email" id="email" />
                    <label for="address">address:</label>
                    <input type="text" name="address" id="address" />

                    <input type="submit" class="btn btn-primary" value="Save changes" />
                  </form>
                </div>
                <div class="modal-footer"><button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button><button class="btn btn-primary" type="button">Save changes</button></div>
              </div>
            </div>
          </div>
        </div>
        <!-- <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script> -->
        <script>
          $(document).ready(function () {
            $('tbody').on('click', 'td', function () {
              var getUserId = $(this).closest('tr').find('td:eq(1)').text();
              // Send getUserNo to your desired destination using AJAX

              // Send getUserNo to the servlet using AJAX
              $.ajax({
                url: 'select.me',
                type: 'GET',
                data: { userId: getUserId },
                success: function (response) {
                  // Parse the JSON response
                  var user = JSON.parse(response);
                  console.log(user);

                  // Extract the data from the JSON response
                  var userNo = user.userNo;
                  var userId = user.userId;
                  var userName = user.userName;
                  var email = user.email;
                  var address = user.address;
                  // ... extract other user data as needed

                  // Update the modal with the extracted user data
                  $('#userNo').val(userNo);
                  $('#userId').val(userId);
                  $('#userName').val(userName);
                  $('#email').val(email);
                  $('#address').val(address);

                  // Show the Bootstrap modal
                  $('#exampleModal').modal('show');
                },
                error: function (xhr, status, error) {
                  console.error(error); // Log any errors to the console
                },
              });
            });
          });
        </script>
      </body>
    </html>
  </Member></Member
>
