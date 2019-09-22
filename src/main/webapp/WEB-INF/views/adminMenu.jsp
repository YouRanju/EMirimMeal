<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<link rel="stylesheet" href="../resources/pricing.css">
<title>관리자 패이지</title>
</head>
<body>
	<div class="container">
		<h1 class="text-center">ADMIN MENU</h1>
		<div class="card infoBtn">
	        <img src="../resources/design.png" width="120px">
	        <form action="${path}/emirimmeal/studentInfo" class="infoBtn">
				<input type="submit" class= "btn btn-default" value="학생정보수정">
			</form>
	    </div>
	    <div class="card infoBtn">
	        <img src="../resources/setting.png" width="120px">
	        <form action="${path}/emirimmeal/mealSetting" class="settingBtn">
				<input type="submit" class= "btn btn-default" value="급식정보수정">
			</form>
	    </div>
	    <div class="card infoBtn">
	        <img src="../resources/calendar.png" width="120px">
	        <form action="${path}/emirimmeal/checkDailyStudent" class="checkBtn">
				<input type="submit" class= "btn btn-default" value="일일급식신청자조회">
			</form>
	    </div>
		
		<br>
		<a href="${path}/emirimmeal/adminLogin">로그아웃</a>
		
		<center><img src="../resources/mirim.png"></center>
	</div>

</body>
</html>