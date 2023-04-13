/*!
 * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
 * Copyright 2013-2023 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
 */
//
// Scripts
//

window.addEventListener('DOMContentLoaded', (event) => {
  // Toggle the side navigation
  const sidebarToggle = document.body.querySelector('#sidebarToggle');
  if (sidebarToggle) {
    // Uncomment Below to persist sidebar toggle between refreshes
    // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
    //     document.body.classList.toggle('sb-sidenav-toggled');
    // }
    sidebarToggle.addEventListener('click', (event) => {
      event.preventDefault();
      document.body.classList.toggle('sb-sidenav-toggled');
      localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
    });
  }
});

$(document).ready(function () {
  // Initialize DataTables
  var table = $('.myTable').DataTable({
    lengthMenu: [
      [5, 10, 50, -1],
      [5, 10, 50, '전체'],
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
