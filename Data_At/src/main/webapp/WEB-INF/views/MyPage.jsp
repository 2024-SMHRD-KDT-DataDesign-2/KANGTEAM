<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css_main.css" />
<link rel="stylesheet" href="./resources/Main_test.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Data.At MyPage</title>
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
    

  
	  		<div class="container">
    
    	<aside class="sidebar">
    		<div class="sidebar-container">       
      	 		<button class="new-dataset-btn" id="new-dataset-btn">+ New Dataset</button>
      		</div>
     	 <ul>
     	    <li><a href="./MainPage">Home</a></li>
					<li><a href="./TutorialPage">How to Use</a></li>
					<li><a href="./SearchPage">Search</a></li>
					<li><a href="#">More</a></li>
   	  	 </ul>
  	  </aside>  

		</div>
		
		<!-- 우측에서 나오는 데이터업로드페이지  -->
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
	
	<!-- 개인정보 settings 페이지  -->
	<div class="mypages-wrapper" id="settings-page" style="display: block;">
    <header>
      <h1>Settings</h1>
      <p>Control over your account and all communications</p>
    </header>
    <nav>
      <ul class="tabs2">
        <li class="active2" id="account-btn">Account</li>
        <li id="myupload-btn">MyUpload</li>
      </ul>
    </nav>
     	<div id="account-page" style="display: block;">
	      <section class="settings-section">
	        <h2>Your email address</h2>
	        <p>${info.user_id}</p>
	
	        <h2>Your Nickname</h2>
	        <input class="search-input" type="text" placeholder="change nicknames" style="display: none" id="input-nickname"> 
	        <p id="change-nickname">${info.user_nick}</p>
	        <div>
	        	<button class="btn" id="change-nickname-btn">Change Nickname</button>
	      	</div>
	        <h2>Credit Saved</h2>
	        <p>${info.user_credit}</p>
	        <h2>Logout / Delete</h2>
	        <p>Logout or Delete</p>   
	        <button class="btn" onclick="window.location.href='/data_at/logout';">Log out</button>
            <button class="btn" onclick="window.location.href='/data_at/userDelete';">Delete ID</button>
	      </section>
       </div>
     
     	<div id="myupload-page" style="display: none;">
     		<main>
		     <section class="settings-section">
		     
		       <table>
		       <tr>
		           <th>Data Title</th>
		           <th>Size</th>
		           <th>Upload Date</th>
		       </tr>
		       <tr>
		           <td>apple</td>
		           <td>13.53MB</td>
		           <td>2024-11-29</td>
		       </tr>
		       <tr>
		           <td>apple juice</td>
		           <td>212.45MB</td>
		           <td>2024-11-30</td>
		       </tr>
		       <tr>
		           <td>color of apple species</td>
		           <td>143.67KB</td>
		           <td>2024-01-02</td>
		       </tr>
		     </table>
		
		     </section>
		    </main>
     	</div>
      
      
  </div>
  
  <!-- credits 페이지  -->
  <div class="mypages-wrapper" id="credits-page" style="display: none;">
    <header>
      <h1>Credits</h1>
      <p>Manage your Credits</p>
    </header>
    <nav>
      <ul class="tabs">
        <li class="active" id="history-btn">history</li>
        <li id="purchase-btn">credit purchase</li>
      </ul>
    </nav>
    
    <!-- credit history page -->
    <div id="creditHistory-page" style="display: none;">
    <main>
      <section class="settings-section">
        <table id="credit-table">
        
      </table>

      </section>
     </main>
    </div>
   
    
    <!-- credit purchase page -->
    <div id="creditPurchase-page" style="display: none;">           
         <div class="top-section">
            <div class="user-info">
                <div contenteditable="false" id="name"></div>
                <div contenteditable="false" id="email"></div>
                <div contenteditable="false" id="phone"></div>
            </div>
            
        </div>
        
        <div class="mission-section">
            <div class="missions">
                <div class="mission-card">
                    <h3>1000 Points</h3>
                    <p>Get for $50</p>
                    <button id="pay-50" class="button">Purchase</button>
                </div>
                <div class="mission-card">
                    <h3>500 Points</h3>
                    <p>Get for $25</p>
                    <button id="pay-25" class="button">Purchase</button>
                </div>
                <div class="mission-card">
                    <h3>300 Points</h3>
                    <p>Get for $15</p>
                    <button id="pay-15" class="button">Purchase</button>
                </div>                
               
                <div class="mission-card">
                    <h3>200 Points</h3>
                    <p>Get for $10</p>
                    <button id="pay-10" class="button">Purchase</button>
                </div>
                 <!-- class="mission-card disabled"로 있는데 예비로 남겨만 둘게요 -->
                <div class="mission-card disabled" style="display: none">
                    <h3>100 Points</h3>
                    <p>Get for $5</p>
                    <button class="button disabled">Locked</button>
                </div>
            </div>
    	</div>
    </div>
    
    	
    
    </div>
   
 
  
  
          
  </div>                    
  


	<script src="./resources/js_mypage.js"></script>
	<script src="./resources/upload_board.js"></script>
	<script src="./resources/payment_mypage.js"></script>
	<script src="./resources/Payment.js"></script>
</body>
</html>