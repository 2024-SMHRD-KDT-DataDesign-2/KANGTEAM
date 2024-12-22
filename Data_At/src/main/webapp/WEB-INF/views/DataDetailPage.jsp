<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/Main_test.css?v=1.0" />
<link rel="stylesheet" href="./resources/chart.css?v=1.0" />
<link rel="stylesheet" href="./resources/printJsonImages.css?v=1.0" />
<link rel="stylesheet" href="./resources/css_main.css?v=1.0" />
<title>DataDetail_Data.At</title>
<!-- Font Awesome CSS -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
   rel="stylesheet">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
</head>
<body>

   <div class="all">

      <!-- 상단 nav 바 -->
      <nav class="nav-01 margin-all">
         <div class="left-div">

            <div id="logo-image">
               <a href="MainPage"> <!-- 이미지 링크 잘됨 ㅇㅇ --> <img
                  alt="./resources/images/imgTest1.png"
                  src="./resources/images/logo04-02.png">
               </a>
            </div>
         </div>
         <div class="right-container">
            <div class="right-div">
               <a href="SearchPage"> <i class="fa-solid fa-magnifying-glass"></i>
               </a>
            </div>


            <c:if test="${!empty info}">
               <div class="right-div">
                  <a href="MyPage" id="settings-btn"> Mypage </a>
               </div>
            </c:if>

            <c:if test="${empty info}">
               <div class="right-div">
                  <a href="#" id="openModalBtn"> Account </a>
               </div>
            </c:if>
            <!-- 좌측 토글 버튼 -->
            <div id="list-btn" style="background-color: white;">
               <button class="menu-toggle">&#9776;</button>
            </div>
         </div>

      </nav>

      <!-- 좌측 토글 시작 -->
      <aside class="sidebar">
         <div class="sidebar-container">
            <button class="new-dataset-btn" id="new-dataset-btn">+ New
               Dataset</button>
         </div>
         <ul>
            <li><a href="./MainPage">Home</a></li>
            <li><a href="./TutorialPage">How to Use</a></li>
            <li><a href="./SearchPage">Search</a></li>
            <li><a href="#">More</a></li>
         </ul>
      </aside>

      <!-- 데이터업로드페이지  -->
      <div class="new-dataset-panel hidden" id="newDatasetPanel">
         <div class="panel-header">
            <h2>Upload Data</h2>
            <button class="close-panel" id="closePanelBtn">X</button>
         </div>
         <div class="panel-container">
            <div class="panel-content">
               <p>Drag & drop files to upload</p>
               <button class="upload-btn">Browse Files</button>
            </div>
         </div>
      </div>

      <div class="list-box">
         <div class="padding-10">
            <div class="border-btm">
               <h1>Image Classification Datasets</h1>
            </div>
         </div>

         <div class="data-content">
            <div class="flex-box">
               <h2>About Dataset</h2>
               <button class="new-dataset-btn" id="new-dataset-btn"
                  onclick="downloadFile()">Download</button>
            </div>
            <div style="white-space: pre-line;">
               <div id="data-info">
                  <li>
                     <ul>Name : ${detail.img_title} Datasets
                     </ul>
                     <ul>
                        Contains : <c:forEach items="${classes}" var="c"><span>${c}</span></c:forEach>
                     </ul>
                     <ul>Uploader : ${detail.user_nick}
                     </ul>
                     <ul>Uploaded Date : ${detail.created_at}
                     </ul>
                  </li>
                  <input type="hidden" id="img_id" value="${detail.img_id}">
                  <p>${detail.img_content}</p>


               </div>
            </div>
         </div>

         <div class="data-show">
            <div>
               <h2>Data show</h2>
            </div>

            <div class="flex-box">
               <!-- 페이지에 이미지 출력하기 from json -->
               <div id="file-system" class="scrollbar style-8"></div>
               <!-- 우측에 파일 목록 띄우기 -->
               <div id="file-list" class="scrollbar style-8"
                  style="display: none;"></div>
            </div>
            <!-- 파일시스템 uiux 끝 -->

            <!--  그래프그리기 시작 -->
            <div class="data-visualization">
               <div>
                  <h2>Data visualization</h2>
               </div>
               <div class="content-center">
                  <canvas id="myChart1"></canvas>

                  <div class="chart-container">
                     <canvas id="myChart2"></canvas>
                  </div>

               </div>
            </div>


         </div>
         <!-- div(class="all") 태그 끝 -->
      </div>
   </div>

   <script src="./resources/js_main.js?v=1.0"></script>
   <script src="./resources/chart.js?v=1.0"></script>
   <script src="./resources/printJsonImages.js?v=1.0"></script>
   <script type="text/javascript">
   function downloadFile() {
       const img_id = $("#img_id").val();

       console.log("img_id:", img_id);

       $.ajax({
           url: "zipdownload",
           type: "POST",
           data: { "img_id": img_id },
           xhrFields: {
               responseType: 'blob' // 파일 데이터를 Blob 형태로 받기
           },
           success: function(response) {
               // Blob URL 생성
               const url = window.URL.createObjectURL(new Blob([response]));
               
               // <a> 태그를 동적으로 생성하여 다운로드 트리거
               const link = document.createElement('a');
               link.href = url;
               link.setAttribute('download', 'images.zip'); // 다운로드될 파일 이름
               document.body.appendChild(link);
               link.click();
               link.remove();

               console.log("File download triggered.");
           },
           error: function() {
               alert("파일 다운로드 실패");
           }
       });
   }
   </script>
</body>
</html>