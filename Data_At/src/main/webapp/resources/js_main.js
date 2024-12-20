


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
		console.log("Settings Page Loaded");
		console.log(document.getElementById('new-dataset-btn')); // 버튼이 정상적으로 선택되는지 확인
		console.log(document.getElementById('newDatasetPanel')); // 패널이 정상적으로 선택되는지 확인
		
	    divs.forEach(div => div.style.display = 'none'); // 초기화: 모든 div 숨김
	    divs[0].style.display = 'flex'; // 첫 번째 div 표시
	    setInterval(cycleDivs, 5000); // 5초마다 실행
	    
	    
	    
	   
	});
		
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


