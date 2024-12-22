// Drag and Drop 기능 구현

const panelContent = document.querySelector('.panel-content');

// panelContent 유무 확인
if (!panelContent) {
    console.error("Error222: .panel-content element not found.");
} else {
    console.log("Drag and drop element found:", panelContent);
}

// zip 파일 업로드 관련 변수 설정 
const fileInfoDiv = document.getElementById('fileInfo');

let fName = '';
let fType = '';
let fSize = '';

 // Drag events
panelContent.addEventListener('dragover', (event) => {
    event.preventDefault();
	console.log('drag event done');
    panelContent.classList.add('drag-over');
});

panelContent.addEventListener('dragleave', () => {
	console.log('dragleave event done');
    event.preventDefault();
    panelContent.classList.remove('drag-over');
});

panelContent.addEventListener('drop', (event) => {
	console.log('drop event done');
    event.preventDefault();
    panelContent.classList.remove('drag-over');

    const file = event.dataTransfer.files[0];
    if (file) {
        const fileName = file.name;
        const fileType = file.type || 'Unknown type';
        const fileSize = (file.size / 1024).toFixed(2) + ' KB';
        
        uploadfile = file ;
        
        fName= fileName;
        console.log(fName);
        fType= fileType;
        fSize= fileSize;

        fileInfoDiv.innerHTML = `
            <p><strong>File Name:</strong> ${fileName}</p>
            <p><strong>File Type:</strong> ${fileType}</p>
            <p><strong>File Size:</strong> ${fileSize}</p>
        `;
    } else {
      fileInfoDiv.innerHTML = `<p style="color:red;">Please drop a valid ZIP file.</p>`;
    }
});


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