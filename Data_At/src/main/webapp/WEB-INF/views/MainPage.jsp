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
		    		<div class="right-div">
		    			<a href="#" id="openModalBtn"> Account </a>
		    		</div>
		    				    		
			  	  	<!-- 좌측 토글 버튼 -->
			  	  	<div id = "list-btn" style="background-color: white;">
				        <button class="menu-toggle">&#9776;</button>
				    </div>
		    	</div>
		    	
		    </nav>
    
     <header>
    
				
   
				
    
     	</div>
     	<!-- 배경화면 -->
	     <div class="background-box">
	     	<div id="div1" class="page-header min-vh-75" style="background-image: url('./resources/images/background/bg_01.jpg')">
				<div class="container">
					<div style="color: white;">
						<h1>Data.At</h1>
						<p>AI Model을 활용한 데이터 자동 분류 서비스</p>
					</div>				
				</div>		    
	     	</div>
	     	
	     	<div id="div2" class="page-header min-vh-75" style="background-image: url('./resources/images/background/img_christmas02.jpg')">
				<div class="container">
					<div style="color: white;">
						<h1>Data.At</h1>
						<p>AI Model을 활용한 데이터 자동 분류 서비스</p>
					</div>				
				</div>		    
	     	</div>
	     	
	     	<div id="div3" class="page-header min-vh-75" style="background-image: url('./resources/images/background/bgpicture2.jpg')">
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
       		<button class="new-dataset-btn" id="new-dataset-btn">+ New Dataset</button>
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
		        <img src="./resources/images/mainpage/classify.png" alt="Responsive Icon" class="feature-icon">
		      </div>
		      <h3>자동 데이터 분류</h3>
		      <p>일일히 확인하기 힘든 많은 데이터들을 인공지능 모델을 이용하여 한번에 처리하세요.</p>
		    </div>
		    <!-- Customizable -->
		    <div class="feature">
		      <div class="icon-container">
		        <img src="./resources/images/mainpage/search.png" alt="Customizable Icon" class="feature-icon">
		      </div>
		      <h3>데이터 공유</h3>
		      <p>필요한 데이터가 있는지 확인해보세요. Data.At은 여러분이 필요로 하는 데이터를 제공합니다.</p>
		    </div>
		    <!-- Slick and Beautiful Design -->
		    <div class="feature">
		      <div class="icon-container">
		        <img src="./resources/images/mainpage/analysis.png" alt="Design Icon" class="feature-icon">
		      </div>
		      <h3>데이터 분석</h3>
		      <p>데이터나 업로드 해보세요. Data.At에서 분석 결과를 알려드립니다.</p>
		    </div>
		  </div>
		</div>
		
		<div class="features-section2">
		  <div class="features-container2">
		  	<div class="flex-1">
		       <img src="./resources/images/mainpage/photos02.jpg" alt="photos.png" class="photos">
		    </div>
		    
		    <div class="flex-1 montserrat">		     
		      <h3>SIMPLE DATA CLASSIFICATION</h3>
		      <p>Our data sharing service is an innovative platform that leverages AI models to automatically classify and organize images. Anyone can easily upload images and quickly view the classification results, maximizing the efficiency of data management. With a simple interface and intuitive user experience, it offers a convenient solution that anyone can use effortlessly without needing complex technical knowledge.</p>
		    </div>		    		    
		  </div>
		</div>
		
		<div class="features-section3">
		  <div class="features-container2">		  	
		    
		    <div class="flex-1 montserrat">		     
		      <h3>VIZUALIZED DATA ANALYSIS</h3>
		      <p>Our data visualization service analyzes the data provided by users and presents the results through intuitive graphs and tables. By simply uploading data, the complex analysis process is automated, and clear visual materials are generated to display the results. This service makes it easy to understand data and derive insights, effectively supporting data-driven decision-making. It is user-friendly and can be applied across various fields, including business and academics.</p>
		    </div>
		    
		    <div class="flex-1">
		       <img src="./resources/images/mainpage/working01.jpg" alt="photos.png" class="photos">
		    </div>	   
		    
		  </div>
		</div>
		
		<div>
		<section class="pricing-section Helvetica">
			<div class="text-center">
		        <h1 class="pricing-title">CHOOSE YOUR CREDITS</h1>
		        <p class="pricing-subtitle">Pick any of our super affordable pricing units</p>
			</div>
	        <div class="pricing-container">
	            <div class="pricing-card">
	                <h2 class="plan-title">BASIC</h2>
	                <p class="plan-price">$15</p>
	                <p class="plan-duration">per month</p>
	                <ul class="plan-features">
	                    <li>✔ Up to 7 Projects</li>
	                    <li>✔ 2 Additional Developers</li>
	                </ul>
	                <div>
	                	<a href="#" class="payment-btn">Get Started</a>
	                </div>
	            </div>
	
	            <div class="pricing-card featured">
	                <h2 class="plan-title">AGENCY</h2>
	                <p class="plan-price">$55</p>
	                <p class="plan-duration">per month</p>
	                <ul class="plan-features">
	                    <li>✔ Up to 25 Projects</li>
	                    <li>✔ 2 Additional Developers</li>
	                    <li>✔ Unlimited Support</li>
	                </ul>
	                 <div>
	                 	<a href="#" class="payment-btn">Get Started</a>
	                 </div>
	            </div>
	
	            <div class="pricing-card">
	                <h2 class="plan-title">PRO</h2>
	                <p class="plan-price">$75</p>
	                <p class="plan-duration">per month</p>
	                <ul class="plan-features">
	                    <li>✔ Up to 25 Projects</li>
	                    <li>✔ 2 Additional Developers</li>
	                    <li>✔ Unlimited Support</li>
	                    <li>✔ 1.5GB Disk Space</li>
	                </ul>
	                 <div>
	                 	<a href="#" class="payment-btn">Get Started</a>
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
        	<p>Drag and drop files to upload</p>
        	<button class="upload-btn">Browse Files</button>
      	</div>
      </div>
    </div>
  
  

