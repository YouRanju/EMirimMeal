<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<title>학생정보수정</title>
<style>
	.container {
	padding: 20px;
	width: 50%;
}

a {
	float: right;
}

.container>img {
	bottom: 0;
	right: 0;
	margin-right: 20px;
	margin-bottom: 20px;
	position: fixed;
	width: 150px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>학생정보수정</h1>
		<a href="${path}/emirimmeal/adminMenu">돌아가기</a>
		<table class="table table-bordered table-striped">
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
					<td width="10%">
						<a href="${path}/emirimmeal/studentModify/${list.no}">
							<button class="btn btn-info">수정하기</button>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<img src="../resources/mirim.png">
	</div>

</body>
</html>