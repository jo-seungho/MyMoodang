					//-----------------------토글 js----------------------------------
                        function toggleContent(reviewNo) {
                    	    var contentRow = document.getElementById("content" + reviewNo);
                    	    if (contentRow.style.display === "none") {
                    	      contentRow.style.display = "table-row";
                    	    } else {
                    	      contentRow.style.display = "none";
                    	    }
                    	  }
                      //-----------------------별 js----------------------------------
                      function sortTable(columnIndex) {
                        var table, rows, switching, i, x, y, shouldSwitch;
                        table = document.getElementsByTagName("table")[0];
                        switching = true;
                        while (switching) {
                          switching = false;
                          rows = table.getElementsByTagName("tr");
                          for (i = 1; i < (rows.length - 1); i++) {
                            shouldSwitch = false;
                            x = rows[i].getElementsByTagName("td")[columnIndex];
                            y = rows[i + 1].getElementsByTagName("td")[columnIndex];
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                              shouldSwitch = true;
                              break;
                            }
                          }
                          if (shouldSwitch) {
                            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                            switching = true;
                          }
                        }
                      }
                    
                      function displayStars(rating) {
                        let stars = "";
                        for (let i = 1; i <= 5; i++) {
                          if (i <= rating) {
                            stars += "&#9733;"; 
                          } else {
                            stars += "&#9734;"; 
                          }
                        }
                        return stars;
                      }
             
                      let postRows = document.querySelectorAll(".post");
                    
          
                      postRows.forEach(function(row) {
                        let rating = parseInt(row.querySelector("td:nth-child(3)").innerText);
                        let stars = displayStars(rating);
                        row.querySelector("td:nth-child(3)").innerHTML = stars;
                      });
                      
                     //---------------------모달창--------------------------
                      
                      // 모달창 열기
                    var updateBtn = document.querySelector(".update-btn");
                    var modal = document.getElementById("update-modal");
                    var closeBtn = document.querySelector(".close");
     
                    // 모달창 닫기
                    closeBtn.addEventListener("click", function() {
                    modal.style.display = "none";
                    });
                    // 수정 내용 저장
                    var saveBtn = document.querySelector(".save-btn");
                    var updateTitle = document.getElementById("update-title");
                    var updateContent = document.getElementById("update-content");
                    document.getElementById("review-register-btn").addEventListener("click", function() {
                   	  var modal = document.getElementById("review-modal");
                   	  modal.style.display = "block";
                   	});
                   	// 모달 창 외부를 클릭하면 모달 창을 닫음
                   	window.onclick = function(event) {
                   	  var modalInsert = document.getElementById("review-modal");
                   	  if (event.target == modalInsert) {
                   		modalInsert.style.display = "none";
                   	  }
                   	}
                   	
                  //---------------------리뷰 수정하기 ajax--------------------------
                   	
                 // 수정 버튼 클릭 시 처리하는 함수
                   	function reviewUpdateView(reviewNum) {
                   	//$(".update-btn").click(function() {
                   	  // 수정할 리뷰의 번호 가져오기
                   	  var reviewNo = reviewNum; 
                   		  //$(this).closest("tr.post").find("td:first-child").text();

                   	  // 해당 리뷰의 내용 가져오기
                   	  var reviewContent = $("#content" + reviewNo + " p").text();
                   	  
                   	  //제목값, 별점 값 가져오기

                   	  // 기존 리뷰 내용 지우기(지우지말고 숨기고 나타내기로 변경)
                   	  $("#content" + reviewNo + " p").css('display','none');
                   	// 수정할 내용을 입력할 폼 추가하기
                   	//별점
                   	//$("#contentBox" + reviewNo).append("별점");
                   	  
                   	//제목
                   	//$("#contentBox" + reviewNo).append("<input type='text' value='reviewContent'>");
                   	  
                   	//내용  
                   	$("#contentBox" + reviewNo).append("<textarea id='updateContent'>" + reviewContent + "</textarea>");
                   	

                   	  // 수정 버튼을 수정 완료 버튼으로 변경하기
                   	  $("#updateViewBtn" + reviewNo).css('display','none');
                   	  $("#updateExcuteBtn" + reviewNo).css('display','block');
                   	}
                   	  // 수정 완료 버튼 클릭 시 처리하는 함수
                   	
                   	function reviewUpdate(reviewNum){
                   		var content = $('#updateContent').val();
                   		var params = 
                   		$.ajax({
                            type : 'GET',            // HTTP method type(GET, POST) 형식이다.
                            url : '/AjaxItemReviewUp.re',      // 컨트롤러에서 대기중인 URL 주소이다.
                            data : {bno : reviewNum, content : content},            // Json 형식의 데이터이다.
                            success : function(result){ // 비동기통신의 성공일경우 success콜백으로 들어옴.
                                if(result == 1) {
                                	
                                	$("#content" + reviewNum + " p").text(content);
                                	$("#content" + reviewNum + " p").css('display','block');
                                	$('#updateContent').css('display','none');
                                	//화면 수정 완료 후 처리 할 부분 들어가야함.(버튼, 내용 보여지는 방식)
                                	//수정된 값을 리뷰 상세보기 때 보여주는 p태그에 값을 넣고 p태그 다시 보여주기
                                } else {
                                	alert("리뷰 수정 실패");
                                }
                            },
                            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                            	 alert("code:"+XMLHttpRequest.status+"\n"+"message:"+XMLHttpRequest.responseText+"\n"+"error:"+errorThrown);
                                alert("통신 실패");
                            }
                        });
                   	}
                   	  
                  
                   	

    	
                   	
                   	
	