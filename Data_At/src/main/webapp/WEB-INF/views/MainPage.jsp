<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/css_main.css" />
<link rel="stylesheet" href="./resources/Main_test.css" />
<link rel="stylesheet" href="./resources/modal.css" />
<title>Welcome to Data.At !!!</title>
<!-- Font Awesome CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
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

				<div class="right-div">
					<a href="" id="uploaded-btn"> Uploaded </a>
				</div>
				<div class="right-div">
					<a href="" id="downloaded-btn"> Downloaded </a>
				</div>
				<div class="right-div">
					<a href="" id="credits-btn"> Credit </a>
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

		<header>

			<!-- 배경화면 -->
			<div class="background-box">
				<div id="div1" class="page-header min-vh-75"
					style="background-image: url('./resources/images/background/bg_01.jpg')">
					<div class="container">
						<div style="color: white;">
							<h1>Data.At</h1>
							<p>AI Model을 활용한 데이터 자동 분류 서비스</p>
						</div>
					</div>
				</div>

				<div id="div2" class="page-header min-vh-75"
					style="background-image: url('./resources/images/background/img_christmas02.jpg')">
					<div class="container">
						<div style="color: white;">
							<h1>Data.At</h1>
							<p>AI Model을 활용한 데이터 자동 분류 서비스</p>
						</div>
					</div>
				</div>

				<div id="div3" class="page-header min-vh-75"
					style="background-image: url('./resources/images/background/bgpicture2.jpg')">
					<div class="container">
						<div style="color: white;">
							<h1>Data.At</h1>
							<p>AI Model을 활용한 데이터 자동 분류 서비스</p>
						</div>
					</div>
				</div>
			</div>



		</header>



		<div class="container">

			<!-- 좌측 토글 시작 -->
			<aside class="sidebar">
				<div class="sidebar-container">
					<button class="new-dataset-btn" id="new-dataset-btn">+ New
						Dataset</button>
				</div>
				<ul>
					<li><a href="./MainPage">Home</a></li>
					<li><a href="#">How to Use</a></li>
					<li><a href="#">Search</a></li>
					<li><a href="#">Datasets</a></li>
					<li><a href="#">QnA</a></li>
					<li><a href="#">Contact</a></li>
					<li><a href="#">More</a></li>
				</ul>
			</aside>

			<div class="main-content2">


				<div class="features-section">
					<h2>FEATURES</h2>
					<div class="features-container">
						<!-- Fully Responsive -->
						<div class="feature">
							<div class="icon-container">
								<img src="./resources/images/mainpage/classify.png"
									alt="Responsive Icon" class="feature-icon">
							</div>
							<h3>자동 데이터 분류</h3>
							<p>일일히 확인하기 힘든 많은 데이터들을 인공지능 모델을 이용하여 한번에 처리하세요.</p>
						</div>
						<!-- Customizable -->
						<div class="feature">
							<div class="icon-container">
								<img src="./resources/images/mainpage/search.png"
									alt="Customizable Icon" class="feature-icon">
							</div>
							<h3>데이터 공유</h3>
							<p>필요한 데이터가 있는지 확인해보세요. Data.At은 여러분이 필요로 하는 데이터를 제공합니다.</p>
						</div>
						<!-- Slick and Beautiful Design -->
						<div class="feature">
							<div class="icon-container">
								<img src="./resources/images/mainpage/analysis.png"
									alt="Design Icon" class="feature-icon">
							</div>
							<h3>데이터 분석</h3>
							<p>데이터를 업로드 해보세요. Data.At에서 분석 결과를 알려드립니다.</p>
						</div>
					</div>
				</div>

				<div class="features-section2">
					<div class="features-container2">
						<div class="flex-1">
							<img src="./resources/images/mainpage/photos02.jpg"
								alt="photos.png" class="photos">
						</div>

						<div class="flex-1 montserrat">
							<h3>SIMPLE DATA CLASSIFICATION</h3>
							<p>Our data sharing service is an innovative platform that
								leverages AI models to automatically classify and organize
								images. Anyone can easily upload images and quickly view the
								classification results, maximizing the efficiency of data
								management. With a simple interface and intuitive user
								experience, it offers a convenient solution that anyone can use
								effortlessly without needing complex technical knowledge.</p>
						</div>
					</div>
				</div>

				<div class="features-section3">
					<div class="features-container2">

						<div class="flex-1 montserrat">
							<h3>VIZUALIZED DATA ANALYSIS</h3>
							<p>Our data visualization service analyzes the data provided
								by users and presents the results through intuitive graphs and
								tables. By simply uploading data, the complex analysis process
								is automated, and clear visual materials are generated to
								display the results. This service makes it easy to understand
								data and derive insights, effectively supporting data-driven
								decision-making. It is user-friendly and can be applied across
								various fields, including business and academics.</p>
						</div>

						<div class="flex-1">
							<img src="./resources/images/mainpage/working01.jpg"
								alt="photos.png" class="photos">
						</div>

					</div>
				</div>

				<div>
					<section class="pricing-section Helvetica">
						<div class="text-center">
							<h1 class="pricing-title">CHOOSE YOUR CREDITS</h1>
							<p class="pricing-subtitle">Pick any of our super affordable
								pricing units</p>
						</div>
						<div class="pricing-container">
							<div class="pricing-card">
								<h2 class="plan-title">BASIC</h2>
								<p class="plan-price">$10</p>
								<p class="plan-duration"></p>
								<ul class="plan-features">
									<li>✔ 200 Credit Points</li>
								</ul>
								<div>
									<button class="payment-btn" id="pay-010">Get Started</button>
								</div>
							</div>

							<div class="pricing-card">
								<h2 class="plan-title">AGENCY</h2>
								<p class="plan-price">$25</p>
								<p class="plan-duration"></p>
								<ul class="plan-features">
									<li>✔ 500 Credit Points</li>
								</ul>
								<div>
									<button class="payment-btn" id="pay-025">Get Started</button>
								</div>
							</div>

							<div class="pricing-card">
								<h2 class="plan-title">PRO</h2>
								<p class="plan-price">$50</p>
								<p class="plan-duration"></p>
								<ul class="plan-features">
									<li>✔ 1000 Credit Points</li>
								</ul>
								<div>
									<button class="payment-btn" id="pay-050">Get Started</button>
								</div>
							</div>
						</div>
					</section>
				</div>

				<!-- div태그 all 끝 -->
			</div>




			<footer class="footer">
				<p>&copy; 2024 DataPlatform. All rights reserved.</p>
			</footer>

			<!-- 데이터업로드페이지  -->
			<div class="new-dataset-panel hidden" id="newDatasetPanel">
				<div class="panel-header">
					<h2>Upload Data</h2>
					<button class="close-panel" id="closePanelBtn">X</button>
				</div>
				<div class="panel-container">
					<div class="panel-content">
						<p>Drag & drop files to upload</p>
						<div id="fileInfo"></div>
						<button class="upload-btn" id="uploadcontentbtn">Upload
							Content</button>
					</div>
				</div>
			</div>

			<!-- 적용 -->
			<div class="new-dataset-panel hidden" id="newDatasetPanel2">
				<form action="upload" method="post">
					<!-- 데이터 업로드 작성 div -->
					<div class="panel-header">
						<h2>Upload Data</h2>
						<span class="close-btn" id="remove-uploadpanel2">&times;</span>
					</div>
					<div class="upload-container " id="uploadBoardPanel">
						<!-- Dataset Title -->
						<div class="form-group">
							<label for="dataset-title">DATASET TITLE</label> <input
								type="text" id="dataset-title" placeholder="Enter dataset title"
								name="img_title">
						</div>

						<!-- 클래스 태그 입력하기 -->
						<div class="tag-container">
							<h3>태그</h3>
							<div id="tags">
								<!-- 동적으로 태그가 추가될 영역 -->
							</div>
							<input type="hidden" name="class"> <input type="text"
								id="tag-input" placeholder="태그를 입력하고 Enter를 누르세요.">
						</div>

						<!-- Dataset Content -->
						<div class="form-group">
							<label for="dataset-content">DATASET CONTENT</label>
							<!-- <input type="text" id="dataset-content" placeholder="Enter dataset content"> -->
							<textarea id="dataset-content" name="img_content"></textarea>
						</div>

						<!-- Uploaded Files -->
						<div class="form-group">
							<label>FILES</label>
							<div class="file-list">
								<div class="file-item">
									<p>
										<span id="zip-name"> </span> <span id="zip-size"> </span>
									</p>
									<input type="file" name="imgfile" id="hiddenFile"
										style="visibility: hidden;">
									<!--  <span >&times;</span> -->
								</div>
							</div>

						</div>


						<!-- Bottom Buttons -->
						<div class="footer">
							<button id="reset-btn01">Reset</button>
							<button class="create-btn" disabled>Create</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<!-- 좌측 토글 끝 -->


		<!-- 모달창 -->
		<div id="loginModal" class="modal">
			<div class="modal-content">

				<span id="closeModalBtn"
					style="position: absolute; top: 10px; right: 15px; cursor: pointer; display: none;">&times;</span>

				<div class="login-box">
					<div class="lb-header">
						<a href="#" id="login-box-link" class="active">Login</a> <a
							href="#" id="signup-box-link">Sign Up</a>
					</div>

					<div class="social-login">
						<div>
							<a
								href="https://kauth.kakao.com/oauth/authorize
