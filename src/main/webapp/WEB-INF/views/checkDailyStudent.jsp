<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<title>오늘의 급식 신청자 명단</title>
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

a {
	float: right;
}

.table_daily {
	float: left;
	width: 60%;
	margin-right: 40px;
}

.table_count {
	width: 30%;
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
		<h1>일일 급식 신청자 조회</h1>
		<a href="${path}/emirimmeal/adminMenu">돌아가기</a>
		<h3 id="today">오늘 날짜:</h3>
		<table class="table_daily table table-bordered table-striped">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>오늘의 급식 현황</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.no}</td>
					<td>${list.name}</td>
					<td>${list.applymeal}</td>
				</tr>
			</c:forEach>
		</table>

		<table class="table_count table table-bordered table-striped">
			<tr>
				<th>신청 현황</th>
				<th>인원</th>
			</tr>
			<c:forEach var="cnt" items="${cnt}">
				<tr>
					<td>${cnt.applymeal}</td>
					<td>${cnt.cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<img src="../resources/mirim.png">
	</div>
</body>
<script>
	var date = new Date();
	var dayNames = [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ];

	document.getElementById("today").innerHTML += date.getFullYear() + "년 "
			+ (date.getMonth() + 1) + "월 " + date.getDate() + "일 "
			+ dayNames[date.getDay()];
</script>
</html>