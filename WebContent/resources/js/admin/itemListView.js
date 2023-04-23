$(document).ready(function () {
        	  if ($('tbody tr td').eq(0).text() == '게시글이 없습니다.') {
                  $('tbody tr td').css('cursor', 'default');
                } else {
                	$('tbody tr').click(function () {
                        location.href = '/itemDetail.ad?code=' + $(this).children().eq(0).text();
                      });
                    }
                });
 
          $(document).ready(function () {
            if ('<%= category %>' == 'a') {
            	$('#btn1').addClass('underline');
            	$('#btn2').removeClass('underline');
                $('#btn3').removeClass('underline');
            } else if ('<%= category %>' == 'y') {
                $('#btn2').addClass('underline');
                $('#btn1').removeClass('underline');
                $('#btn3').removeClass('underline');
            }
            else if ('<%= category %>' == 'n') {
                $('#btn3').addClass('underline');
                $('#btn1').removeClass('underline');
                $('#btn2').removeClass('underline');
            }
            else $('#btn1').addClass('underline');

            // Apply underline effect when clicking btn1, and remove underline effect for btn2 and btn3
            $('#btn1').click(function () {
              location.href = '/itemList.ad?page=1&category=a';
            });

            // Apply underline effect when clicking btn2, and remove underline effect for btn1 and btn3
            $('#btn2').click(function () {
              location.href = '/itemList.ad?page=1&category=y';
            });

            // Apply underline effect when clicking btn3, and remove underline effect for btn1 and btn2
            $('#btn3').click(function () {
              location.href = '/itemList.ad?page=1&category=n';
            });
          });