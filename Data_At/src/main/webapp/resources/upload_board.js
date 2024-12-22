// 업로드기능 12.22

// 파일 정보를 저장할 변수
let uploadedFile = null;

// 버튼과 파일 입력 요소
const uploadButton = document.getElementById('uploadButton');
const fileInput = document.getElementById('fileInput');
const fileInfo = document.getElementById('fileInfo');

// 버튼 클릭 시 파일 탐색기 열기
uploadButton.addEventListener('click', () => {
    fileInput.click(); // 숨겨진 input을 클릭
});

// 파일 선택 후 이벤트
fileInput.addEventListener('change', (event) => {
    const file = event.target.files[0]; // 선택한 파일 가져오기
    if (file) {
        uploadedFile = file; // 파일 정보를 변수에 저장
        const fileName = file.name;
        const fileSize = (file.size / 1024).toFixed(2) + ' KB';
        const fileType = file.type || 'Unknown';

        // 파일 정보 표시
        fileInfo.innerHTML = `
            <p><strong>File Name:</strong> ${fileName}</p>
            <p><strong>File Size:</strong> ${fileSize}</p>
            <p><strong>File Type:</strong> ${fileType}</p>
        `;

        console.log('Uploaded File:', uploadedFile);
    } else {
        fileInfo.innerHTML = `<p style="color: red;">No file selected.</p>`;
    }
});

// --------------------

// 우측 두번째 패널 열기
const uploadbtn = document.getElementById('uploadcontentbtn');
const newDatasetPanel2 = document.getElementById('newDatasetPanel2');

// span 태그에 zip 이름, 사이즈 출력할 변수
zipnameSpanTag = document.getElementById('zip-name'); 
zipsizeSpanTag = document.getElementById('zip-size'); 

uploadbtn.addEventListener('click', () => {
	console.log('uploadcontentbtn clicked');
	newDatasetPanel.classList.add('hidden');
  	newDatasetPanel.classList.remove('visible');
	newDatasetPanel2.classList.add('visible');
  	newDatasetPanel2.classList.remove('hidden');
  	zipnameSpanTag.innerText = fName;
  	zipsizeSpanTag.innerText = fSize;

});

const tagInput = document.getElementById("tag-input");
const tagsContainer = document.getElementById("tags");

// 태그 목록 저장용 배열
let tags = [];

// 태그 추가 함수
function addTag(tag) {
    if (tag && !tags.includes(tag)) { // 중복 방지
        tags.push(tag);

        // 태그 HTML 생성
        const tagElement = document.createElement("div");
        tagElement.classList.add("tag");
        tagElement.innerHTML = `${tag} <span>&times;</span>`;

        // 삭제 기능 추가
        tagElement.querySelector("span").addEventListener("click", () => {
            removeTag(tag);
        });
        
        let classes = $("#hiddenclass").val() || ""; // 기존 값이 없으면 빈 문자열로 초기화
        classes += (tag + ","); // 새 태그 추가
        $("#hiddenclass").val(classes); // 업데이트된 값 설정

        console.log("class 잇니? : ", $("#hiddenclass").val());
        
        // 태그를 화면에 추가
        tagsContainer.appendChild(tagElement);
        
        // 입력 필드 비우기
        tagInput.value = "";
    }
}

// 태그 삭제 함수
function removeTag(tag) {
    tags = tags.filter(t => t !== tag); // 배열에서 삭제
    $("#hiddenclass").val("") ;
    console.log("class 잇니? : ", $("#hiddenclass").val());
    renderTags(); // 화면 리렌더링
}

// 태그 화면 리렌더링
function renderTags() {
    tagsContainer.innerHTML = ""; // 기존 태그 제거
    tags.forEach(tag => addTag(tag));
}

// Enter 키 이벤트 리스너
tagInput.addEventListener("keypress", (event) => {
    if (event.key === "Enter") {
        event.preventDefault();
        const tag = tagInput.value.trim();
        addTag(tag);
    }
});

// x버튼 누르면 upload content panel 끄기
	const removeUploadPanelbtn = document.getElementById('remove-uploadpanel2');

	removeUploadPanelbtn.addEventListener('click', () => {
		console.log('removeUploadPanelbtn clicked');
			newDatasetPanel2.classList.remove('visible');
			newDatasetPanel.classList.remove('visible');

	});

// reset버튼 누르면 input태그 내용 지우기 (작성한 텍스트, 태그 리스트 비우기)
	const resetBtn = document.getElementById('reset-btn01');
	
	resetBtn.addEventListener('click', () => {
		console.log('resetBtn clicked');
		document.getElementById('dataset-title').value='';
		document.getElementById('tag-input').value='';
		document.getElementById('dataset-content').value='';
		tags = [];
		document.getElementById('tags').innerHTML='';
		$("#hiddenclass").val("") ;
		
	});