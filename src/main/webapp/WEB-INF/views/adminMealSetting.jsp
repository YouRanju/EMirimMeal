
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
<title>급식정보수정</title>
<style>
	.container {
		width: 50%;
		padding: 20px;
	}
	.container > div {
		height: 250px;
	}
	form {
		display: block;
		width: 100%;
	}
	fieldset {
		clear:right;
		float:left;
		width: 45%;
		margin: 15px;
		height: 230px;
		padding: 10px;
		border: 2px solid #eee;
	}
	input[type="submit"] {
		float: right;
	}
	a {
		clear:both;
		display: inline-block;
	}
	fieldset div {
		position: relative;
		padding: 5px;
	}
	fieldset input {
		position:absolute;
		margin-left: 30px;
		right: 0;
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
		<h1>급식정보수정</h1>
		<div>
			<form action="${path}/emirimmeal/settingModify" method="post">
				<input type="submit" class="btn btn-info" value="수정하기">
				<fieldset>
					<h4>급식가격수정</h4>
					<div>
						<label>아침</label> 
						<input type="number" name="breakfast" value="${setting.breakfast}">
					</div>
					<div>
						<label>점심</label> 
						<input type="number" name="lunch" value="${setting.lunch}"> 
					</div>
					<div>
						<label>저녁</label> 
						<input type="number" name="dinner"
						value="${setting.dinner}"></div>
				</fieldset>
				<fieldset>
					<h4>급식신청기간수정</h4>
					<div>
						<label>오늘날짜</label><input type="date" id="nowtime" readonly>
					</div>
					<div>
						<label>해당 급식 신청 달</label> <input type="number" min="1"
						max="12" name="applydate" value="${setting.applydate}"> </div>
					<div>
						<label>시작일</label> 
						<input type="date" id="starttime" name="starttime">
					</div>
					<div>
						<label>마감일</label> 
						<input type="date" id="endtime" name="endtime">
					</div>
					
				</fieldset>
			</form>
		</div>
		<a href="${path}/emirimmeal/adminMenu">돌아가기</a>
		<img src="../resources/mirim.png">
	</div>
</body>
<script>
	start = document.getElementById("starttime");
	end = document.getElementById("endtime");
	now = document.getElementById("nowtime");

	now.valueAsDate = new Date();
	start.valueAsDate = new Date("${setting.starttime}");
	end.valueAsDate = new Date("${setting.endtime}");
</script>
</html>