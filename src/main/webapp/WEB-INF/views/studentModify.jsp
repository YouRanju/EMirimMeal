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
	<h1>학생정보수정</h1>
	<form action = "${path}/emirimmeal/studentModify" method="post">
	<table border = 1>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>기숙사현황</th>
			<th>개인코드</th>
			<th>비고사항</th>
			<th></th>
		</tr>
		<tr>
			<td><input type="text" name="no" value="${student.no}" readonly></td>
			<td><input type="text" name="name" value="${student.name}"></td>
			<td><input type="text" name="isdorm" value="${student.isdorm}"></td>
			<td><input type="text" name="passcode" value="${student.passcode}"></td>
			<td><input type="text" name="etc" value="${student.etc}"></td>
			<td><input type="submit" value="수정완료"></td>
		</tr>
	</table>
	</form>
	
	<br>
	<a href="${path}/emirimmeal/studentInfo">돌아가기</a>
</body>
</html>