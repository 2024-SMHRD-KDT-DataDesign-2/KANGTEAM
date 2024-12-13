<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body align='center'>
	<h1>Hello world!</h1>

	<form action="dataSearch" method="post">
		<input name="search" placeholder="search"> <input
			type="submit" value="search">
	</form>

	<c:if test="${!empty searchList}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td>아이디</td>
				<td>날짜</td>
				<td>클래스</td>
				<td>사이즈</td>
			</tr>
			<c:forEach items="${searchList}" var="list">
				<tr>
					<td>${list.img_title}</td>
					<td>${list.user_id}</td>
					<td>${list.created_at}</td>
					<td>${list.img_class}</td>
					<td>${list.img_size}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<c:if test="${empty searchList}">
		<p>clear</p>
	</c:if>
</body>
</html>
