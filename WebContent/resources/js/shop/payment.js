// 배송지추가에 쓰일 api : problem 
window.addEventListener('DOMContentLoaded', function () {
	
    const juso = document.querySelector('#juso');
    const user_address = document.querySelector('#addrMain');
    const user_detail_address = document.querySelector('#addrSub');
    const juso_search = document.querySelector('.feild');

    // juso.addEventListener('click', addr_search);
    // 검색 클릭 하면 함수 실행


    function addr_search() {   //주소 검색 카카오 api 
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.


                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addrMain").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addrSub").focus();


                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                // http://postcode.map.daum.net/guide  api주소 
            }
        }).open();
    }
});

$(function () {
    $('.plus').click(function () { //count up
    	
    	// 가격 찾는 선택자들
   	    // var $countMoney = $(this).closest('.goods').find('.countMoney');
    	// var $totalMoney = $(this).closest('.goods').find('.totalMoney');
    	  var quantity = parseInt($(this).siblings('.num').val());
    	  var $selling1 = $(this).closest('.goods').find('.selling1');
    	  var price = parseInt($selling1.val());
    	  var totalPrice = quantity * price;
    	  
    	  var $noDis = $(this).closest('.goods').find('.noDis');
    	  var noDiscount = parseInt($noDis.val());
    	  var disTotal = quantity * noDiscount;

    	  var totalPrices = parseInt($('.countMoney').text())
    	  console.log("TOTAL", totalPrices += price)
    	  // console.log(totalPrices += price)
    	  var noDisC = parseInt($('.noDiscount').text());
    	  console.log("quantity", quantity)
    	  console.log("$selling1", $selling1)
    	  console.log("price", price)
    	  console.log("totalPrice", totalPrice)
    	  console.log("$noDis", $noDis)
    	  console.log("noDiscount", noDiscount)
    	  console.log("disTotal", disTotal)
    	  console.log("totalPrices", totalPrices)
    	  console.log("noDisC", noDisC)
    	  
    	
    	// 상품 하나의 가격을 찾는 변수
        let price1 = $(this).parents('.price').find('.selling1').val();
        // 상품 수량
        var n = $('.plus').index(this);
        // 상품의 갯수 표시용 변수
        var num = $(".num:eq(" + n + ")").val();

        if (num == 1) {
            $(this).parents('.price').find('.selling').text(parseInt(price1) + parseInt(price1) + ' 원')
            $('.countMoney').text(totalPrices + (price%2));
    		$('.noDiscount').text(noDisC + noDiscount);
    		$('.difference').text((noDisC + noDiscount) - (totalPrices + (price%2)));
    		$('.pays').text((totalPrices + (price%2)) + 3000);
        }
        if (num > 1) {
            $(this).parents('.price').find('.selling').text(parseInt(price1) * (parseInt(num) + 1) + ' 원')
            $('.countMoney').text((totalPrices + (price%2)))
    		$('.noDiscount').text(noDisC + noDiscount);
    		$('.difference').text((noDisC + noDiscount) - (totalPrices + (price%2)));
    		$('.pays').text((totalPrices + (price%2)) + 3000);
        }
        num = $(".num:eq(" + n + ")").val(num * 1 + 1);
        
    });
    $('.minus').click(function () {  // count down..
    	
    	var $selling9 = $(this).closest('.goods').find('.selling1');
    	var price9 = parseInt($selling9.val());
    	var totalPriceM = parseInt($('.countMoney').text())
    	// console.log(aa += price)
    	
    	var $noDis = $(this).closest('.goods').find('.noDis');
    	var noDiscount = parseInt($noDis.val());
    	var noDisC = parseInt($('.noDiscount').text());
    	
        let price = $(this).parents('.price').find('.selling').text().split('\n')[0];
        let price1 = $(this).parents('.price').find('.selling1').val();
        var n = $('.minus').index(this);
        var num = $(".num:eq(" + n + ")").val();
        if (num != 1) {
            $(this).parents('.price').find('.selling').text(parseInt(price) - parseInt(price1) + ' 원')
            num = $(".num:eq(" + n + ")").val(num * 1 - 1);
            $('.countMoney').text(totalPriceM - price9);
            $('.noDiscount').text(noDisC - noDiscount);
            $('.difference').text((noDisC - noDiscount) - (totalPriceM - price9));
            $('.pays').text(totalPriceM - price9 + 3000);
        }

    });
});


