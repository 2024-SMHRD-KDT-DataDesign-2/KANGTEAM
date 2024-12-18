const uploadbtn = document.getElementById('uploadcontentbtn');
const newDatasetPanel2 = document.getElementById('newDatasetPanel2');

uploadbtn.addEventListener('click', () => {
	console.log('uploadcontentbtn clicked');
	newDatasetPanel.classList.add('hidden');
  	newDatasetPanel.classList.remove('visible');
	newDatasetPanel2.classList.add('visible');
  	newDatasetPanel2.classList.remove('hidden');

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

        // 태그를 화면에 추가
        tagsContainer.appendChild(tagElement);

        // 입력 필드 비우기
        tagInput.value = "";
    }
}

// 태그 삭제 함수
function removeTag(tag) {
    tags = tags.filter(t => t !== tag); // 배열에서 삭제
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
		
	});
	
	