// DOMContentLoaded 이벤트로 모든 DOM 요소가 로드된 후 실행
document.addEventListener('DOMContentLoaded', () => {
    // --- Hero 버튼 ---
    const heroButton = document.querySelector('.hero button');
    if (heroButton) {
        heroButton.addEventListener('click', () => {
            console.log("Hero 버튼 클릭");
        });
    } else {
        console.error("Hero 버튼을 찾을 수 없습니다.");
    }




    // --- 마이페이지 탭 전환 ---
    const settingsPage = document.getElementById('settings-page');
    const creditsPage = document.getElementById('credits-page');
    const uploadedPage = document.getElementById('uploaded-page');
    const downloadedPage = document.getElementById('downloaded-page');
    const creditHistoryPage = document.getElementById('creditHistory-page');
    const creditPurchasePage = document.getElementById('creditPurchase-page');
    
    const pageMap = {
        'settings-btn': settingsPage,
        'credits-btn': creditsPage,
        'uploaded-btn': uploadedPage,
        'downloaded-btn': downloadedPage,
        'history-btn': creditHistoryPage,
        'purchase-btn': creditPurchasePage,
    };

    Object.keys(pageMap).forEach(buttonId => {
        const button = document.getElementById(buttonId);
        const page = pageMap[buttonId];
        
        if (button && page) {
            button.addEventListener('click', (e) => {
                e.preventDefault();
                console.log(`${buttonId} 버튼 클릭`);

                Object.values(pageMap).forEach(p => p.style.display = 'none'); // 모든 페이지 숨김
                page.style.display = 'block'; // 선택된 페이지 표시
            });
        }
    });

    // --- Checkbox 전체 선택 ---
    const selectAllCheckbox = document.getElementById("select-all");
    const itemCheckboxes = document.querySelectorAll(".item-checkbox");
    const selectedCountText = document.getElementById("selected-count");

    function updateSelectedCount() {
        const selectedCount = Array.from(itemCheckboxes).filter(cb => cb.checked).length;
        selectedCountText.textContent = `${selectedCount} selected`;
    }

    if (selectAllCheckbox && itemCheckboxes.length && selectedCountText) {
        selectAllCheckbox.addEventListener("change", () => {
            const isChecked = selectAllCheckbox.checked;
            itemCheckboxes.forEach(checkbox => checkbox.checked = isChecked);
            updateSelectedCount();
        });

        itemCheckboxes.forEach(checkbox => {
            checkbox.addEventListener("change", () => {
                updateSelectedCount();
                selectAllCheckbox.checked = Array.from(itemCheckboxes).every(cb => cb.checked);
            });
        });
    }

    // --- 크레딧 구매 기능 ---
    const amountField = document.getElementById('credit-amount');
    const popup = document.getElementById('popup');
    const showPopupBtn = document.getElementById('show-popup');

    if (amountField && popup) {
        function showPopup() {
            popup.style.display = 'flex';
        }

        function addDigit(digit) {
            let currentAmount = amountField.value.replace('€', '').replace(',', '');
            if (currentAmount === "0.00") currentAmount = "";
            currentAmount += digit;
            amountField.value = parseFloat(currentAmount).toFixed(2);
        }

        function clearAmount() {
            amountField.value = "0.00";
        }

        function useCredit() {
            alert(`Using credit: €${amountField.value}`);
            popup.style.display = 'none';
        }

        if (showPopupBtn) {
            showPopupBtn.addEventListener('click', showPopup);
        }
    }

    // --- 테마 변경 ---
    const themeIcon = document.getElementById('theme-icon');
    if (themeIcon) {
        themeIcon.addEventListener('click', () => {
            document.body.classList.toggle('dark');
            themeIcon.textContent = document.body.classList.contains('dark') ? '🌙' : '☀️';
        });
    }
});