// function check_one(checkbox)  { /*개별 선택에 따른 전체선택상태변경 */
//     const selectall = document.querySelectorAll('input[name="checkAll"]');
//     const checkboxes = document.querySelectorAll('input[name="checkOne"]');
//     var temp = false;
//     var temp2 = true;
//     checkboxes.forEach((checkbox) => {
//         if (checkbox.checked){
//             temp=true;
//         }
//         if (!checkbox.checked){
//             temp2=false;
//         }
//         if (selectall[0].checked && !checkbox.checked){ //전체 선택이 아닐 경우1
//             selectall[0].checked = false;
//             selectall[1].checked = false;
//         }
//     });
//
//     if (temp === false){  //전체 선택이 아닐 경우2
//         selectall[0].checked = false;
//         selectall[1].checked = false;
//     }
//
//     else if (temp2 === true){ //전체선택일 경우
//         selectall[0].checked = true;
//         selectall[1].checked = true;
//     }
// }

//function check_one(checkboxOne) {
//	
//	let checkboxes = document.querySelectorAll('input[name="checkOne"]');
//	
//    let sumMoney = 0;
//    // 원가 총 금액 담을 변수
//    let sumNoDis = 0;
//    $('.in_price').each(function() {
//    	var totalMoneyVal = $(this).find('.totalMoney').val();
//    	var noDisMoney = $(this).find('.noDisTotal').val();
//    	sumMoney += Number(totalMoneyVal);
//    	sumNoDis += Number(noDisMoney)
//    });
//    
//
//    
//    
//    checkboxes.forEach((checkbox) => {
//        if (checkboxOne.checked) {
//        	
//         
//            $('.countMoney').text(sumMoney);
//            $('.noDiscount').text(sumNoDis);
//            $('.difference').text(sumNoDis - sumMoney);
//        }
//    });
//	
//}



//function sel_all(selectAll) { /* 전체선택버튼 활성화 */
//    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
//    
//    let sumMoney = 0;
//    // 원가 총 금액 담을 변수
//    let sumNoDis = 0;
//    $('.in_price').each(function() {
//    	var totalMoneyVal = $(this).find('.totalMoney').val();
//    	var noDisMoney = $(this).find('.noDisTotal').val();
//    	sumMoney += Number(totalMoneyVal);
//    	sumNoDis += Number(noDisMoney)
//    });
//    
//    $('.countMoney').text(sumMoney);
//    $('.noDiscount').text(sumNoDis);
//    $('.difference').text(sumNoDis - sumMoney);
//
//    checkboxes.forEach((checkbox) => {
//        if (selectAll.checked) {
//        	checkbox.checked = selectAll.checked
//        } else {
//        	checkbox.checked = selectAll.unChecked
//        	$('.countMoney').text(0);
//        	$('.noDiscount').text(0);
//        	$('.difference').text(0);
//
//        }
//    });
//    
//	
//    
//    
//}

function del_row(ths) {
	var itemCodeString = $(ths).parent().find('.itemCodeOne').val();
	let itemCode = Number(itemCodeString);
    var ths = $(ths);
    
    $.ajax({
    	url: 'deleteCart',
    	type: 'post',
    	data: {
    		itemCode : itemCode
    		},
    	success: function(res) {
    		location.reload();
    		ths.parents("li").remove();
    		 $(window).prop("location", location.href);
    	},
    	error: function(err) {
    		console.log(err);
    	}
    })
    
    // console.log(itemCode);
}



function dropup() { /* 접기 / 펼치기 */


    if (document.getElementById('dropup_list').style.display === 'block') {
        document.getElementById('dropup_list').style.display = 'none';
        $(".btn_dropup").addClass('off');
        return;
    }


    else {
        document.getElementById('dropup_list').style.display = 'block';
        $(".btn_dropup").removeClass('off');


    }
}


$(document).ready(function () { /* 체크박스 선택후 삭제하기 */
	
    $('.btn_delete').click(function () {

        $.ajax({
        	url: 'deleteCart',
        	type: 'post',
        	data: {
        		itemCode : itemCode
        		},
        	success: function(res) {
        		location.reload();
        		ths.parents("li").remove();
        		 $(window).prop("location", location.href);
        		 
        		 // 현재 체크된 체크박스의 li 정보 얻기
        		 $("input:checkbox[name=checkOne]").each(function () {
        			 if (this.checked) {
        				 var ths = $(this);
        				 ths.parents("li").remove();
        			 }
        		 });
        		 
        	},
        	error: function(err) {
        		console.log(err);
        	}
        })
    	
    	
    });
});
