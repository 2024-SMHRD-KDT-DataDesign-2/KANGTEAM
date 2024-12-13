<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>결제 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin-top: 50px;
}

input[type="text"], input[type="number"] {
	padding: 10px;
	margin: 10px;
	width: 200px;
}

input[type="submit"] {
	padding: 10px 20px;
	margin: 10px;
	font-size: 16px;
	cursor: pointer;
}
</style>
</head>
<body>
	<h1>결제 정보 입력</h1>
	<form action="processPayment" method="post">
		<input type="hidden" name="amount" value="${amount}" />
		<!-- 구매할 크레딧 양을 전달 -->
		<p>구매할 크레딧: ${amount} 크레딧</p>
		<label for="cardNumber">카드 번호:</label> <input type="text"
			id="cardNumber" name="cardNumber" required /><br /> <label
			for="expiryDate">유효 기간 (MM/YY):</label> <input type="text"
			id="expiryDate" name="expiryDate" required /><br /> <label for="cvc">CVC:</label>
		<input type="number" id="cvc" name="cvc" required /><br /> <input
			type="submit" value="결제하기" />
	</form>
</body>
</html>