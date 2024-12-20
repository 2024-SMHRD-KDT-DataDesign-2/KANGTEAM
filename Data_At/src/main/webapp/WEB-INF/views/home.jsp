<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>Hello world!</h1>
	<input type="text" id="classes">
	<input type="text" id="img">
	<button type="button" onclick="clipjson()">CLIP</button>

	<hr>

	<form action="detect" method="POST">
		<input type="text" id="classes" name="classes"
			placeholder="Enter classes"> <input type="text" id="img_url"
			name="img_url" placeholder="Enter image URL"> <input
			type="text" id="img_id" name="img_id" placeholder="Enter image id">
		<input type="submit" value="Submit">
	</form>

	<script type="text/javascript">
      $(document).ready(function (){
         let clipclass = $("#classes").val() ;
         let img = $("#img").val() ;
         
         console.log("class : " + clipclass) ;
         console.log("img : " + img) ;
         
         $.ajax({
               url : "classify",
               type : "POST",
               contentType: 'application/json',
               data : JSON.stringify({
                  "classes" : clipclass, 
                  "img_url" : img
               }),
               success : function(responseData){
                  console.log("json : " + responseData)
                  
                  const json = {
                        "img_url": img,
                        "json": responseData 
                        }; 
                 
                   fetch("http://localhost:8085/data_at/api/clipUpload", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json"
                            },
                            body: JSON.stringify(json)
                        })
                        .then(response => response.text())
                        .then(responseJson => {
                            console.log("Response:", responseJson);
                            document.getElementById("response").innerText = responseJson; // 응답 표시
                        })
                        .catch((error) => {
                            console.error("(DB upload)Error:", error);
                        });
                    },
               error : function(){alert("CLIP api") ;}
            }) ;
      }
      
      $(document).ready(function() {
          $('#detectForm').on('submit', function(event) {
              event.preventDefault(); // 기본 폼 제출 방지

              // 폼 데이터 가져오기
              const classes = $('#classes').val();
              const img_url = $('#img_url').val();
              const img_id = $('#img_id').val();

              // AJAX 요청
              $.ajax({
                  url: '/detect',
                  type: 'POST',
                  data: {
                      "classes": classes,
                      "img_url": img_url,
                      "img_id": img_id
                  },
                  success: function(response) {
                      // 성공 시 처리
                      console.log('Success:', response);
                      alert('요청이 성공적으로 처리되었습니다.');
                  },
                  error: function(xhr, status, error) {
                      // 오류 시 처리
                      console.error('Error:', error);
                      alert('요청 처리 중 오류가 발생했습니다.');
                  }
              });
          });
      })
   </script>
</body>
</html>
