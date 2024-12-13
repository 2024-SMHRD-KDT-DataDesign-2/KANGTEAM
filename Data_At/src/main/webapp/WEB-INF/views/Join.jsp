<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 현재 경로(회원가입 페이지로 이동) : localhost:8085/myapp/users/join -->
	<!-- 회원가입 경로 : [POST]localhost:8085/myapp/users -->
	<form action="/data_at/userjoin" method="post">
		<input type="text" name="user_id" placeholder="아이디"><br>
		<input type="password" name="user_pw" placeholder="비밀번호"><br>
		<input type="text" name="user_nick" placeholder="닉네임"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>