<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css_main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Data.At MyPage</title>
</head>
<body>
	<div class = "all">

		<header class="navbar">  

    		<div class="logo">Data.At</div>
   	 <nav>
    
      <a href="MainPage">Home</a>
      <a href="#" id="uploaded-btn">Uploaded</a>
      <a href="#" id="downloaded-btn">Downloaded</a>
      <a href="" id="credits-btn">Credit</a>
      <a href="" id="settings-btn">Settings</a>
    </nav>
  </header>
  
    <div style="background-color: #007bff;">
        <button class="menu-toggle">&#9776;</button>
    </div>
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
        <p id="nick">testNick_haha</p>
        <button class="btn" onclick="updateUser()">Change Nickname</button>
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
  
  <!-- credits history 페이지  -->
  <div class="mypages-wrapper" id="credits-page" style="display: none;">
    <header>
      <h1>Credits</h1>
      <p>Check your Credit use history</p>
    </header>
    <nav>
      <ul class="tabs">
        <li class="active">history</li>
        <li>뭐넣을거있습니까</li>
      </ul>
    </nav>
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
  
    <!-- 계정에서 업로드한 데이터 목록 페이지  -->
    <div class="mypages-wrapper" id="uploaded-page" style="display: none;">
    <header>
      <h1>Uploaded data history</h1>
      <p>search data uploaded</p>
    </header>
  	   <div class="search-container">
         <input type="text" placeholder="Search datasets" class="search-bar-mypage">
         <button class="search-button">Search</button>
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
  	   <div class="search-container">
         <input type="text" placeholder="Search datasets" class="search-bar-mypage">
         <button class="search-button">Search</button>
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
</body>
</html>