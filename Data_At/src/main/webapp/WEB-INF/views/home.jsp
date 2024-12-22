<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

html {
	height: 90%;
}

body {
	background: #000000;
	display: flex;
	align-items: center;
	height: 90%;
}

.back {
	margin: 1em auto;
	font-family: "Roboto";
}

.back span {
	font-size: 3em;
	color: #F2C640;
	background: #262B37;
	display: table-cell;
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3), 0 5px 0 #ccc;
	padding: 0 15px;
	line-height: 100px;
	animation: jumb 2s infinite;
}

@
keyframes jumb { 0% {
	transform: translateY(0px)
}

50
%
{
transform
:
translateY(
-30px
);
box-shadow
:
0
15px
0
rgb(
242
,
198
,
64
);
}
100
%
{
transform
:
translateY(
0px
)
}
}
.back span:nth-child(1) {
	animation-delay: 0s;
}

.back span:nth-child(2) {
	animation-delay: .1s;
}

.back span:nth-child(3) {
	animation-delay: .2s;
}

.back span:nth-child(4) {
	animation-delay: .3s;
}

.back span:nth-child(5) {
	animation-delay: .4s;
}

.back span:nth-child(6) {
	animation-delay: .5s;
}

.back span:nth-child(7) {
	animation-delay: .6s;
}
</style>
</head>
<body>
	<span class="back"> <span>L</span> <span>o</span> <span>a</span>
		<span>d</span> <span>i</span> <span>n</span> <span>g</span>
	</span>

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
