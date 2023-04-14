/* 따로 스크립트 분리하니 작동 안되어서 html 에 옮김

// 체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
});

// 체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;

    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
});
*/

   
function on_id_check(){          //id 검사 함수
    var id = $("#submit_check_id").val();
    var spe = /[~!@#$%^&*()_+|<>?:{}]/;
    if(id.length < 6){
      alert('아이디를 정확히 입력해주세요');
      return false;
    }else if(spe.test(id) == 1){

      alert('아이디를 정확히 입력해주세요');
      return false;
    }
    else{
      
      return true;
    }
  }

  function on_pw_check(){           //비밀번호 검사 함수
    var pw = $("#submit_check_pw").val();
    var num = /[0-9]/;
    var eng = /[a-zA-Z]/;
    var spe = /[~!@#$%^&*()_+|<>?:{}]/;
    if(pw.length < 10){
     
      alert('비밀번호를 정확히 입력해주세요');
      return false;
    }else if(num.test(pw) == 0 || eng.test(pw) == 0 || spe.test(pw) == 0){
      
      alert('비밀번호를 정확히 입력해주세요');
      return false;
    }
    else{
      
      return true;
    }
  }

  function on_pw2_check(){           //비밀번호 확인 검사 함수
    var pw = $("#submit_check_pw").val();
    var pw2 = $("#submit_check_pw2").val();
    if(pw2.length == 0){
      
      alert('비밀번호 확인을 다시해주세요');
      return false;
    }else if(pw != pw2){
      
      alert('비밀번호 확인을 다시해주세요');
      return false;
    }
    else{
      
      return true;
    }
  }

  function on_name_check(){             //이름 검사 함수
    var name = $("#submit_check_name").val();
    if(name.length == 0){
      
      alert('이름을 입력해주세요');
      return false;
    }else{
      
      return true;
    }
  }

  function on_email_check(){             //이메일 검사 함수
    var email = $("#loginId").val();
    if(email.length == 0){
      
      alert('이메일을 정확히 입력해주세요');
      return false;
    }else{
      
      return true;
    }
  }

  function on_phone_check(){              
    var phone = $("#submit_check_phone").val();
    if(phone.length != 11){
      
      alert('휴대폰 번호를 정확하게 입력해주세요');
      return false;
    }else{
      
      return true;
    }
  }



  function on_submit_check(){               // fomr에 onsubmit으로 최종적으로 넘겨야될 함수
    
    var check = false;                   //check변수에 false를 넣어주고 다른 함수들이 false를 반환하면 다음페이지로 못넘어가게 설정
    if(on_id_check() == check){
      return false;
    }else if(on_pw_check() == check){
      return false;
    }else if(on_pw2_check() == check){
      return false;
    }else if(on_name_check() == check){
      return false;
    }else if(on_email_check() == check){
      return false;
    }else if(on_phone_check() == check){
      return false;
    }
    else{
      return true;
    }
  }




  /*--------------------------[ 모달 관련 ]-------------------------------------*/
  
// Get the modal
var modal = document.getElementById("email_confirm");

// Get the <span> element that closes the modal
var closeBtn = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
closeBtn.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}