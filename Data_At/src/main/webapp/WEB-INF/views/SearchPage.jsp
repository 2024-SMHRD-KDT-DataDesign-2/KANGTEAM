<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./resources/search.css" />
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

</head>
<body>
   
    <div class="search_div">
        <div class="section03 width4">
            <i class="fa-solid fa-arrow-left" onclick="location.href='MainPage'"></i>
        </div>        
        <div class="section02">
            <div class="wrap">
                <div class="search">
                   <input type="text" class="searchTerm" id="searchTerm">
                   
                </div>
             </div>       
        </div>     
        <div class="section03">            
            <i class="fa-solid fa-magnifying-glass" onclick="searchData()"></i>            
        </div>
        <div class="section03">            
            <i class="fa-solid fa-xmark" onclick="location.href='MainPage'"></i>
        </div>
    </div>

        
    <div>
    <main>
    	<!-- 체크박스 selectAll
	  		<div>
	    		<input type="checkbox" id="select-all" />
	    		<label for="select-all">Select All</label>
	  		</div>
	  		<div>
	    		<span id="selected-count">0 selected</span>
	 	 	</div>
 	 	 -->
   
        <section class="settings-section">
        	<div class="container-test">
        		<div class="section1">
        			<div class="item">
    					<i class="fa-solid fa-magnifying-glass"></i>    
	  				</div>       	
        		</div>
        		<div class="section2">
       				
       				<span class="details">
       					View all results for <b> "search words 01" </b>
       				</span>
       				        		 
	       		</div>       		 
	       </div>          
		 </section>
      
      <!-- 체크박스 하나하나를 이루는 요소  
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
      
      -->
      
      	<section class="settings-section">
        	<div class="container-test">
        		<div class="section1">
        			<div class="item">
    					<i class="fa-solid fa-magnifying-glass"></i>    
	  				</div>       	
        		</div>
        		<div class="section2">
       				
       				<span class="details">
       					search words 02
       				</span>
       				        		 
	       		</div>       		 
	       </div>          
		 </section>
		 
		 <section class="settings-section">
        	<div class="container-test">
        		<div class="section1">
        			<div class="item">
    					<i class="fa-solid fa-magnifying-glass"></i>    
	  				</div>       	
        		</div>
        		<div class="section2">
       				
       				<span class="details">
       					search words 03
       				</span>
       				        		 
	       		</div>       		 
	       </div>          
		 </section>
		 
		 <section class="settings-section">
        	<div class="container-test">
        		<div class="section1">
        			<div class="item">
    					<i class="fa-solid fa-magnifying-glass"></i>    
	  				</div>       	
        		</div>
        		<div class="section2">
       				
       				<span class="details">
       					search words 04
       				</span>
       				        		 
	       		</div>       		 
	       </div>          
		 </section>
      
	 
   </main>
    </div>
    <script src="./resources/js_main.js"></script>
    <script>
    function searchData() {
        // 검색어 값을 가져오기
        const searchTerm = document.getElementById("searchTerm").value;

        // URL에 검색어 추가하여 이동
        if (searchTerm) {
            location.href = '/data_at/dataSearch?search=' + encodeURIComponent(searchTerm);
        } else {
            alert("검색어를 입력해주세요."); // 검색어가 없을 때의 처리
        }
    }
</script>
</body>
</html>