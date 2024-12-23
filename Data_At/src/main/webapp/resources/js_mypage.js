// 닉네임 변경 기능 추가 12.22
  // 요소 가져오기
        const changeNicknameBtn = document.getElementById('change-nickname-btn');
        const inputNickname = document.getElementById('input-nickname');
        const nicknameDisplay = document.getElementById('change-nickname');

        // 버튼 클릭 이벤트: 입력창 표시, 닉네임 숨기기
        changeNicknameBtn.addEventListener('click', () => {
            inputNickname.style.display = 'block'; // 입력창 보이기
            nicknameDisplay.style.display = 'none'; // 현재 닉네임 숨기기
        });

        // 입력창에서 Enter 키 입력 시: 닉네임 업데이트 및 표시
        inputNickname.addEventListener('keypress', (event) => {
            if (event.key === 'Enter') { // Enter 키 확인
                const newNickname = inputNickname.value.trim(); // 입력값 가져오기

                if (newNickname) {
                	$.ajax({
                		url : "updateNick",
                		type : "POST",
                		data : {
                			"user_nick" : newNickname
                		},
                		success : function() {
                			nicknameDisplay.textContent = newNickname; // 닉네임 업데이트
                		},
                		error : function() {
                			alert("닉네임 변경 실패") ;
                		}
                	}) ;
                	
                }

                inputNickname.style.display = 'none'; // 입력창 숨기기
                nicknameDisplay.style.display = 'block'; // 닉네임 표시
                inputNickname.value = ''; // 입력창 초기화
            }
        });
        
// ------

// 계정 삭제 기능    
// 제발... 적용좀 되게 해주세요...
const deleteIdBtn = document.getElementById('delete-id-btn');

if(deleteIdBtn){   // if문 안걸어주면 오류나서 우측상단 목록아이콘 클릭이 안먹힙니다 ㅠㅠ.
    deleteIdBtn.addEventListener('click', () => {
        alert('Your Account is being Deleted');
    });
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
// close 버튼 누르면 이전에 입력한 id='fileInfo' div의 내용도 사라져야한다.

// zip 파일 업로드 관련 변수 설정
// 다른 외부 script와 변수명이 같으면 js파일이 다 고장납니다 ^^  
const fileInfoDiv2 = document.getElementById('fileInfo');  

closePanelBtn.addEventListener('click', () => {
newDatasetPanel.classList.remove('visible');
// id='fileinfo' div의 내용물 초기화
fileInfoDiv2.innerHTML = '';
});





// 마이페이지 버튼 클릭할때마다 페이지 전환 



// settings 페이지 변수 모음 
const settingsPage = document.getElementById('settings-page');
const accountPage = document.getElementById('account-page');
const myuploadPage = document.getElementById('myupload-page');

// credit 페이지 변수 모음
const creditsPage = document.getElementById('credits-page');
const creditHistoryPage = document.getElementById('creditHistory-page');
const creditPurchasePage = document.getElementById('creditPurchase-page');


// settings 페이지 버튼 모음 
const settingsBtn = document.getElementById('settings-btn');
const accountBtn = document.getElementById('account-btn');
const myuploadBtn = document.getElementById('myupload-btn');


// credit 페이지 버튼 모음
const creditsBtn = document.getElementById('credits-btn');  
const creditHistoryBtn = document.getElementById('history-btn');
const purchaseBtn = document.getElementById('purchase-btn'); 

// 로딩 완료 후 첫 화면 mypage 세팅 
settingsPage.style.display = 'block';
accountPage.style.display = 'block';
myuploadPage.style.display = 'none';

creditsPage.style.display = 'none';
creditHistoryPage.style.display = 'none';
creditPurchasePage.style.display = 'none';



const elements_tab_li = document.querySelectorAll(".tabs li");

// Mypage 버튼 클릭 
settingsBtn.addEventListener('click', (e) => {
e.preventDefault();
settingsPage.style.display = 'block';
creditsPage.style.display = 'none';

if(accountBtn.classList.contains('active2')){
    accountPage.style.display = 'block';
    myuploadPage.style.display = 'none';  
}else{
     accountPage.style.display = 'none';
     myuploadPage.style.display = 'block';
}    

});

// Credits 버튼 클릭 
if (creditsBtn && creditsPage && creditHistoryBtn && creditHistoryPage) {
creditsBtn.addEventListener('click', (e) => {
e.preventDefault();
settingsPage.style.display = 'none';    
creditsPage.style.display = 'block';    

if(creditHistoryBtn.classList.contains('active')){
    creditHistoryPage.style.display = 'block';
    creditPurchasePage.style.display = 'none';
}else{
    creditHistoryPage.style.display = 'none';
    creditPurchasePage.style.display = 'block';
}
  
});

} else {
console.error("Element with ID 'credits-btn' not found.");
}



// credit history 태그 클릭
creditHistoryBtn.addEventListener('click', (e) => {
  console.log("credit history버튼 clicked");
e.preventDefault();
settingsPage.style.display = 'none';    
creditsPage.style.display = 'block';

creditHistoryPage.style.display = 'block';
creditPurchasePage.style.display = 'none';


});

// credit purchase 태그 클릭
purchaseBtn.addEventListener('click', (e) => {
  console.log("credit purchase 버튼 clicked");
e.preventDefault();
settingsPage.style.display = 'none';    
creditsPage.style.display = 'block';

creditHistoryPage.style.display = 'none';
creditPurchasePage.style.display = 'block';

});

// account 태그 클릭
accountBtn.addEventListener('click', (e) => {
  console.log(" account 버튼 clicked");
e.preventDefault();
settingsPage.style.display = 'block';    
creditsPage.style.display = 'none';

accountPage.style.display = 'block';
myuploadPage.style.display = 'none';


});

// myupload 태그 클릭
myuploadBtn.addEventListener('click', (e) => {
  console.log("myupload 버튼 clicked");
  e.preventDefault();
  
  $.ajax({
  	url : "userUploadList",
  	type : "POST",
  	success: function(list) {
  		console.log("uploadlist : ", list) ;
  	
  		settingsPage.style.display = 'block';    
		creditsPage.style.display = 'none';
		
		accountPage.style.display = 'none';
		myuploadPage.style.display = 'block';
		  let listHtml = "";

          listHtml += "<tr>";
          listHtml += "<th>Data Title</th>";
          listHtml += "<th>Size</th>";
          listHtml += "<th>Upload Date</th>";
          listHtml += "</tr>";

          $.each(list, function(index, c) {
              listHtml += "<tr>";
              listHtml += "<td>" + c.img_title + "</td>";
              listHtml += "<td>" + c.img_size + "</td>";
              listHtml += "<td>" + c.created_at + "</td>";
              listHtml += "</tr>";
          });

          $("#myupload-table").html(listHtml);
        },
        error: function() {
          console.error("업로드 데이터 불러오기 실패");
        }

  }) ;



});




// credit 페이지 li태그 색 변화
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

// settings 페이지 li태그 색 변화
document.getElementById("account-btn").addEventListener("click", function () {
setActive2Tab("account-btn");
});

document.getElementById("myupload-btn").addEventListener("click", function () {
setActive2Tab("myupload-btn");
});

function setActive2Tab(active2Id) {
// 모든 탭의 active2 클래스 제거
const tabs2 = document.querySelectorAll(".tabs2 li");
tabs2.forEach(tab => tab.classList.remove("active2"));

// 클릭된 탭에 active2 클래스 추가
const active2Tab = document.getElementById(active2Id);
active2Tab.classList.add("active2");
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


