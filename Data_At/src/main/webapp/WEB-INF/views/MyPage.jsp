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
    

  
	  		<div class="container">
    
    	<aside class="sidebar">
    		<div class="sidebar-container">       
      	 		<button class="new-dataset-btn" id="new-dataset-btn">+ New Dataset</button>
      		</div>
     	 <ul>
     	   <li><a href="MainPage">Home</a></li>
     	   <li><a href="#">Competitions</a></li>
     	   <li><a href="#">Datasets</a></li>
     	   <li><a href="#">Models</a></li>
     	   <li><a href="#">Code</a></li>
    	   <li><a href="#">Discussions</a></li>
     	   <li><a href="#">Learn</a></li>
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
      <ul class="tabs">
        <li class="active">Account</li>
        <li>Notifications</li>
      </ul>
    </nav>
    <main>
    
      <section class="settings-section">
        <h2>Your email address</h2>
        <p>miracleray1223@gmail.com</p>
        <button class="btn">Change email</button>
      </section>

      <section class="settings-section">
        <h2>Your Nickname</h2>
        <p>testNick_haha</p>
        <button class="btn">Change Nickname</button>
      </section>
      <section class="settings-section">
        <h2>Credit history</h2>
        <p>You can check your credit usage history</p>
        <button class="btn">Check My Credits</button>
      </section>
      <section class="settings-section">
        <h2>Credit Saved</h2>
        <p>my credits : 20000</p>
      </section>
      <section class="settings-section">
        <h2>Logout / Delete</h2>
        <p>Logout or Delete</p>   
        <button class="btn">Log out</button>
        <button class="btn">Delete ID</button>
      </section>
    </main>
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
      
        <table>
        <tr>
            <th>카테고리</th>
            <th>내역</th>
            <th>수량</th>
            <th>날짜</th>
        </tr>
        <tr>
            <td>이벤트</td>
            <td>출석이벤트참여</td>
            <td>+5</td>
            <td>2024-11-29</td>
        </tr>
        <tr>
            <td>결제</td>
            <td>크레딧 구매</td>
            <td>+200</td>
            <td>2024-11-30</td>
        </tr>
        <tr>
            <td>크레딧 사용</td>
            <td>데이터 다운로드</td>
            <td>-20</td>
            <td>2024-01-02</td>
        </tr>
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
               
                <div class="mission-card" >
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
   
 
  
    <!-- 계정에서 업로드한 데이터 목록 페이지  -->
    <div class="mypages-wrapper" id="uploaded-page" style="display: none;">
    <header>
      <h1>Uploaded data history</h1>
      <p>search data uploaded</p>
    </header>
    
    	<!--  검색바 -->
    	<div class="center">
		   	<div class="search-container">
		    	<i class="fa fa-search search-icon"></i>
		    	<input type="text" class="search-input" placeholder="Search datasets">
			</div>
		</div>
       
    <nav>
      <ul class="tabs">
        <li class="active">Datasets</li>
        <li>Notes</li>
      </ul>
    </nav>
    <main>
  	 <div class="selection-container">
  		<div>
    		<input type="checkbox" id="select-all" />
    		<label for="select-all">Select All</label>
  		</div>
  	<div>
    <span id="selected-count">0 selected</span>
  </div>
   
      <section class="settings-section">
       <div class="container-test">
        <div class="section1">
        	<div class="item">
    			<input type="checkbox" class="item-checkbox" />
    			<label>Item 1</label>
  				</div>
       		
        </div>
        	<div class="section2">
        		<div class = "title">
        			{Data title1}	
        		</div>
        		<span class="details">
        			{creator id} · Updated {3 days} ago
        		</span>
        		<span class="info">
        			<span>
        				{136}
        			</span>
        			MB
        		</span>          		 
       		</div>       		 
         </div>
          
      </section>
       </div>
      <section class="settings-section">
      <div class="container-test">
        <div class="section1">
        	<div class="item">
    			<input type="checkbox" class="item-checkbox" />
    			<label>Item 2</label>
  				</div>
        	</div>
        
        	<div class="section2">
        	   <div class = "title">
        			{Data title2}	
        		</div>
        		<span class="details">
        			{creator id} · Updated {3 days} ago
        		</span>
        		<span class="info">
        			<span>
        				{345}
        			</span>
        			MB
        		</span> 
        		 
       		</div>
         </div>
      </section>
      
      <section class="settings-section">
      <div class="container-test">
        <div class="section1">
        	<div class="item">
    			<input type="checkbox" class="item-checkbox" />
    			<label>Item 3</label>
  				</div>        	
        </div>
        	<div class="section2">
        	    <div class = "title">
        			{Data title3}	
        		</div>
        		<span class="details">
        			{creator id} · Updated {3 days} ago
        		</span>
        		<span class="info">
        			<span>
        				{15}
        			</span>
        			MB
        		</span>
       		</div>
         </div>
      </section>      
      
   </main>
  </div>  
  
  
  <!-- 계정에서 다운로드한 데이터 목록 페이지  -->
    <div class="mypages-wrapper" id="downloaded-page" style="display: none;">
    <header>
      <h1>Downloaded data history</h1>
      <p>search data downloaded</p>
    </header>
  	   <!--  검색바 -->
    	<div class="center">
		   	<div class="search-container">
		    	<i class="fa fa-search search-icon"></i>
		    	<input type="text" class="search-input" placeholder="Search datasets">
			</div>
		</div>
    <nav>
      <ul class="tabs">
        <li class="active">Datasets</li>
        <li>Notes</li>
      </ul>
    </nav>
    <main>
  	 <div class="selection-container">
  		<div>
    		<input type="checkbox" id="select-all" />
    		<label for="select-all">Select All</label>
  		</div>
  	<div>
    <span id="selected-count">0 selected</span>
  </div>
   
      <section class="settings-section">
       <div class="container-test">
        <div class="section1">
        	<div class="item">
    			<input type="checkbox" class="item-checkbox" />
    			<label>Item 1</label>
  				</div>
       		
        </div>
        	<div class="section2">
        		<div class = "title">
        			{Data title1}	
        		</div>
        		<span class="details">
        			{creator id} · Updated {3 days} ago
        		</span>
        		<span class="info">
        			<span>
        				{136}
        			</span>
        			MB
        		</span>          		 
       		</div>       		 
         </div>
          
      </section>
       </div>
      <section class="settings-section">
      <div class="container-test">
        <div class="section1">
        	<div class="item">
    			<input type="checkbox" class="item-checkbox" />
    			<label>Item 2</label>
  				</div>
        	</div>
        
        	<div class="section2">
        	   <div class = "title">
        			{Data title2}	
        		</div>
        		<span class="details">
        			{creator id} · Updated {3 days} ago
        		</span>
        		<span class="info">
        			<span>
        				{345}
        			</span>
        			MB
        		</span> 
        		 
       		</div>
         </div>
      </section>
      
      <section class="settings-section">
      <div class="container-test">
        <div class="section1">
        	<div class="item">
    			<input type="checkbox" class="item-checkbox" />
    			<label>Item 3</label>
  				</div>        	
        </div>
        	<div class="section2">
        	    <div class = "title">
        			{Data title3}	
        		</div>
        		<span class="details">
        			{creator id} · Updated {3 days} ago
        		</span>
        		<span class="info">
        			<span>
        				{15}
        			</span>
        			MB
        		</span>
       		</div>
         </div>
      </section>      
      
   </main>
  </div>          
  </div>                    
  


	<script src="./resources/js_main.js"></script>
	<script src="./resources/payment_mypage.js"></script>
	<script src="./resources/Payment.js"></script>
</body>
</html>