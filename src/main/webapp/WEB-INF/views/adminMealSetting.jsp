
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
	<h1>급식정보수정</h1>
	<form action="${path}/emirimmeal/settingModify" method="post">
		<fieldset>
			<legend>급식가격수정</legend>
			<label>아침</label>
			<input type="number" name = "breakfast" value="${setting.breakfast}">
			<br>
			<label>점심</label>
			<input type="number" name = "lunch" value="${setting.lunch}">
			<br>
			<label>저녁</label>
			<input type="number" name = "dinner" value="${setting.dinner}">
			<br>
		</fieldset>
		<fieldset>
			<legend>급식신청기간수정</legend>
			<label>오늘날짜</label>
			<input type="date" id="nowtime" readonly>
			<br>
			<label>해당 급식 신청 달</label>
			<input type="number" min="1" max="12" name="applydate" value="${setting.applydate}">
			<br>
			<label>시작일</label>
			<input type="date" id="starttime" name="starttime">
			<br>
			<label>마감일</label>
			<input type="date" id="endtime" name="endtime">
		</fieldset>
		<input type="submit" value="수정하기">
	</form>
	<br>
	<a href="${path}/emirimmeal/adminMenu">돌아가기</a>
</body>
<script>
	start = document.getElementById("starttime");
	end = document.getElementById("endtime");
	now = document.getElementById("nowtime");
	
	now.valueAsDate = new Date();
	start.valueAsDate = new Date("${setting.starttime}");
	end.valueAsDate = new Date("${setting.endtime}");
	
/* 	if(now.valueAsDate > start.valueAsDate
		|| now.valueAsDate > end.valueAsDate
		|| start.valueAsDate > end.valueAsDate) 
	{
		alert("다시 확인해주십시오");
	} */
</script>
</html>