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
	<c:if test="${msg=='성공'}">
		<header>
			<h2> 
				급식신청기간 <br>
				몇월며칠부터 ~ 몇월며칠까지
			</h2>		
		</header>
		<leftmenu>
			<div id="loginInfo"></div>
			<a id="logout">로그아웃</a>
			<button>급식신청하기</button>
		</leftmenu>
		<main>
			<h1> ${sessionScope.name}님의 월 급식 신청 현황</h1>
			<table border=1>
				<tr>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
				</tr>
				<tr>
					<td class="mon"></td>
					<td class="tue"></td>
					<td class="wed"></td>
					<td class="thu"></td>
					<td class="fri"></td>
				</tr>
				<tr>
					<td class="mon"></td>
					<td class="tue"></td>
					<td class="wed"></td>
					<td class="thu"></td>
					<td class="fri"></td>
				</tr>
				<tr>
					<td class="mon"></td>
					<td class="tue"></td>
					<td class="wed"></td>
					<td class="thu"></td>
					<td class="fri"></td>
				</tr>
				<tr>
					<td class="mon"></td>
					<td class="tue"></td>
					<td class="wed"></td>
					<td class="thu"></td>
					<td class="fri"></td>
				</tr>
				<tr>
					<td class="mon"></td>
					<td class="tue"></td>
					<td class="wed"></td>
					<td class="thu"></td>
					<td class="fri"></td>
				</tr>
			</table>
		</main>
		<rightmenu>
			<div id="checkPrice">
				조식: 원<br>
				중식: 원<br>
				석식: 원<br>
			</div>
			<button>최종마감하기</button>
		</rightmenu>
	</c:if>
</body>

<script>
	window.onload = function() {
		mon = document.getElementsByClassName("mon");
		for(var i = 0; i < mon.length; i++) {
			mon[i].innerHTML = "조, 중, 석";
		}
	}
	
</script>

</html>