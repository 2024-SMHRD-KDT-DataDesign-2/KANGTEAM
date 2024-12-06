
// Example interactivity for the "Search" button


const heroButton = document.querySelector('.hero button')

if (heroButton) {
	heroButton.addEventListener('click', () => {
  	  alert('Welcome to DataPlatform!');    
  });
  } else {
  	 console.error("heroButton을 찾을 수 없습니다.");
  }
  

// JavaScript to handle the sidebar toggle
const menuToggleBtn = document.querySelector('.menu-toggle')
  
  if (menuToggleBtn) {
  menuToggleBtn.addEventListener('click', () => {
    console.log("menu-toggle 버튼 클릭");
    document.body.classList.toggle('sidebar-open');
  });
} else {
  console.error("menu-toggle 버튼을 찾을 수 없습니다!");
}
  
      
const getStartedBtn = document.querySelector('#getStarted');
  
 
if (getStartedBtn) {
	getStartedBtn.addEventListener('click', () => {
  	console.log("get Started 버튼 작동");
  });
  } else {
  	 console.error("getStarted Button을 찾을 수 없습니다.");
  }
  
  // 데이터 업로드 페이지 구현
  // Select elements
  
const newDatasetBtn = document.getElementById('new-dataset-btn');
const newDatasetPanel = document.getElementById('newDatasetPanel');
const closePanelBtn = document.getElementById('closePanelBtn');

// Open the panel when the "+ New Dataset" button is clicked


newDatasetBtn.addEventListener('click', () => {
	console.log("new Dataset 버튼 작동");
  newDatasetPanel.classList.add('visible');
  newDatasetPanel.classList.remove('hidden');

});

// Close the panel when the "X" button is clicked

closePanelBtn.addEventListener('click', () => {
  newDatasetPanel.classList.remove('visible');
});
  
  
  // 마이페이지 버튼 클릭할때마다 페이지 전환 
  
  document.addEventListener('DOMContentLoaded', () => {
  
  const settingsPage = document.getElementById('settings-page');
  const creditsPage = document.getElementById('credits-page');
  const uploadedPage = document.getElementById('uploaded-page');
  const downloadedPage = document.getElementById('downloaded-page');
  
  const settingsBtn = document.getElementById('settings-btn');
  const creditsBtn = document.getElementById('credits-btn'); 
  const uploadedBtn = document.getElementById('uploaded-btn');
  const downloadedBtn = document.getElementById('downloaded-btn');
  

  // 초기 설정: Settings 페이지만 보이도록 설정
  settingsPage.style.display = 'block';
  creditsPage.style.display = 'none';
  uploadedPage.style.display = 'none';
  downloadedPage.style.display = 'none';

  // Settings 버튼 클릭 이벤트
  settingsBtn.addEventListener('click', (e) => {
    e.preventDefault();
    settingsPage.style.display = 'block';
    creditsPage.style.display = 'none';
    uploadedPage.style.display = 'none';
    downloadedPage.style.display = 'none';
  });

  // Credits 버튼 클릭 이벤트
  creditsBtn.addEventListener('click', (e) => {
    e.preventDefault();
    settingsPage.style.display = 'none';
    creditsPage.style.display = 'block';
    uploadedPage.style.display = 'none';
    downloadedPage.style.display = 'none';
  });
  
  // Uploaded 버튼 클릭 이벤트
  uploadedBtn.addEventListener('click', (e) => {
  	console.log("uploaded button clicked");
    e.preventDefault();
    settingsPage.style.display = 'none';
    creditsPage.style.display = 'none';
    uploadedPage.style.display = 'block';
    downloadedPage.style.display = 'none';
  });
  
  // Downloaded 버튼 클릭 이벤트
  downloadedBtn.addEventListener('click', (e) => {
  	console.log("downloaded button clicked");
    e.preventDefault();
    settingsPage.style.display = 'none';
    creditsPage.style.display = 'none';
    uploadedPage.style.display = 'none';
    downloadedPage.style.display = 'block';
  });
  
  
});

	// mypage - uploaded 페이지 checkbox 기능
	
	// 전체 체크박스 선택
const selectAllCheckbox = document.getElementById("select-all");
// 개별 체크박스들
const itemCheckboxes = document.querySelectorAll(".item-checkbox");
// 선택된 개수를 보여주는 텍스트
const selectedCountText = document.getElementById("selected-count");

// 전체 선택 로직
selectAllCheckbox.addEventListener("change", function () {
  const isChecked = selectAllCheckbox.checked;
  itemCheckboxes.forEach((checkbox) => {
    checkbox.checked = isChecked;
  });
  updateSelectedCount();
});

// 개별 선택 로직
itemCheckboxes.forEach((checkbox) => {
  checkbox.addEventListener("change", function () {
    updateSelectedCount();
    // "전체 선택" 체크박스 상태 업데이트
    selectAllCheckbox.checked = Array.from(itemCheckboxes).every(
      (checkbox) => checkbox.checked
    );
  });
});

// 선택된 개수 업데이트
function updateSelectedCount() {
  const selectedCount = Array.from(itemCheckboxes).filter(
    (checkbox) => checkbox.checked
  ).length;
  selectedCountText.textContent = `${selectedCount} selected`;
} 