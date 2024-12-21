<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css_main.css" />
<link rel="stylesheet" href="./resources/Main_test.css" />
<link rel="stylesheet" href="./resources/modal.css" />
<title>Welcome to Data.At !!!</title>
<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <div class = "all">
    
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
			  	  	<div id = "list-btn" style="background-color: white;">
				        <button class="menu-toggle">&#9776;</button>
				    </div>
		    	</div>		    	
		    </nav>
    
      <!-- div태그 all 끝 --> 
    </div>
   	     
 <div class="container">    
    <!-- 좌측 토글 시작 -->
    <aside class="sidebar">
    	<div class="sidebar-container">       
       		<button class="new-dataset-btn" id="new-dataset-btn">+ New Dataset</button>
      	</div>
      <ul>
        <li><a href="./MainPage">Home</a></li>
		<li><a href="./TutorialPage">How to Use</a></li>
		<li><a href="#">Search</a></li>
		<li><a href="#">More</a></li>
      </ul>
    </aside>  
</div>
<!-- 좌측 토글 끝 -->

<!-- 여기에 업로드 게시판 작성 페이지 만들겟습니다. -->



	<script src="./resources/js_main.js"></script>
</body>
</html>