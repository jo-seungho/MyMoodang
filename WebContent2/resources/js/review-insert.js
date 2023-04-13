
$(document).ready(function () {
  $("#uploadImg-B").on("click", function () {
    $("#image-file").click();
  });

  function createImagePreview(src) {
    const img = document.createElement("img");
    img.src = src;
    img.alt = "등록한 이미지 미리보기";
    img.style.maxWidth = "100px";
    img.style.height = "auto";
    img.style.marginRight = "5px";
    return img;
  }

  $("#image-file").on("change", function (e) {
    const file = e.target.files[0];
    const reader = new FileReader();

    reader.onload = function (e) {
      if ($("#uploaded-images img").length < 5) {
        const img = createImagePreview(e.target.result);
        $("#uploaded-images").append(img);
      } else {
        alert("최대 5장의 이미지만 등록할 수 있습니다.");
      }
    };

    reader.readAsDataURL(file);
  });
  // 리뷰 등록하기 버튼 클릭 이벤트
  $("#reviewInsert-submit").on("click", function () {
    const titleInput = $("#title-InputArea").val();
    const contentInput = $("#rev-content2").val();

    if (!titleInput || !contentInput) {
      alert("제목과 내용을 모두 입력해주세요.");
      return;
    }

    // 이곳에 리뷰 정보를 서버에 전송하는 코드를 작성하세요.

    // 리뷰가 성공적으로 등록되었음을 알리는 메시지를 표시합니다.
    alert("리뷰가 성공적으로 등록되었습니다.");
  });
});
/*
function isImage(file) {
  const acceptedImageTypes = ["image/gif", "image/jpeg", "image/png", "image/svg+xml", "image/webp"];
  return file && acceptedImageTypes.includes(file["type"]);
}

$(document).ready(function () {
  // 이미지 파일 입력 버튼 클릭 이벤트
  $("#image-file").on("change", function () {
    const validFiles = [];
    const invalidFiles = [];

    for (let i = 0; i < this.files.length; i++) {
      if (isImage(this.files[i]) && validFiles.length < 5) {
        validFiles.push(this.files[i]);
      } else {
        invalidFiles.push(this.files[i]);
      }
    }

    if (invalidFiles.length > 0) {
      alert("최대 5장의 이미지만 업로드할 수 있습니다. 잘못된 이미지는 제거됩니다.");
    }

    this.files = new FileList(validFiles); // 유효한 파일만 남깁니다.

    $("#uploaded-images").empty(); // 기존 미리보기 이미지를 초기화합니다.

    for (let i = 0; i < validFiles.length; i++) {
      const reader = new FileReader();

      reader.onload = function (e) {
        const imgTag = $("<img />", {
          src: e.target.result,
          alt: "업로드한 이미지 미리보기",
          style: "width: 100px; height: auto; margin-right: 5px;",
        });

        $("#uploaded-images").append(imgTag);
      };

      reader.readAsDataURL(validFiles[i]);
    }
  });

  // 파일 입력 버튼을 클릭하도록 이벤트를 위임합니다.
  $("#uploadImg-B").on("click", function () {
    $("#image-file").click();
  });

  // 리뷰 등록하기 버튼 클릭 이벤트
  $("#reviewInsert-submit").on("click", function () {
    const titleInput = $("#title-InputArea").val();
    const contentInput = $("#rev-content2").val();

    if (!titleInput || !contentInput) {
      alert("제목과 내용을 모두 입력해주세요.");
      return;
    }

    // 이곳에 리뷰 정보를 서버에 전송하는 코드를 작성하세요.

    // 리뷰가 성공적으로 등록되었음을 알리는 메시지를 표시합니다.
    alert("리뷰가 성공적으로 등록되었습니다.");
  });
});
*/

