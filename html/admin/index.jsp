<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>관리자 페이지</title>
    <link href="resources/css/styles.css?after" rel="stylesheet" />

    <!-- jquery 및 라이브러리 -->
    <script src="https://code.jquery.com/jquery-3.6.4.js" crossorigin="anonymous"></script>
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <!-- 커스텀 js css -->
    <script src="../resources/js/admin.js"></script>
    <link href="../resources/css/styles.css" rel="stylesheet" />
  </head>
  <body>
    <script>
      $(document).ready(function () {
        // Initialize DataTables
        var table = $('.myTable').DataTable({
          lengthMenu: [
            [10, 50, 100, -1],
            [10, 50, 100, '전체'],
          ],

          language: {
            emptyTable: '데이터가 없어요.',
            lengthMenu: '_MENU_ 개씩 보기',

            info: '현재 _START_ - _END_ / _TOTAL_건',
            infoEmpty: '데이터 없음',
            infoFiltered: '( _MAX_건의 데이터에서 필터링됨 )',
            search: '에서 검색: ',
            zeroRecords: '일치하는 데이터가 없어요.',
            loadingRecords: '로딩중...',
            processing: '잠시만 기다려 주세요...',
            paginate: {
              next: '다음',
              previous: '이전',
            },
          },
        });

        // Add a select dropdown to select columns for searching
        $('.myTable').each(function () {
          var table = $(this).DataTable(); // Initialize DataTables for the current table

          // Add a select dropdown to select columns for searching
          $(this).prev('.dataTables_filter').prepend('<select class="select"></select>');
          $(this)
            .find('thead > tr > th')
            .each(function (indexInArray, valueOfElement) {
              $(this)
                .parents('.dataTables_wrapper')
                .find('.select')
                .append('<option value="' + indexInArray + '">' + valueOfElement.innerHTML + '</option>');
            });

          // Perform column-specific search on page load
          var colIndex = $(this).prev('.dataTables_filter').find('.select').val();
          var searchValue = $(this).prev('.dataTables_filter').find('input').val();
          table.column(colIndex).search(searchValue).draw();

          // Bind a keyup event handler to the search input
          $(this)
            .prev('.dataTables_filter')
            .find('input')
            .unbind()
            .bind('keyup', function () {
              colIndex = $(this).parent().prev('.select').val();
              searchValue = this.value;
              table.column(colIndex).search(searchValue).draw();
            });
        });
      });
    </script>
  </body>
</html>
