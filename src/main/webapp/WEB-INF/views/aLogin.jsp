<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<link href="../resources/signin.css" rel="stylesheet">
<title>관리자로그인</title>
</head>
<body>
	<div class="container">
		<form action="${path}/emirimmeal/adminMenu" method="POST" class="form-signin">
				<h2 class="form-signin-heading">미림급식관리자페이지</h2>
				<label for="inputId">아이디</label>
				<input type="text" name="adminid" id="inputId" class="form-control" required>
				<label for="inputPw">비밀번호</label>
				<input type="password" name="adminpw" id="inputPw" class="form-control" required>
				<input type="submit" value="로그인" class="btn btn-lg btn-primary btn-block">
			
			<c:if test="${msg=='성공'}">
				<div><center>성공</center></div>
			</c:if>
			<c:if test="${msg=='실패'}">
				<div><center>아이디와 비밀번호가 일치하지 않습니다.</center></div>
			</c:if>
			
			<br><br>
			<center><a href="${path}/emirimmeal/index">돌아가기</a></center>
		
			<br><br><br><br><br><br><br><br>
		
		</form>
		<center><img src="../resources/mirim.png"></center>
	</div>
	
	
</body>
</html>