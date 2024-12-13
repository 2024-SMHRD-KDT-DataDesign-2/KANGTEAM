<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 현재 경로(회원가입 페이지로 이동) : [GET]localhost:8085/myapp/login -->
	<!-- 로그인 요청 경로 : [POST]localhost:8085/myapp/login -->
	<form action="/data_at/userlogin" method="post">
		<input type="text" name="user_id" placeholder="아이디"><br>
		<input type="password" name="user_pw" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">
	</form>
	<button onclick="location.href='Join'">회원가입</button>
</body>
</html>