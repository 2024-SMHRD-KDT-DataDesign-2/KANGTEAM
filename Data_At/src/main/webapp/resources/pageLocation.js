	 
	   //--- dataresultpage 링크 걸기 ---
		
	   document.addEventListener("DOMContentLoaded", () => {
	       let data_title01 = document.getElementById('data_title01');
	       
	       if (data_title01) {	
	           data_title01.addEventListener("click", goDataDetail);
	       } else {
	           console.error('data_title01 = null');
	       }

	       function goDataDetail(event) {
	           event.preventDefault(); // 기본 동작 중지
	           console.log("goDataDetail 함수 실행됨");
	           window.location.href = "http://localhost:8085/data_at/DataDetailPage";  // 성공!!
	       }
	   });
  
   
  