<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>크레딧 구매 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin-top: 50px;
}

.credit-button {
	padding: 10px 20px;
	margin: 10px;
	font-size: 16px;
	cursor: pointer;
}
</style>
</head>
<body>
	<h1>크레딧 구매</h1>
	<p>원하는 크레딧을 선택하세요:</p>
	<button class="credit-button"
		onclick="location.href='purchase?amount=100'">크레딧 100 구매</button>
	<button class="credit-button"
		onclick="location.href='purchase?amount=200'">크레딧 200 구매</button>
	<button class="credit-button"
		onclick="location.href='purchase?amount=300'">크레딧 300 구매</button>
</body>
</html>