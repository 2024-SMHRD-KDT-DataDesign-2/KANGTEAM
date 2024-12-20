// Mainpage 아래에서 구매버튼 누르면 해당 값을 가지고 paymentpage로 이동
// jsp 안에서 script하면 잘되더라.. 그런데 왜 외부 js로 옮기면 안되는걸까.

  	const pay010 = document.getElementById('pay-010');
	const pay025 = document.getElementById('pay-025');
  	const pay050 = document.getElementById('pay-050');
  	
  	pay010.addEventListener("click",()=>{
		console.log('pay010 clicked');
		localStorage.setItem("payment", "10");		
		console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
		window.location.href = "http://192.168.219.176:8081/data_at/PaymentPage";
  	 });
  	 
  	 pay025.addEventListener("click",()=>{
		console.log('pay025 clicked');
		localStorage.setItem("payment", "25");		
		console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
		window.location.href = "http://192.168.219.176:8081/data_at/PaymentPage";
  	 });
  	 
  	 pay050.addEventListener("click",()=>{
		console.log('pay050 clicked');
		localStorage.setItem("payment", "50");		
		console.log("Value saved in localStorage:", localStorage.getItem("payment")); // 확인용 로그
		window.location.href = "http://192.168.219.176:8081/data_at/PaymentPage";
  	 });
  	 