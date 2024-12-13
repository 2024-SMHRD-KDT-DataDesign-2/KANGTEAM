<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css_main.css" />
<title>Welcome to Data.At !!!</title>
</head>
<body>
    <div class = "all">
     <header class="navbar">

   

    <div class="logo">Data.At</div>
    <nav>
    
      <a href="MainPage">Home</a>
      <a href="#" id="uploaded-btn">Uploaded</a>
      <a href="#">Downloaded</a>
      <a href="#" id="credits-btn">Credit</a>
      <a href="Login">Login</a>
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
   

  <main class="hero">
    <div class="hero-content">
     <!-- 검색창  -->
        <div class="search-container">
            <input type="text" placeholder="Search datasets, competitions, or courses..." class="search-bar">
            <button class="search-button">Search</button>
          </div>

      <h1>Welcome to Data.At</h1>
      <p>Explore datasets, join competitions, and grow your data science skills.</p>
      <button id="getStarted">Get Started</button>
    </div>
  </main>
  
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
  
  <section class="features">
    <div class="feature">
      <h2>Datasets</h2>
      <p>Access thousands of open datasets for your projects.</p>
    </div>
    <div class="feature">
      <h2>Competitions</h2>
      <p>Join challenges and compete with the best in data science.</p>
    </div>
    <div class="feature">
      <h2>Courses</h2>
      <p>Learn new skills with interactive courses.</p>
    </div>
  </section>
  <footer class="footer">
    <p>&copy; 2024 DataPlatform. All rights reserved.</p>
  </footer>

</div>
</div>
  <script src="./resources/js_main.js"></script>
</body>
</html>