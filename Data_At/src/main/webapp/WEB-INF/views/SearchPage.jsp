<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./resources/search.css" />
<!-- Font Awesome CSS -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
   <div class="search_div">
      <div class="section03 width4">
         <i class="fa-solid fa-arrow-left" onclick="location.href='MainPage'"></i>
      </div>
      <div class="section02">
         <div class="wrap">
            <div class="search search-container">
               <input type="text" class="searchTerm" id="search-input"
                  placeholder="Search...">
               <div id="suggestions" class="suggestions-box"></div>
            </div>
         </div>
      </div>
      <div class="section03">
         <i class="fa-solid fa-magnifying-glass" onclick="searchData()"></i>
      </div>
      <div class="section03">
         <i class="fa-solid fa-xmark" onclick="location.href='MainPage'"></i>
      </div>
   </div>

   <main id="su">
   
   </main>

   <script>
    function searchData() {
        // 검색어 값을 가져오기
        const searchTerm = document.getElementById("search-input").value;

        // URL에 검색어 추가하여 이동
        if (searchTerm) {
            location.href = '/data_at/dataSearch?search=' + encodeURIComponent(searchTerm);
        } else {
            alert("검색어를 입력해주세요."); // 검색어가 없을 때의 처리
        }
    }

    $(document).ready(function () {
        const searchInput = $('#search-input');
        const suggestionsBox = $('#su');

        // 입력 이벤트 감지
        searchInput.on('keyup', function () {
            const query = $(this).val().trim();

            // 입력값이 없으면 숨김
            if (query === '') {
                suggestionsBox.hide();
                return;
            }

            // AJAX 요청으로 유사 검색어 가져오기
            $.ajax({
                url: 'suggestions', // 서버의 API 엔드포인트
                type: 'GET',
                data: { query: query },
                success: function (response) {
                    // 기존 내용을 비우고 새로운 내용을 추가
                    suggestionsBox.empty();

                    if (response && response.length > 0) {
                        response.forEach(item => {
                            console.log("Item:", item); // 각 항목 확인
                            $('#su').append(`
                                <section class="settings-section">
                                    <div class="container-test">
                                        <div class="section1">
                                            <div class="item">
                                                <i class="fa-solid fa-magnifying-glass"></i>
                                            </div>
                                        </div>
                                        <div class="section2">
                                            <span class="details suggestion-item">` + item + `</span>
                                        </div>
                                    </div>
                                </section>
                            `);
                        });
                        suggestionsBox.show();
                    } else {
                        suggestionsBox.hide();
                    }
                },
                error: function () {
                    console.error('유사 검색어 요청 실패');
                }
            });
        });

        // 제안된 항목 클릭 이벤트
        suggestionsBox.on('click', '.suggestion-item', function () {
            const selectedText = $(this).text();
            searchInput.val(selectedText); // 선택한 검색어로 채우기
            suggestionsBox.hide();
        });
    });
    </script>
</body>
</html>