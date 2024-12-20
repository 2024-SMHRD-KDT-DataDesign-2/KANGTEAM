<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
</head>
<body>

	<div class="all">
	
		 <!-- 상단 nav 바 -->
		    <nav class="nav-01 margin-all" >
		    	<div  class="left-div" >
		    		
		    		<div id = "logo-image">	
			    		<a href="MainPage">  <!-- 이미지 링크 잘됨 ㅇㅇ -->    		
		      				<img alt="./resources/images/imgTest1.png" src="./resources/images/logo04-02.png">
	    				</a>
	    		</div>
		    	</div>
		    	<div class="right-container" >
		    		<div class="right-div">
		    			<a href="SearchPage"> <i class="fa-solid fa-magnifying-glass"></i> </a>
		    		</div> 
		    	
		    		<div class="right-div">
		    			<a href="" id="uploaded-btn"> Uploaded </a>
		    		</div>
		    		<div class="right-div">
		    			<a href="" id="downloaded-btn"> Downloaded </a>
		    		</div>
		    		<div class="right-div">
		    			<a href="" id= "credits-btn"> Credit </a>
		    		</div>
		    		<div class="right-div">
		    			<a href="MyPage" id="settings-btn"> Mypage </a>
		    		</div>
		    		<!-- 좌측 토글 버튼 -->
			  	  	<div id = "list-btn" style="background-color: white;">
				        <button class="menu-toggle">&#9776;</button>
				    </div>
		    	</div>
		    	
		    </nav>
    
	    <!-- 좌측 토글 시작 -->
	    <aside class="sidebar">
	    	<div class="sidebar-container">       
	       		<button class="new-dataset-btn" id="new-dataset-btn">+ New Dataset</button>
	      	</div>
	      <ul>
	        <li><a href="./MainPage">Home</a></li>
	        <li><a href="#">Competitions</a></li>
	        <li><a href="#">Datasets</a></li>
	        <li><a href="#">Models</a></li>
	        <li><a href="#">Code</a></li>
	        <li><a href="#">Discussions</a></li>
	        <li><a href="#">Learn</a></li>
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
		        	<button class="upload-btn" id="uploadcontentbtn">Upload Content</button>
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
					<label for="dataset-title">DATASET TITLE</label> 
					<input type="text"	id="dataset-title" placeholder="Enter dataset title">
				</div>

				<!-- 클래스 태그 입력하기 -->
				<div class="tag-container">
					<h3>태그</h3>
					<div id="tags">
						<!-- 동적으로 태그가 추가될 영역 -->
					</div>
					<input type="text" id="tag-input"	placeholder="태그를 입력하고 Enter를 누르세요.">
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
	    
	    <div class="list-box">
			<div class="padding-10">
				<div class="border-btm">
					<h1>Image Classification Datasets</h1>
				</div>
			</div>
			
			<div class="data-content">
				<div class="flex-box">
					<h2>About Dataset</h2>
					<button class="new-dataset-btn" id="new-dataset-btn">Download</button>
				</div>
				<div style="white-space: pre-line;" >				
					<div id="data-info">                
                   		<li>
                   			<ul>Name : Fruit Datasets</ul>
                   			<ul>Contains :  <span>apple</span> <span>banana</span> <span>melon</span> <span>pear</span> <span>dragonfruit</span> <span>grape</span> <span>orange</span> <span>peach</span></ul>
                   			<ul>Uploader : Yoonho</ul>
                   			<ul>Uploaded Date : 2024-12-16</ul>                   			
                   		</li>
                   		<p>
                   		우리 서비스는 CLIP과 DINO AI 모델을 활용해 이미지를 분석하고, 단일 이미지 세트를 apple, melon, banana, pear, dragonfruit, grape, orange, peach의 8개 클래스로 정확히 분류하는 데 성공했습니다.

CLIP은 이미지와 텍스트 간의 연관성을 학습하여 각 이미지의 본질적인 특징을 파악하고, DINO는 이미지 내 객체를 세밀하게 식별하는 데 탁월한 성능을 발휘합니다. 

이를 통해 복잡한 이미지 데이터에서도 높은 정확도로 분류가 가능하며, 수작업의 필요성을 줄이고 데이터 처리 효율을 극대화합니다.

이번 분류 결과는 AI 기반 이미지 분류 기술의 정교함과 신뢰성을 입증하며, 다양한 데이터 관리와 분석에 강력한 도구로 활용될 수 있음을 보여줍니다.
                   		</p>
                   		
                   		
         			</div>				
				</div>
			</div>
			
			<div class="data-show">
				<div>				
					<h2>Data show</h2>
				</div>
				<div id="drop-zone">Drag and drop a JSON file here</div>
				
				<div class="flex-box">				
					<!-- 페이지에 이미지 출력하기 from json -->						 					
	 				<div id="file-system" class="scrollbar style-8">
	 					
	 				</div>			
					<!-- 우측에 파일 목록 띄우기 -->
					<div id="file-list" class="scrollbar style-8">
							 						     			       				    
		    		</div>			
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
					
					<canvas id="myChart3"></canvas>
				</div>
			</div>
			
		    
	    </div>
    <!-- div(class="all") 태그 끝 -->
    </div>
    </div>
   
<script src="./resources/js_main.js?v=1.0"></script>
<script src="./resources/chart.js?v=1.0"></script>
<script src="./resources/printJsonImages.js?v=1.0"></script>
<script src="./resources/upload_board.js"></script>
</body>
</html>