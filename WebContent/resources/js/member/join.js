$( document ).ready(function() {
	// 체크박스 전체 선택
	$(".checkbox_group").on("click", "#check_all", function () {
		console.log(1111);
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
});

//------------------------------ [ 유효성 검사 ] ---------------------------------
// 2023-04-16 김서영
function validate() {
	let id = $("#submit_check_id");
	let pw = $("#submit_check_pw")
	let pw2 = $("#submit_check_pw2");
	let name = $("#submit_check_name");
	let email = $("#loginId");
	let phone = $("#submit_check_phone");
	let gender = $("input[type=radio][name=gender]:checked").val();
	let birthDate = $("#birth_year").val() + $("#birth_month").val() + $("#birth_day").val();
	let zipcode = $("#zipCode").val();
	let shipAddr = $ ("#shipAddr").val();
	let shipAddrInfo = $("#shipAddrInfo").val();


	// id 검사 => 소문자, 숫자 포함 6~12  => 아이디 중복확인에 추가함....
	let regExp = /^[a-z][a-z\d]{6,12}$/;

	if(!regExp.test(id.val())) {
		alert("아이디를 정확히 입력해주세요.");
		id.focus();
		return false;
	}

	// 비밀번호 검사 => 영문/숫자/특수문자를 포함한 10글자 이상의 비밀번호
	regExp = /^[a-z\d!@#$%^]{10,}$/;

	if(!regExp.test(pw.val())) {
		alert("비밀번호를 정확히 입력해주세요.");
		pw.val("");
		pw.focus();
		return false;
	}

	// 비밀번호 확인
	if(pw.val() != pw2.val()) {
		alert("위의 비밀번호와 일치하도록 입력해주세요.");
		pw2.val("");
		pw2.focus();
		return false;
	}

	// 이름 검사
	regExp = /^[가-힣]{2,}$/;

	 if(!regExp.test(name.val())) {
        alert("이름을 정확히 입력해주세요.");
        name.focus();
        return false;
	            }

	// 이메일 검사
	if(email.val().length == 0) {
		alert("이메일을 정확히 입력해주세요.");
		email.focus();
		return false;
	}

	// 핸드폰 번호 검사 => 11 숫자만
	regExp = /^\d{3}\d{3,4}\d{4}$/;

	if(!regExp.test(phone.val())) {
		alert("핸드폰 번호를 정확히 입력해주세요.");
		phone.focus();
		return false;
	}
	var data = { memberId : id.val()
				 , password : pw.val()
				 , userName : name.val()
				 , email : email.val()
				 , phoneNumber : phone.val()
				 , zipcode : zipcode
				 , shipAddr : shipAddr
				 , shipAddrInfo : shipAddrInfo
				 , gender : gender
				 , birthDate : birthDate};

	console.log(data);
	$.ajax({
		  url : "insert.me"
		, type : "post"
		, data : data
		, success : function(result) {

			if(result.success == 'Y') { // 가입 성공
				alert(result.message);
				console.log("성공");
				location.href = "/main";
			} else { // 가입 실패
				alert(result.message);
				console.log("실패");
			}
		}
		, error : function() {
			console.log("회원가입용 ajax 통신 실패!!");
		}

	});

	return true;
}


/* 정규표현식으로 바꿈....
function on_id_check(){          //id 검사 함수
    let id = $("#submit_check_id").val();
    let regExp  =  /^[a-z][a-z\d]{5,11}$/;

    if(!regExp.test(id)) {
		alert("아이디를 확인 후 다시 입력해 주세요.");
		id.select();
		return false;
	}
  }


  function on_pw_check(){           //비밀번호 검사 함수
    let pw = $("#submit_check_pw").val();
    const num = /[0-9]/;
    const eng = /[a-zA-Z]/;
    const spe = /[~!@#$%^&*()_+|<>?:{}]/;
    if(pw.length < 10){

      alert('비밀번호를 정확히 입력해주세요.');
      return false;
    }else if(num.test(pw) == 0 || eng.test(pw) == 0 || spe.test(pw) == 0){

      alert('비밀번호를 정확히 입력해주세요.');
      return false;
    }
    else{

      return true;
    }
  }

  function on_pw2_check(){           //비밀번호 확인 검사 함수
    let pw = $("#submit_check_pw").val();
    let pw2 = $("#submit_check_pw2").val();

   if(pw != pw2){

      alert('비밀번호가 일치하지 않습니다. 확인 후, 다시 입력해주세요.');
      return false;
    }
    else{

      return true;
    }
  }

  function on_name_check(){             //이름 검사 함수
    let name = $("#submit_check_name").val();
    const num = /[0-9]/;
    const eng = /[a-zA-Z]/;
    const spe = /[~!@#$%^&*()_+|<>?:{}]/;
    if(name.length == 0){

      alert('이름을 입력해주세요.');
      return false;
    } else if(num.test(name) == 0 || eng.test(name) == 0 || spe.test(name) == 0){

      alert('이름을 정확히 입력해주세요.');
      return false;
    } else{

      return true;
    }
  }

  function on_email_check(){             //이메일 검사 함수
    let email = $("#loginId").val();
    if(email.length == 0){

      alert('이메일을 정확히 입력해주세요');
      return false;
    }else{

      return true;
    }
  }

  function on_phone_check(){
    let phone = $("#submit_check_phone").val();
    const eng = /[a-zA-Z]/;
    const spe = /[~!@#$%^&*()_+|<>?:{}]/;
    const kor = /[ㄱ]/;
    if(phone.length != 11){

      alert('휴대폰 번호를 정확하게 입력해주세요');
      return false;
    }else{

      return true;
    }
  }
*/



  //----------------------------------------------------------
  function idCheck() {  // 아이디 중복확인 함수

	let $memberId = $("#submit_check_id");
	let regExp = /^[a-z][a-z\d]{6,12}$/;

	if(!regExp.test($memberId.val())) {
		alert("아이디를 정확히 입력해주세요.");
		return false;
	}

	$.ajax({
		  url : "idCheck.me"
		, type : "get"
		, data : { memberId : $memberId.val() }
		, success : function(result) {


			if(result == "NN") { // 사용불가
				alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
				$memberId.focus();  // 다시 입력유도
			} else { // 사용가능
				let answer = confirm("사용 가능한 아이디입니다. 사용하시겠습니까?");

				if(answer) { // 사용할 것임
					$("#formSubmit button[type=submit]").removeAttr("disabled"); // 회원가입 버튼 활성화

					$memberId.attr("readonly", true); // 아이디값 수정 못하게 확정
				} else { // 사용 안할것 임
					$memberId.focus(); // 다시 입력 유도
				}
			}
		}
		, error : function() {
			console.log("아이디 중복체크용 ajax 통신 실패!!");
		}

	});
}


// 카카오 주소 API // 2023-04-15 김서영

function searchAddr(){
	var themeObj = {
	   //bgColor: "", //바탕 배경색
	   searchBgColor: "#FE7477", //검색창 배경색
	   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
	   //pageBgColor: "", //페이지 배경색
	   //textColor: "", //기본 글자색
	   queryTextColor: "#FFFFFF" //검색창 글자색
	   //postcodeTextColor: "", //우편번호 글자색
	   //emphTextColor: "", //강조 글자색
	   //outlineColor: "", //테두리
	};

	var width = 500; //팝업의 너비
	var height = 600; //팝업의 높이


	new daum.Postcode({

		 width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
		 height: height,

		oncomplete : function(data) {

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
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipCode').value = data.zonecode;
            document.getElementById("shipAddr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("shipAddrInfo").focus();

		}
	, theme: themeObj
	}).open({
		left: (window.screen.width / 2) - (width / 2),
	    top: (window.screen.height / 2) - (height / 2)
	});
}

