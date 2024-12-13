<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./resources/search_result.css" />
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

</head>
<body>
   
    <div class="search_div">
        <div class="section03">
            <i class="fa-solid fa-arrow-left" onclick="location.href='MainPage'"></i>
        </div>        
        <div class="section02">
            <div class="wrap">
                <div class="search">
                   <input type="text" class="searchTerm">
                   
                </div>
             </div>       
        </div>     
        <div class="section03">            
            <i class="fa-solid fa-magnifying-glass"></i>            
        </div>
        <div class="section03">            
            <i class="fa-solid fa-xmark" onclick="location.href='MainPage'"></i>
        </div>
    </div>

    <div class="search-result">
        <div class="container-spacebetween">
            <p> 10000 results </p>
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
    
    <div>
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
         
      
   </main>
    </div>
    <script src="./resources/js_main.js"></script>
</body>
</html>