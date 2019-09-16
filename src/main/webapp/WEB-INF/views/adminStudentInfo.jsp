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
	<table border = 1>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>기숙사현황</th>
			<th>개인코드</th>
			<th>비고사항</th>
			<th></th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.no}</td>
				<td>${list.name}</td>
				<td>${list.isdorm}</td>
				<td>${list.passcode}</td>
				<td>${list.etc}</td>
				<td><a href="${path}/emirimmeal/studentModify/${list.no}"><button>수정하기</button></a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="${path}/emirimmeal/adminMenu">돌아가기</a>
</body>
</html>