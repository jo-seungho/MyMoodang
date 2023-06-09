



function sendFile(file, editor) {
  // Generate a unique filename for the uploaded image
  var filename = new Date().getTime() + '_' + Math.floor(Math.random() * 1000000) + '.' + file.name.split('.').pop();

  // Create a form for file transfer
  var data = new FormData();
  data.append("uploadFile", file, filename);

  $.ajax({
    // Handle file upload via ajax
    data: data,
    type: "POST",
    url: "/uploadFile",
    cache: false,
    contentType: false,
    processData: false,
    success: function(data) {
      // If processing succeeds, output the image to the editor
      $(editor).summernote('editor.insertImage', data.url);
    }
  });
}





$(document).ready(function () {
	$('#file-area').hide();

    // 각 자리에 맞는 이미지 태그를 클릭했을 경우
    // input type="file" 요소가 클릭되게끔 처리하기
    $('#titleImg').click(function () {
      $('#file1').click();
    });	
          //여기 아래 부분
          $('#summernote').summernote({
        		
            height: 1000, // 에디터 높이
            focus: true, // 에디터 로딩후 포커스를 맞출지 여부
            lang: 'ko-KR', // 한글 설정
            placeholder: '* 상품 상세설명을 적어주세요.',
            disableResizeEditor: true, // 크기 조절 기능 삭제
            toolbar: [
              ['fontname', ['fontname']],
              ['fontsize', ['fontsize']],
              ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
              ['color', ['forecolor', 'color']],
              ['table', ['table']],
              ['para', ['ul', 'ol', 'paragraph']],
              ['height', ['height']],
              ['insert', ['picture', 'link', 'video']],
              ['view', ['fullscreen', 'help']],
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
            
            callbacks: { // 콜백을 사용
                // 이미지를 업로드할 경우 이벤트를 발생
				    onImageUpload: function(files, editor, welEditable) {
					    sendFile(files[0], this);
					}
            }
          });
        });