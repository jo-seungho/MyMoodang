<% String alertMsg = (String)session.getAttribute("alertMsg"); %>
    
    <script src="https://code.jquery.com/jquery-3.6.4.js" crossorigin="anonymous"></script>
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>    
    <!-- 커스텀 js css -->
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <script src="/resources/js/admin/admin.js"></script>

    <script>
          let msg = '<%= alertMsg %>';

          if (msg != "null") {
            alert(msg);
            //알림창을 띄워준 후 session 에 담긴 해당 메세지를 한번 지워줘야지만 깔끔하게 일회성 알람 문구로 활용 가능
            // => 안그러면 menubar.jsp 가 로딩될때마다 매턴 alert가 뜰것임
            <% session.removeAttribute("alertMsg"); %>
          }
   </script>
        
