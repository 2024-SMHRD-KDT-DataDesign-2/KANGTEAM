
// Example interactivity for the "Search" button

	// 메인페이지 전환하기 ㅇㅇ
	// 모든 div 요소 가져오기
		    const divs = document.querySelectorAll('.background-box > div');
		    let currentIndex = 0; // 현재 보이는 div의 인덱스
		
		    // 5초마다 div를 번갈아 표시
		    function cycleDivs() {
		        // 모든 div를 숨김
		        divs.forEach(div => div.style.display = 'none');
		
		        // 현재 인덱스에 해당하는 div만 표시
		        divs[currentIndex].style.display = 'flex';
		
		        // 다음 인덱스 계산
		        currentIndex = (currentIndex + 1) % divs.length;
		    }
		
		    // 페이지 로드 시 첫 번째 div 표시 및 setInterval 시작
		document.addEventListener("DOMContentLoaded", () => {
			console.log(document.getElementById('new-dataset-btn')); // 버튼이 정상적으로 선택되는지 확인
			console.log(document.getElementById('newDatasetPanel')); // 패널이 정상적으로 선택되는지 확인
			
		    divs.forEach(div => div.style.display = 'none'); // 초기화: 모든 div 숨김
		    divs[0].style.display = 'flex'; // 첫 번째 div 표시
		    setInterval(cycleDivs, 5000); // 5초마다 실행
		});



  

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
  

  // ***우측 데이터 업로드 페이지 구현***
  
const newDatasetBtn = document.getElementById('new-dataset-btn');
const newDatasetPanel = document.getElementById('newDatasetPanel');
const closePanelBtn = document.getElementById('closePanelBtn');

// Open the panel when the "+ New Dataset" button is clicked


newDatasetBtn.addEventListener('click', () => {
	console.log("new Dataset 버튼 작동");
  newDatasetPanel.classList.add('visible');
  newDatasetPanel.classList.remove('hidden'); // 원래 hidden 클래스가 잇어야함?

});



// Close the panel when the "X" button is clicked

closePanelBtn.addEventListener('click', () => {
  newDatasetPanel.classList.remove('visible');
});



  
  
  // 마이페이지 버튼 클릭할때마다 페이지 전환 
  
  document.addEventListener('DOMContentLoaded', () => {
  
  const settingsPage = document.getElementById('settings-page');
  const creditsPage = document.getElementById('credits-page');
  
  const creditHistoryPage = document.getElementById('creditHistory-page');
  const creditPurchasePage = document.getElementById('creditPurchase-page');
  
  const uploadedPage = document.getElementById('uploaded-page');  
  const downloadedPage = document.getElementById('downloaded-page');
  

  
  
  const settingsBtn = document.getElementById('settings-btn');
  const creditsBtn = document.getElementById('credits-btn');
  
  const creditHistoryBtn = document.getElementById('history-btn');
  const purchaseBtn = document.getElementById('purchase-btn'); 
  
  const uploadedBtn = document.getElementById('uploaded-btn');
  const downloadedBtn = document.getElementById('downloaded-btn');
  

  // 초기 설정: Settings 페이지만 보이도록 설정
  settingsPage.style.display = 'block';
  creditsPage.style.display = 'none';
  uploadedPage.style.display = 'none';
  downloadedPage.style.display = 'none';
  creditPurchasePage.style.display = 'none';

  const elements_tab_li = document.querySelectorAll(".tabs li");
  
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
         
    console.log(elements_tab_li[0].classList.contains("active"));
    console.log(elements_tab_li[1].classList.contains("active"));
      
    // 얘가 문제인데...
    if(document.getElementById("history-btn").classList.contains("active")){       
    	creditHistoryPage.style.display = 'block';
    	creditPurchasePage.style.display = 'none';
    } else if(document.getElementById("purchase-btn").classList.contains("active")){
    	creditHistoryPage.style.display = 'none';
    	creditPurchasePage.style.display = 'block';
    }
        
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
    creditPurchasePage.style.display = 'none';
  });
  
  // Downloaded 버튼 클릭 이벤트
  downloadedBtn.addEventListener('click', (e) => {
  	console.log("downloaded button clicked");
    e.preventDefault();
    settingsPage.style.display = 'none';
    creditsPage.style.display = 'none';
    uploadedPage.style.display = 'none';
    downloadedPage.style.display = 'block';
    creditPurchasePage.style.display = 'none';
  });
  
  // credit history 태그 클릭
  creditHistoryBtn.addEventListener('click', (e) => {
  	console.log("credit history버튼 clicked");
    e.preventDefault();
    settingsPage.style.display = 'none';
    
    creditsPage.style.display = 'block';
    creditHistoryPage.style.display = 'block';
    creditPurchasePage.style.display = 'none';
    
    uploadedPage.style.display = 'none';
    downloadedPage.style.display = 'none';

  });
  
  // credit purchase 태그 클릭
  purchaseBtn.addEventListener('click', (e) => {
  	console.log("credit purchase 버튼 clicked");
    e.preventDefault();
    settingsPage.style.display = 'none';
    
    creditsPage.style.display = 'block';
    creditHistoryPage.style.display = 'none';
    creditPurchasePage.style.display = 'block';
    
    uploadedPage.style.display = 'none';
    downloadedPage.style.display = 'none';
    
    
    
  });
  
  
});


