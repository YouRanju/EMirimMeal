<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<h1>미림급식관리자페이지</h1>
	<form action="${path}/emirimmeal/adminMenu" method="POST">
		<fieldset>
			<label>아이디</label><br> <input type="text" name="adminid"><br>
			<label>비밀번호</label><br> <input type="password" name="adminpw"><br>
			<br>
			<input type="submit" value="로그인">
		</fieldset>
	</form>
	<a href="${path}/emirimmeal/index">돌아가기</a>
	
	<c:if test="${msg=='성공'}">
		<div>성공</div>
	</c:if>
	<c:if test="${msg=='실패'}">
		<div>아이디와 비밀번호가 일치하지 않습니다.</div>
	</c:if>
</body>
</html>