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
	<h1>미림급식신청</h1>
	<form action="${path}/emirimmeal/sLoginCheck" method="POST">
		<fieldset>
			<label>학번</label><br> <input type="number" name="no"><br>
			<label>이름</label><br> <input type="text" name="name"><br>
			<label>개인코드</label><br> <input type="password" name="passcode"><br>
			<br> 
			<input type="submit" value="로그인">
		</fieldset>
	</form>
	<p>개인코드는 학년 초에 나눠준 영문코드입니다. 나중에 변경할 수 있으며, 잊어버린 경우 담당 선생님께 연락바랍니다.</p>
	
	<a href="${path}/emirimmeal/aLogin">관리자모드</a>
	
	<c:if test="${msg=='성공'}">
		<div>성공</div>
	</c:if>
	<c:if test="${msg=='실패'}">
		<div>아이디와 비밀번호가 일치하지 않습니다.</div>
	</c:if>
</body>
</html>