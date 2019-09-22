<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<link rel="canonical" href="https://getbootstrap.com/docs/3.3/examples/signin/">
<link href="../resources/signin.css" rel="stylesheet">
<title>미림급식신청 메인페이지</title>
</head>
<body>
	<div class="container">
		<form action="${path}/emirimmeal/studentMeal" method="POST" class="form-signin">
			<center><h1 class="form-signin-heading">미림급식신청</h1></center>
			<label for="inputNo">학번</label>
			<input type="number" name="no" id="inputNo" class="form-control" required>
			<label for="inputName">이름</label>
			<input type="text" name="name" id="inpuName" class="form-control" required>
			<label for="inputPw">개인코드</label>
			<input type="password" name="passcode" id="inputPw" class="form-control" required>
			<input type="submit" value="로그인" class="btn btn-lg btn-primary btn-block">
		
		<p>개인코드는 학년 초에 나눠준 영문코드입니다. 잊어버린 경우 담당 선생님께 연락바랍니다.</p>
		<br>
		<c:if test="${msg=='성공'}">
			<div><center>성공</center></div>
		</c:if>
		<c:if test="${msg=='실패'}">
			<div><center>아이디와 비밀번호가 일치하지 않습니다.</center></div>
		</c:if>
		
		<br><br>
		<center><a href="${path}/emirimmeal/adminLogin">관리자모드</a></center>
		
		<br>
		
		</form>
		<center><img src="../resources/mirim.png"></center>
	</div>
</body>
</html>