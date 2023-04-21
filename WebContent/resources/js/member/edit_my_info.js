 $(function() {

	let gender = "<%= gender %>";

	$("input[type=radio").each(function() {
		if(gender.search($(this).val()) != -1) {
			$(this).attr("checked", true);
		}
	})
});


function updateInfo() {

	let $id = $("#loginId");
	let $email = $("#email");
	let $name = $("#submit_check_name");
	let $phone = $("#submit_check_phone");
	let $gender = $("input[type=radio]");
	let $year = $("#birth_year");
	let $month = $("#birth_month");
	let $day = $("#birth_day")



	var data = { }



// 비밀번호 일치 여부를 검사 (유효성 검사)
function validatePwd() {

    // 일치하지 않는다면 기본이벤트 제거 => false 리턴
    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
        // input 타입의 name값이 updatePwd인 것과    input 타입의 name값이 checkPwd인 것이 일치 하지 않는다면
        alert("비밀번호가 일치하지 않습니다.");
        return false;  // false 값이 onclick으로 돌아가서 return false가 되어야 하기때문에 위에 onclick 속성에 return validatePwd로 작성한 것임
    }
}


// Get the modal
var modal = document.getElementById("updatePwdForm");

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


// Get the modal
var modal = document.getElementById("deleteForm");

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