?client_id=8f21cd3c7c3ae244e43320706c6db2dd
&redirect_uri=http://localhost:8085/data_at/oauth/kakao/callback
&response_type=code">
								<img alt="kakaotalk" src="./resources/images/icon_kakaotalk.png">
								Log in with Kakaotalk
							</a>
						</div>
						<div>
							<a
								href="https://accounts.google.com/o/oauth2/auth?client_id=1021205739741-1gso2uuh3rpq9dqqmpg7argssuhocori.apps.googleusercontent.com&redirect_uri=http://localhost:8085/data_at/oauth/google/callback&response_type=code&scope=profile%20email">
								<img alt="google" src="./resources/images/icon_google.png">
								Log in with Google
							</a>
						</div>

					</div>

				</div>

				<form action="userlogin" method="post" class="email-login">
					<div class="u-form-group">
						<input type="email" placeholder="Email" name="user_id" />
					</div>
					<div class="u-form-group">
						<input type="password" placeholder="Password" name="user_pw" />
					</div>
					<div class="u-form-group">
						<button type="submit">Log in</button>
					</div>
					<div class="u-form-group">
						<a href="#" class="forgot-password">Forgot password?</a>
					</div>
				</form>

				<form action="userjoin" method="post" class="email-signup">
					<div class="u-form-group">
						<input type="email" placeholder="Email" name="user_id" />
					</div>
					<div class="u-form-group">
						<input type="password" placeholder="Password" name="user_pw" />
					</div>
					<div class="u-form-group">
						<input type="password" placeholder="Confirm Password"
							name="user_pw_check" />
					</div>
					<div class="u-form-group">
						<input type="text" placeholder="NickName" name="user_nick" />
					</div>
					<div class="u-form-group">
						<button type="submit">Sign Up</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- all 태그 끝! -->
	</div>

	<script src="./resources/js_main.js"></script>
	<script src="./resources/modal.js"></script>
	<script src="./resources/upload_board.js"></script>
	<script src="./resources/Payment.js"></script>
	<script src="./resources/payment_mainPage.js"></script>
	<script>		
	// Mainpage 아래에서 구매버튼 누르면 해당 값을 가지고 paymentpage로 이동
	// jsp 안에서 script하면 잘되더라.. 그런데 왜 외부 js로 옮기면 안되는걸까.

	  	const pay010 = document.getElementById('pay-010');
		const pay025 = document.getElementById('pay-025');
	  	const pay050 = document.getElementById('pay-050');
	  	
	  	pay010.addEventListener("click",()=>{
			console.log('pay010 clicked');
			localStorage.setItem("payment", "10");		
			console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
			window.location.href = "http://192.168.219.176:8081/data_at/PaymentPage";
	  	 });
	  	 
	  	 pay025.addEventListener("click",()=>{
			console.log('pay025 clicked');
			localStorage.setItem("payment", "25");		
			console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
			window.location.href = "http://192.168.219.176:8081/data_at/PaymentPage";
	  	 });
	  	 
	  	 pay050.addEventListener("click",()=>{
			console.log('pay050 clicked');
			localStorage.setItem("payment", "50");		
			console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
			window.location.href = "http://192.168.219.176:8081/data_at/PaymentPage";
	  	 });
	  	 
	</script>
</body>
</html>