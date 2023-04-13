
$(document).ready(function () {

    $(window).scroll(function () {
      var scrollTop = $(document).scrollTop();
      if (scrollTop < 60) {
        scrollTop = 60;
      }
      $("viewOrderList").stop();
      $("viewOrderList").animate({ "top": scrollTop });
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



