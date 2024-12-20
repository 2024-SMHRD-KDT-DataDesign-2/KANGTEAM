	 
  
   
// Mypage -> credit purchase 에서 구매버튼 누르면 해당 값을 가지고 paymentpage로 이동 

  	const pay50btn = document.getElementById('pay-50');
  	const pay25btn = document.getElementById('pay-25');
  	const pay15btn = document.getElementById('pay-15');
  	const pay10btn = document.getElementById('pay-10');
  	
  	pay50btn.addEventListener("click",()=>{
		console.log('pay50btn clicked');
		localStorage.setItem("payment", "50");
		
		console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
		window.location.href = "http://localhost:8085/data_at/PaymentPage";
  	 });
  	 
  	 pay25btn.addEventListener("click",()=>{
		console.log('pay25btn clicked');
		localStorage.setItem("payment", "25");
		console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
		window.location.href = "http://localhost:8085/data_at/PaymentPage";
  	 });
  	 
  	 pay15btn.addEventListener("click",()=>{
		console.log('pay20btn clicked');
		localStorage.setItem("payment", "15");
		console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
		window.location.href = "http://localhost:8085/data_at/PaymentPage";
  	 });
  	 
  	 pay10btn.addEventListener("click",()=>{
		console.log('pay10btn clicked');
		localStorage.setItem("payment", "10");
		console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
		window.location.href = "http://localhost:8085/data_at/PaymentPage";
  	 });
  	 
  	 
