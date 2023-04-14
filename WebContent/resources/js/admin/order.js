      //1번 행의 배송상태 수정 버튼 클릭시 이벤트
      $(document).ready(function () {
        // Apply underline effect when page loads for the first time
        $('#btn1').addClass('underline');

        // Apply underline effect when clicking btn1, and remove underline effect for btn2 and btn3
        $('#btn1').click(function () {
          $('#btn1').addClass('underline');
          $('#btn2').removeClass('underline');
          $('#btn3').removeClass('underline');
        });

        // Apply underline effect when clicking btn2, and remove underline effect for btn1 and btn3
        $('#btn2').click(function () {
          $('#btn2').addClass('underline');
          $('#btn1').removeClass('underline');
          $('#btn3').removeClass('underline');
        });

        // Apply underline effect when clicking btn3, and remove underline effect for btn1 and btn2
        $('#btn3').click(function () {
          $('#btn3').addClass('underline');
          $('#btn1').removeClass('underline');
          $('#btn2').removeClass('underline');
        });
        
        
        $('.modi').click(function () {
            var order_id = $(this).parent().parent().parent().find('td').eq(0).text();
            alert(order_id + '번 주문의 배송상태가 수정되었습니다.');
          });

          $('#btn').click(function () {
            location.href = 'order_write.html';
          });
      });

      