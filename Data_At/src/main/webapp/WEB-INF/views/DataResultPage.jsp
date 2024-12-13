<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css_main.css?v=1.0" />
<link rel="stylesheet" href="./resources/Main_test.css?v=1.0" />
<title>DataResult_Data.At</title>
<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		    <!-- 데이터 목록 출력 -->
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail2.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title2입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator2}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail2.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title2입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator2}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail2.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title2입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator2}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail2.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title2입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator2}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail2.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title2입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator2}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail3.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title3입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator3}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail3.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title3입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator3}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail3.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title3입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator3}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail3.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title3입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator3}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail3.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title3입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator3}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail3.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title3입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator3}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    
		    <div class="data-container bg-white">
		    	<div class="datablock container-origin ">
		    		<div class="thumbnail left">
		    			Thumbnail3.jpg
		    		</div>
		    		<div class="block-content right">
		    			<div>
			    	    	<a class="title">{data title3입니다.}</a>
			    	    </div>
			    	    <div>
				            <p>upload date: {date} by creator {creator3}</p>
				        </div>
					</div>
		    	</div>
		    </div>
		    
		    
		     <!-- 데이터 목록 출력 끝-->
	    </div>
    <!-- div(class="all") 태그 끝 -->
    </div>
   
<script src="./resources/js_main.js"></script>
</body>
</html>