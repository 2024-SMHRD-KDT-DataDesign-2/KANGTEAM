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
<link rel="stylesheet" href="./resources/tutorial.css" />
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


				<!-- 좌측 토글 버튼 -->
				<div id="list-btn" style="background-color: white;">
					<button class="menu-toggle">&#9776;</button>
				</div>
			</div>
		</nav>


		<div class="container">
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
		</div>
		<!-- 좌측 토글 끝 -->

		<!-- 데이터업로드페이지  -->
		<div class="new-dataset-panel hidden" id="newDatasetPanel">
			<div class="panel-header">
				<h2>Upload Data</h2>
				<button class="close-panel" id="closePanelBtn">X</button>
			</div>
			<div class="panel-container">
				<div class="panel-content">
					<p>Drag & drop files to upload</p>
					<button class="upload-btn" id="uploadcontentbtn">Upload
						Content</button>
				</div>
			</div>
		</div>

		<!-- 적용 -->
		<div class="new-dataset-panel hidden" id="newDatasetPanel2">
			<!-- 데이터 업로드 작성 div -->
			<div class="panel-header">
				<h2>Upload Data</h2>
				<span class="close-btn" id="remove-uploadpanel2">&times;</span>
			</div>
			<div class="upload-container " id="uploadBoardPanel">
				<!-- Dataset Title -->
				<div class="form-group">
					<label for="dataset-title">DATASET TITLE</label> <input type="text"
						id="dataset-title" placeholder="Enter dataset title">
				</div>

				<!-- 클래스 태그 입력하기 -->
				<div class="tag-container">
					<h3>태그</h3>
					<div id="tags">
						<!-- 동적으로 태그가 추가될 영역 -->
					</div>
					<input type="text" id="tag-input"
						placeholder="태그를 입력하고 Enter를 누르세요.">
				</div>

				<!-- Dataset Content -->
				<div class="form-group">
					<label for="dataset-content">DATASET CONTENT</label>
					<!-- <input type="text" id="dataset-content" placeholder="Enter dataset content"> -->
					<textarea id="dataset-content"></textarea>
				</div>

				<!-- Uploaded Files -->
				<div class="form-group">
					<label>FILES</label>
					<div class="file-list">
						<div class="file-item">
							<span>📄 Animals.zip (1.93 MB)</span>
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

		</div>

		<!-- ㅌ튜ㅗ리얼 본문 다. -->
		<div class="list-box">
			<div class="tutorial-header">
				<p>December 18, 2024</p>
				<h1>Data.At 서비스 설명서 : 종합 안내서</h1>
			</div>
			<div class="tutorial-container ">
				<div class="tutorial-content">
					<h2>소개</h2>
					<p>Data.At은 인공지능 기술을 활용하여 이미지 데이터를 자동으로 분류하는 혁신적인 서비스입니다. 이
						서비스를 통해 사용자는 기존의 수동적이고 비효율적인 이미지 데이터 관리 방식에서 벗어나, 첨단 기술을 활용한 효율적인
						데이터 분류를 경험할 수 있습니다. Data.At은 BLIP 및 CLIP과 같은 최신 인공지능 모델을 기반으로
						설계되었으며, 이를 통해 사용자는 데이터 분석과 관리에서 발생하는 복잡성을 줄이고 더 나은 생산성을 달성할 수
						있습니다. 이 서비스는 대량의 이미지 데이터를 빠르게 처리하며, 사용자의 요구에 따라 다양한 기준으로 데이터를 분류할
						수 있어 다양한 산업 분야에서 활용될 수 있습니다.</p>
					<p>&ZeroWidthSpace;</p>
					<p>Data.At은 단순한 분류 도구를 넘어선 종합적인 데이터 관리 솔루션으로 설계되었습니다. 이를 통해
						사용자는 데이터의 구조화를 손쉽게 수행할 수 있으며, 고도로 정제된 데이터를 기반으로 더 나은 의사결정을 내릴 수
						있습니다. 특히, 사용자가 데이터를 업로드하면 시스템은 자동으로 분석하고, 적합한 태그와 카테고리를 부여하여 데이터를
						체계적으로 정리합니다. 결과적으로 Data.At은 사용자의 데이터 관리 시간을 획기적으로 절감하고, 정확성과 효율성을
						극대화합니다.</p>
				</div>
				<div class="tutorial-content">
					<h2>Data.At은 누구를 위한 것인가요</h2>
					<p>Data.At은 이미지 데이터의 체계적인 관리를 필요로 하는 모든 사용자에게 적합한 서비스입니다. 특히
						대규모의 이미지 데이터를 보유하고 있는 기업이나 개인에게 유용하며, 데이터 관리에 많은 시간과 노력을 들여야 하는
						사용자들에게 최적의 솔루션을 제공합니다. 디자이너, 연구자, 마케터, 콘텐츠 제작자 등 다양한 분야에서 Data.At은
						데이터를 보다 쉽게 정리하고 분석할 수 있도록 도와줍니다. 이를 통해 사용자들은 반복적이고 단순한 작업에서 벗어나 보다
						창의적인 업무에 집중할 수 있습니다.</p>
					<p>&ZeroWidthSpace;</p>
					<p>예를 들어, 전자상거래 업계에서는 수천 장의 상품 이미지를 자동으로 분류하여 고객에게 최적의 검색 결과를
						제공하는 데 사용할 수 있습니다. 또한, 학계나 연구소에서는 이미지 데이터셋의 정리와 분석을 통해 실험 결과를 더
						효과적으로 도출할 수 있습니다. Data.At은 이러한 다양한 사용자층을 고려하여 사용자 친화적인 인터페이스와 강력한
						기능을 제공하며, 이미지 데이터 관리에서 새로운 가능성을 열어줍니다. Data.At은 초보자부터 전문가까지 누구나
						손쉽게 사용할 수 있도록 설계되었습니다.</p>
				</div>
				<div class="tutorial-content">
					<h2>주요 기능</h2>
					<p>Data.At의 주요 기능 중 하나는 최신 인공지능 모델을 활용하여 이미지 데이터를 자동으로 분류하는
						것입니다. BLIP 및 CLIP 모델은 이미지의 내용을 이해하고 분석하여 적합한 태그를 생성하고, 사용자가 데이터를
						보다 효율적으로 정리할 수 있도록 지원합니다. 이러한 기술은 단순한 키워드 검색을 넘어, 이미지의 맥락을 파악하여 더욱
						정교한 분류 결과를 제공합니다. 이를 통해 사용자는 데이터를 손쉽게 검색하고 활용할 수 있습니다.</p>
					<p>&ZeroWidthSpace;</p>
					<p>또한, Data.At은 사용자 정의 분류 기준을 제공하여 각 사용자가 고유한 요구 사항에 맞게 데이터를
						관리할 수 있도록 합니다. 예를 들어, 특정 프로젝트나 작업에 따라 데이터를 그룹화하거나, 특정 속성을 기반으로
						데이터를 필터링할 수 있습니다. 이외에도, 업로드된 데이터를 시각적으로 분석할 수 있는 대시보드를 제공하며, 이를 통해
						데이터의 분포와 패턴을 한눈에 확인할 수 있습니다. Data.At은 데이터 관리의 모든 측면을 포괄하는 강력한 도구로,
						사용자가 데이터의 가치를 최대한 활용할 수 있도록 지원합니다.</p>
				</div>
				<div class="tutorial-content">
					<h2>최고의 사용 사례</h2>
					<p>Data.At은 다양한 산업과 분야에서 유용하게 활용될 수 있는 서비스입니다. 예를 들어, 전자상거래
						업계에서는 수천 장의 상품 이미지를 빠르게 분류하여 고객의 검색 경험을 향상시키는 데 사용할 수 있습니다. 이를 통해
						고객은 원하는 제품을 더 빠르게 찾을 수 있으며, 기업은 판매율을 높일 수 있습니다. 이 외에도, 사진 스튜디오나
						콘텐츠 제작자는 촬영된 이미지를 주제별로 정리하고, 프로젝트 관리에 필요한 데이터를 효율적으로 관리할 수 있습니다.</p>
					<p>&ZeroWidthSpace;</p>
					<p>연구 분야에서도 Data.At은 큰 가치를 제공합니다. 예를 들어, 과학 연구나 의료 연구에서는 수천 장의
						실험 이미지를 빠르게 정리하고 분석하여 연구 결과의 정확성을 높일 수 있습니다. 또한, 미디어 및 광고 업계에서는
						대량의 시각 자료를 빠르게 필터링하고 적절한 카테고리로 분류하여 캠페인의 효율성을 극대화할 수 있습니다.
						Data.At은 각 산업에 적합한 맞춤형 기능을 제공하며, 다양한 사용 사례에서 높은 생산성을 보장합니다.</p>
				</div>
				<div class="tutorial-content">
					<h2>시작하기</h2>
					<p>Data.At을 사용하기 위해서는 먼저 간단한 가입 절차를 통해 계정을 생성해야 합니다. 계정을 생성한 후,
						사용자는 자신의 이미지 데이터를 업로드하여 시스템이 데이터를 분석하고 분류하도록 할 수 있습니다. 업로드 과정은 매우
						직관적이며, 사용자가 여러 파일을 한 번에 업로드할 수 있는 대량 업로드 기능도 지원합니다. 데이터가 업로드되면,
						Data.At은 자동으로 이미지를 분석하고 적절한 태그를 생성하여 데이터를 체계적으로 정리합니다.</p>
					<p>&ZeroWidthSpace;</p>
					<p>초기 설정이 완료되면, 사용자는 다양한 분류 기준을 선택하여 데이터를 원하는 대로 관리할 수 있습니다. 예를
						들어, 특정 프로젝트와 관련된 이미지를 필터링하거나, 태그를 기반으로 데이터를 그룹화할 수 있습니다. Data.At은
						사용자에게 데이터를 시각적으로 확인할 수 있는 대시보드도 제공하며, 이를 통해 데이터를 효율적으로 탐색하고 관리할 수
						있습니다. 이 모든 과정은 초보자도 쉽게 따라할 수 있도록 설계되었습니다.</p>
				</div>
				<div class="tutorial-content">
					<h2>결론</h2>
					<p>Data.At은 효율적이고 직관적인 이미지 데이터 분류를 제공하여 사용자의 생산성과 데이터 관리 효율성을
						극대화합니다. 최신 인공지능 모델을 활용하여 데이터를 자동으로 정리하고, 사용자가 더 중요한 작업에 집중할 수 있도록
						돕습니다. 이러한 기능은 단순히 데이터를 정리하는 것을 넘어, 데이터의 가치를 극대화하여 더 나은 의사결정을 내릴 수
						있는 기반을 제공합니다.</p>
					<p>&ZeroWidthSpace;</p>
					<p>Data.At은 이미지 데이터 관리의 복잡성을 줄이고, 데이터를 보다 체계적으로 정리할 수 있는 도구를
						제공합니다. 사용자는 이를 통해 데이터 관리 시간을 절약하고, 더욱 효율적인 업무 환경을 조성할 수 있습니다. 지금
						바로 Data.At을 사용하여 데이터 관리의 새로운 표준을 경험해 보세요. 이 서비스는 개인 사용자뿐만 아니라 기업
						사용자에게도 최적의 솔루션을 제공하며, 미래의 데이터 관리 방식을 선도할 것입니다.</p>
				</div>
			</div>
		</div>


		<!-- div태그 all 끝 -->
	</div>


	<script src="./resources/js_main.js"></script>
	<script src="./resources/modal.js"></script>
	<script src="./resources/upload_board.js"></script>
</body>
</html>