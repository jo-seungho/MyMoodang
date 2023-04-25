window.addEventListener('DOMContentLoaded', function () {

  a = $('.search_keyword').val();
  $('.inp_search').val(a);


  $('.top_event_close').click(function () {
    $('#top_event').slideUp(200);
  });

  const gnb = document.querySelector('.gnb');
  const gnbTopOffset = gnb.offsetTop;
  window.addEventListener('scroll', (e) => {
    if (window.pageYOffset >= gnbTopOffset) {
      gnb.style.position = 'fixed';
      gnb.style.top = 0;
      gnb.style.left = 0;
      gnb.style.right = 0;
    } else {
      gnb.style.position = '';
      gnb.style.top = '';
    }
  });
  // gnb 상단 고정 끝 --

  // gnb_search
  // (1) btn_delete 클릭 > value 값 초기화
  const btnD = document.querySelector('.btn_delete');
  const inpSearch = document.querySelector('.inp_search');

  btnD.onclick = function () {
    inpSearch.value = '';
  };

  // (2) 입력 창 focus > 배경 #fff 변경, focus를 잃으면 원래대로.
  // transition 0.3초 추가
  inpSearch.addEventListener(
    'focus',
    function (changeBg) {
      this.style.backgroundColor = '#fff';
    },
    true
  );
  inpSearch.addEventListener(
    'blur',
    function (changeBg) {
      this.style.backgroundColor = '';
    },
    true
  );

  //퀵 베너 따라 내려오기
  $(window).scroll(function () {
    var scrollTop = $(document).scrollTop();
    if (scrollTop < 70) {
      scrollTop = 70;
    }
    $('.qnb').stop();
    $('.qnb').animate({ top: scrollTop });
  });

  // 사이드바 플로팅

  $(document).ready(function () {

    $(window).scroll(function () {
      var scrollTop = $(document).scrollTop();
      if (scrollTop < 60) {
        scrollTop = 60;
      }
      $(".snb_my").stop();
      $(".snb_my").animate({ "top": scrollTop });
    });

    $(window).scroll(function () {
      var scrollTop = $(document).scrollTop();
      if (scrollTop < 0) {
        scrollTop = 0;
      }
      $(".inner_result").stop();
      $(".inner_result").animate({ "top": scrollTop });
    });

  });

});


// 로그인 한 회원의 1:1문의 정보수정(비밀번호확인) 창으로 이동
// 2023-04-19 김서영
function update_me(id) {
	console.log("로그인 회원의 아이디" + id);
	location.href = "/updateCheckPwd.me?id=" + id;
}


// 1:1문의 비회원 접근 막기 / 2023-04-25 김서영
$(function() {
	$("#afterLogin").click(function() {
		alert("로그인 후 이용이 가능한 서비스입니다.");
		location.href = "/";
	})
})




