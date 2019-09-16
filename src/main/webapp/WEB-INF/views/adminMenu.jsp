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
	<h1>ADMIN MENU</h1>
	<form action="${path}/emirimmeal/studentInfo">
		<input type="submit" value="학생정보수정">
	</form>
	<form action="${path}/emirimmeal/mealSetting">
		<input type="submit" value="급식정보수정">
	</form>
	<form action="${path}/emirimmeal/checkDailyStudent">
		<input type="submit" value="일일급식신청자조회">
	</form>
	<br>
	<a href="${path}/emirimmeal/adminLogin">로그아웃</a>
</body>
</html>