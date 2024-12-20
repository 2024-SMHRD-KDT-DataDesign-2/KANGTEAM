<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body style="background-color: rgb(255, 255, 255);">

	<div class="all">
	
		<!-- 상단 nav 바 -->
		    <nav class="nav-01 margin-all" >
		    	<div id = "logo-image">	
		    		<a href="MainPage">  <!-- 이미지 링크 잘됨 ㅇㅇ -->    		
	      				<img alt="./resources/images/imgTest1.png" src="./resources/images/logo04-02.png">
	    			</a>
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
	    
	    <!-- 데이터 결과 숫자, 필터 -->
	    <div class="search-result">
	        <div class="container-spacebetween">
	            <p> 21 results </p>
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
		    <div class="data-container ">
		    	<div class="datablock container-origin ">
			    	<div class="thumbnail left">
			    		<img  alt="" src="data:image/jpeg;base64,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">
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a id="data_title01" class="title" >fruit images</a>
			    	    </div>
			    	    <div>
				            <p>uploaded in 24-12-16 by <span class="underline">Yoonho</span> </p>
				        </div>
					</div>
					<div class="data-info">
						<span>apple</span> <span>banana</span> <span>melon</span> <span>pear</span> <span>dragonfruit</span> <span>grape</span> <span>orange</span> <span>peach</span>
					</div>
		    	</div>
		    </div>
		    
		    <div class="data-container ">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">			   
			    		<img  alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShcznboX-8RvzikdZJPQB_oy5owFnYR66AqA&s">
		    
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">fruit color mix</a>
			    	    </div>
			    	    <div>
				            <p>uploaded in 24-12-15 by <span class="underline">Unkyung</span> </p>
				        </div>
					</div>
					<div class="data-info">
						<span>red</span> <span>green</span>  <span>white</span> <span>pink</span>
					</div>
		    	</div>
		    </div>
		    
		     <div class="data-container ">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">			   
			    		<img  alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3LQxPrWagCMHfKIJeIft7XoMyrT12uXRO7A&s">
		    
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">apple container and mixtures </a>
			    	    </div>
			    	    <div>
				            <p>uploaded in 24-12-13 by <span class="underline">Chickenlove</span> </p>
				        </div>
					</div>
					<div class="data-info">
						<span>juice</span> <span>sauce</span>  <span>jam</span> <span>water</span> <span>drink</span>
					</div>
		    	</div>
		    </div>
		    
		     <div class="data-container ">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">			   
			    		<img  alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcmHpTUuVAr0S8Fc5SZN3HRSD6U3A5GF3xoQ&s">
		    
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">fruits class segmentation</a>
			    	    </div>
			    	    <div>
				            <p>uploaded in 24-12-12 by <span class="underline">Spacehallway</span> </p>
				        </div>
					</div>
					<div class="data-info">
						<span>apple</span> <span>greenapple</span>  <span>whiteapple</span> <span>square</span> <span>circle</span>  <span>triangle</span>
					</div>
		    	</div>
		    </div>
		    
		     <div class="data-container ">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">			   
			    		<img  alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1l8cG6bN3BRE-ZVjeyrWGackEfRfJA15aWA&s">
		    
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">how to make visibility upgrade in apple agriculture</a>
			    	    </div>
			    	    <div>
				            <p>uploaded in 24-12-11 by <span class="underline">InsideEvening</span> </p>
				        </div>
					</div>
					<div class="data-info">
						<span>color</span> <span>size</span>  <span>mixed</span> <span>shape</span> 
					</div>
		    	</div>
		    </div>
		
		    <!-- 데이터 목록 출력 테스트 -->

		    
		     <!-- 데이터 목록 출력 끝-->
	    </div>
    <!-- div(class="all") 태그 끝 -->
    </div>
    
	   
<script src="./resources/js_main.js"></script>
<script src="./resources/pageLocation.js"></script>
<script src="./resources/upload_board.js"></script>

</body>
</html>