document.getElementById("history-btn").addEventListener("click", function () {
    setActiveTab("history-btn");
});

document.getElementById("purchase-btn").addEventListener("click", function () {
    setActiveTab("purchase-btn");
});

function setActiveTab(activeId) {
    // 모든 탭의 active 클래스 제거
    const tabs = document.querySelectorAll(".tabs li");
    tabs.forEach(tab => tab.classList.remove("active"));

    // 클릭된 탭에 active 클래스 추가
    const activeTab = document.getElementById(activeId);
    activeTab.classList.add("active");
}


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


//-------------------------크레딧 구매 페이지 기능---------------------

function showPopup() {
    document.getElementById('popup').style.display = 'flex';
}

function addDigit(digit) {
    const amountField = document.getElementById('credit-amount');
    let currentAmount = amountField.value.replace('€', '').replace(',', '');
    if (currentAmount === "0.00") currentAmount = "";
    currentAmount += digit;
    amountField.value = parseFloat(currentAmount).toFixed(2);
}

function clearAmount() {
    document.getElementById('credit-amount').value = "0.00";
}

function useCredit() {
    alert("Using credit: €" + document.getElementById('credit-amount').value);
    document.getElementById('popup').style.display = 'none';
}

function toggleTheme() {
    const body = document.body;
    const container = document.querySelector('.container');
    const icon = document.getElementById('theme-icon');

    body.classList.toggle('dark');
    container.classList.toggle('dark');

    if (body.classList.contains('dark')) {
        icon.textContent = '🌙'; // Moon icon for dark mode
    } else {
        icon.textContent = '☀️'; // Sun icon for light mode
    }
}

function makeEditable() {
    document.getElementById('name').setAttribute('contenteditable', 'true');
    document.getElementById('email').setAttribute('contenteditable', 'true');
    document.getElementById('phone').setAttribute('contenteditable', 'true');

    // Show the save icon
    document.querySelector('.save-icon').style.display = 'inline';
}

function saveChanges() {
    document.getElementById('name').setAttribute('contenteditable', 'false');
    document.getElementById('email').setAttribute('contenteditable', 'false');
    document.getElementById('phone').setAttribute('contenteditable', 'false');

    // Hide the save icon
    document.querySelector('.save-icon').style.display = 'none';

    alert("Changes saved!");
}


// -------- 검색기능 --------------------------------------------------------------------------


backgroundCh = function() {
    var sel = document.getElementById('sel');
    sel.style.backgroundColor = sel.value;
};

// ------ 모달창 -------

    var modalLayer = $("#modalLayer");
    var modalLink = $(".modalLink");
    var modalCont = $(".modalContent");
    var marginLeft = modalCont.outerWidth()/2;
    var marginTop = modalCont.outerHeight()/2; 
    
    // 클릭시 모달 표시
 	modalLink.addEventListener('click', () => {
  		modalLayer.style.display = 'block';
	});
         
    // 모달창 열기
    modalLink.click(function(){
        console.log('modal clicked 스프링');
      modalLayer.style.display='block';
      modalLayer.fadeIn("slow");
      modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
      $(this).blur();
      $(".modalContent > a").focus(); 
      return false;
    });
  
    // 모달창 닫기
    $("#close-modal").click(function(){
      console.log('modal창 닫기');
      modalLayer.fadeOut("slow");
      modalLink.focus();
    });	
    
    		
   document.querySelector('#test_mypagelogo').click(function(){
   	console.log('clicked');
   });
   


