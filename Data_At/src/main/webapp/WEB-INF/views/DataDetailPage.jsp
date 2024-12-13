<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css_main.css?v=1.0" />
<link rel="stylesheet" href="./resources/Main_test.css?v=1.0" />
<link rel="stylesheet" href="./resources/chart.css?v=1.0" />
<link rel="stylesheet" href="./resources/printJsonImages.css?v=1.0" />
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
	    	<div class="left-div" >	      		
	      		<a> Data.At </a>
	    	</div>
	    	<div class="right-container" >    		
	    		<div class="right-div">pages</div>
	    		<div class="right-div">section</div>
	    		<div class="right-div">mypage</div>
	    		<!-- 좌측 토글 버튼 -->
		  	  	<div style="background-color: white;">
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
		        	<button class="upload-btn">Browse Files</button>
		      	</div>
		    </div>
	    </div>
	    
	    <div class="list-box">
			<div class="border-bottom">
				<h1>Dataset Name 여기에 적기</h1>
			</div>
			<div class="data-content">
				<div>
					<h2>About Dataset</h2>
				</div>
				<div style="white-space: pre-line;" >					
					여기에
					줄바꿈과 공백을 포함한
					db에서 불러온
					db 컨텐츠를 불러오면 
					됩니다. ^^
					
				</div>
			</div>
			
			<div class="data-show">
				<div>				
					<h2>Data show</h2>
				</div>
				<div id="drop-zone">Drag and drop a JSON file here</div>
				<div class="flex-box">
					<!-- 페이지에 이미지 출력하기 from json -->
	 				<div id="file-system"></div>											
					
					<!-- 우측에 파일 목록 띄우기 -->
					<div id="file-list"></div> 	 	       			       				    
		    
		    	</div>
    	<!-- 파일시스템 uiux 끝 -->
    
    	<!--  그래프그리기 시작 -->
			<div class="data-visualization">
				<div>
					<h2>Data visualization</h2>
				</div>
				<div>
					<canvas id="myChart1"></canvas>
					
					<canvas id="myChart2"></canvas>
					
					<canvas id="myChart3"></canvas>
				</div>
			</div>
			
		    
	    </div>
    <!-- div(class="all") 태그 끝 -->
    </div>
    </div>
   
<script src="./resources/js_main.js"></script>
<script src="./resources/chart.js"></script>
<script src="./resources/printJsonImages.js"></script>
</body>
</html>