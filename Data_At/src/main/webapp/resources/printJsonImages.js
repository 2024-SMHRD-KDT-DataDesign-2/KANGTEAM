const fileSystemDiv = document.getElementById('file-system');
const fileList = document.getElementById('file-list');

// Add drag-and-drop events
dropZone.addEventListener('dragover', (event) => {
  event.preventDefault();
  dropZone.classList.add('dragover');
});

dropZone.addEventListener('dragleave', () => {
  dropZone.classList.remove('dragover');
});

// 페이지 로딩 시 json 이미지 가져오기
$(document).ready(function () {
  const img_id = $("#img_id").val() ;

   $.ajax({
        url: "jsonImageSelect",
        type: "POST",
        data: { "img_id": img_id },
        success: function (response) {
            console.log("jsonImage:", response);

            // JSON 변환이 필요한 경우 처리
            const jsonImage = typeof response === "string" ? JSON.parse(response) : response;

            // 응답 데이터가 배열인지 확인
            if (!Array.isArray(jsonImage)) {
                console.error("jsonImage가 배열이 아닙니다.");
                return;
            }

            // 이미지 출력
            jsonImage.forEach((url) => {
                const imgElement = document.createElement("img");
                imgElement.src = url;
                imgElement.alt = "Image";
                imgElement.style.width = "150px";
                imgElement.style.margin = "10px";
                fileSystemDiv.appendChild(imgElement);
            });
        },
        error: function () {
            alert("실패");
        },
    });
});