</div>
<!-- 좌측 토글 끝 -->

</div>

<!-- 모달창 -->
<div id="loginModal" class="modal">
    <div class="modal-content">    
    	 
        <span id="closeModalBtn" style="position: absolute; top: 10px; right: 15px; cursor: pointer; display: none;">&times;</span>		
		
        <div class="login-box">
            <div class="lb-header">
                <a href="#" id="login-box-link" class="active">Login</a>
                <a href="#" id="signup-box-link">Sign Up</a>
            </div>
            
            <div class="social-login">
            	<div>
			      <a href="#">		       
			        <img alt="kakaotalk" src="./resources/images/icon_kakaotalk.png" > 
			        Log in with Kakaotalk 
			      </a>
		      	</div>
		      	<div>
			      <a href="#">
			         <img alt="google" src="./resources/images/icon_google.png">
			         Log in with Google 
			      </a>
		      	</div>
		      
		    </div>

            <form class="email-login">
                <div class="u-form-group">
                    <input type="email" placeholder="Email" />
                </div>
                <div class="u-form-group">
                    <input type="password" placeholder="Password" />
                </div>
                <div class="u-form-group">
                    <button type="submit">Log in</button>
                </div>
                <div class="u-form-group">
                    <a href="#" class="forgot-password">Forgot password?</a>
                </div>
            </form>

            <form class="email-signup">
                <div class="u-form-group">
                    <input type="email" placeholder="Email" />
                </div>
                <div class="u-form-group">
                    <input type="password" placeholder="Password" />
                </div>
                <div class="u-form-group">
                    <input type="password" placeholder="Confirm Password" />
                </div>
                <div class="u-form-group">
                    <button type="submit">Sign Up</button>
                </div>
            </form>
        </div>
    </div>
</div>



	<script src="./resources/js_main.js"></script>
	<script src="./resources/modal.js"></script>
</body>
</html>