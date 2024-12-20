
	   //--- dataresultpage 링크 걸기 ---
		
	   document.addEventListener("DOMContentLoaded", () => {
        let data_title01 = document.getElementById('data_title01');
        
        if (data_title01) {	
            data_title01.addEventListener("click", goDataDetail);
        } 

        function goDataDetail(event) {
            console.log("goDataDetail 함수 실행됨");
            window.location.href = "http://localhost:8085/data_at/DataDetailPage";  // 성공!!
        }
    });