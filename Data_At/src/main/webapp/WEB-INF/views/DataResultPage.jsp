<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css_main.css?v=1.0" />
<link rel="stylesheet" href="./resources/Main_test.css?v=1.0" />
<link rel="stylesheet" href="./resources/search.css" />
<title>DataResult_Data.At</title>
<!-- Font Awesome CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body style="background-color: rgb(255, 255, 255);">

	<div class="all">

		<!-- 상단 nav 바 -->
		<nav class="nav-01 margin-all">
			<div id="logo-image">
				<a href="MainPage"> <!-- 이미지 링크 잘됨 ㅇㅇ --> <img
					alt="./resources/images/imgTest1.png"
					src="./resources/images/logo04-02.png">
				</a>
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
				<li><a href="#">Search</a></li>
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

		<!-- 데이터 결과 숫자, 필터 -->
		<div class="search-result">
			<div class="container-spacebetween">
				<p>21 results</p>
				<div class="right-group">
					<div class="custom-select">
						<select>
							<option value="relevance">Relevance</option>
							<option value="date">Date</option>
							<option value="popularity">Popularity</option>
						</select>
					</div>
				</div>
			</div>
		</div>


		<div class="list-box">
			<!-- 데이터 목록 출력 -->
			<c:if test="${!empty searchList}">
				<c:forEach items="${searchList}" var="data">
					<div class="data-container ">
						<div class="datablock container-origin ">
							<div class="thumbnail left">
								<img alt="${data.img_title}" src="${data.img_url}" />
							</div>
							<div class="block-content right">
								<div>
									<a class="title" href="detailPage?img_idx=${data.img_idx}">${data.img_title}</a>
								</div>
								<div>
									<p>
										uploaded in ${data.created_at} by <span class="underline">${data.user_nick}</span>
									</p>
								</div>
							</div>
							<div id="data-info">
								<span>${data.data_class}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>


			<!-- 데이터 목록 출력 테스트 -->


			<!-- 데이터 목록 출력 끝-->
		</div>
		<!-- div(class="all") 태그 끝 -->
	</div>


	<script src="./resources/js_main.js"></script>
	<script src="./resources/pageLocation.js"></script>

</body>
</html>