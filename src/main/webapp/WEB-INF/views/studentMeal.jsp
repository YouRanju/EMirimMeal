<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<link rel="stylesheet" href="../resources/calendar.css">
<link rel="stylesheet" href="../resources/studentmeal.css">
<title>${state.name}님의 ${setting.applydate}월 급식 현황</title>

</head>
<body>
	<div class="container">
		<header>
			<h2> 급식신청기간</h2>
			<h3>${setting.starttime}부터 ~ ${setting.endtime}까지</h3>			
		</header>
		<hr>
		<leftmenu>
			<div id="loginInfo">
				${state.name}님이 로그인 중입니다.
			</div>
			<a href="${path}/emirimmeal/index" class="logoutbtn">로그아웃</a>
			<c:if test="${state.issave!='y'}">
				<a href="${path}/emirimmeal/studentMealApply" id="apply">
					<button class= "btn btn-success">
						<img src="../resources/check.png" width="15px">&nbsp&nbsp급식신청하기
					</button>
				</a>
			</c:if>
		</leftmenu>
		<main>
			<h1><center>${state.name}님의 ${setting.applydate}월 급식 신청 현황</center></h1>
			<table class="table table-bordered">
				<thead>
					<tr class="row">
						<th class="calendar-day">월</th>
						<th class="calendar-day">화</th>
						<th class="calendar-day">수</th>
						<th class="calendar-day">목</th>
						<th class="calendar-day">금</th>
					</tr>
				</thead>
				<tbody>
				<%
					Calendar cal = Calendar.getInstance();
				    cal.set(Calendar.MONTH, Integer.parseInt(session.getAttribute("applydate").toString())-1);
				    
				    int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				    int day[][] = new int[6][7];
				    String daytoString[][] = new String[6][7];
				              
			         for(int i=1; i<=maxDay; i++) {
			             cal.set(Calendar.DATE, i);
			             
			             day[cal.get(Calendar.WEEK_OF_MONTH)-1]
			                [cal.get(Calendar.DAY_OF_WEEK)-1] = i;
			          }
				         
				 
			          for(int i=0; i<6; i++) {
			        	  for(int j=0; j<7; j++) {
			        		  if(day[i][j] != 0) {
			        			  daytoString[i][j] = Integer.toString(day[i][j]);
			        		  }
			        		  else {
			        			  daytoString[i][j] = "";
			        		  }
			        	  }
			          }   
			          
			          for(int i=0; i<6; i++) {
			        	  if(i > 4 && daytoString[i][1] == "") {
			        		  break;
			        	  }
			        	  if(i < 2 && daytoString[i][5] == "") {
			        		  continue;
			        	  }
			        	  %>
			        	  <tr class="row">
			        	  	<td class="mon calendar-day"><%=daytoString[i][1] %></td>
			        	  	<td class="tue calendar-day"><%=daytoString[i][2] %></td>
			        	  	<td class="wed calendar-day"><%=daytoString[i][3] %></td>
			        	  	<td class="thu calendar-day"><%=daytoString[i][4] %></td>
			        	  	<td class="fri calendar-day"><%=daytoString[i][5] %></td>
			        	  <tr>
			        	  <%
			          }
			    %>
			    </tbody>
			</table>
		</main>
		<rightmenu>
			<div id="checkPrice"></div>
				<form action = "${path}/emirimmeal/save" method="post">
					<input type="hidden" name="no" value="${state.no}">
					<input type="hidden" name="name" value="${state.name}">
					<input type="hidden" name="issave" value="y">
					<input type="hidden" name="checkmeal" value="${state.checkmeal}">
					<input type="hidden" name="total" id="total">
					<c:if test="${state.issave!='y'}">
						<input type="submit" class="btn btn-warning" value="최종마감하기">
					</c:if>
				</form>
			
		</rightmenu>
		<img src="../resources/mirim.png">
	</div>	
</body>
<script>
	function emptyday(name, index) {
		var object = document.getElementsByClassName(name)[index];

		if(object.innerHTML != "") {
			return false;
		}
		else {
			bprice -= breakfast;
			lprice -= lunch;
			dprice -= dinner;
			return true;
		}
		
	}
	
	var checkMeal = '${state.checkmeal}';
	var daycheckmeal=[];
	var breakfast = Number('${setting.breakfast}');
	var lunch = Number('${setting.lunch}');
	var dinner = Number('${setting.dinner}');
	var bprice = 0;
	var lprice = 0;
	var dprice = 0;
	
	for(var i = 0; i < 15; i++) {
		daycheckmeal[i] = checkMeal[i];
		
		if(i == 0 || i % 3 == 0) {
			if(daycheckmeal[i]==1) {
				bprice += breakfast;
			}
		}
		else if(i % 3 == 1) {
			if(daycheckmeal[i]==1) {
				lprice += lunch;
			}
		}
		else if(i % 3 == 2) {
			if(daycheckmeal[i] == 1) {
				dprice += dinner;
			}
		}
	}
	
	var maxweek = document.getElementsByClassName("mon").length;
	
	bprice *= maxweek;
	lprice *= maxweek;
	dprice *= maxweek;
	
	emptyday("mon", 0); emptyday("mon", maxweek-1);
	emptyday("tue", 0); emptyday("tue", maxweek-1);
	emptyday("wed", 0); emptyday("wed", maxweek-1);
	emptyday("thu", 0); emptyday("thu", maxweek-1);
	emptyday("fri", 0); emptyday("fri", maxweek-1);
	
	if(bprice < 0) bprice = 0;
	if(lprice < 0) lprice = 0;
	if(dprice < 0) dprice = 0;
	
	document.getElementById("checkPrice").innerHTML = "조식: " + bprice.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + "원 <br>"
												+"중식: " + lprice.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + "원 <br>"
												+"석식: " + dprice.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + "원 <br>"
												+"총합: " + (bprice + lprice + dprice).toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + "원";
	document.getElementById("total").value = (bprice + lprice + dprice);
	
	var checkMeal = '${state.checkmeal}';
	var daycheckmeal=[String(checkMeal.substr(0,3)),
		String(checkMeal.substr(3,3)),String(checkMeal.substr(6,3)),
		String(checkMeal.substr(9,3)),String(checkMeal.substr(12,3))];
	var enumnumber = ["000","001","010","100","011","101","110","111"];
	var enumcheck = [
		'급식없음',
		'석식',
		'중식',
		'조식',
		'중식, 석식',
		'조식, 석식',
		'조식, 중식',
		'조식, 중식, 석식'
	];
	
	var cnt = [];

	for(var i = 0; i < 5; i++) {
		for(var j = 0; j < 8; j++) {
			if(daycheckmeal[i] == enumnumber[j]) {
				cnt[i] = j;
				continue;
			}	
		}
	}
	
	var mon = document.getElementsByClassName("mon");
	var tue = document.getElementsByClassName("tue");
	var wed = document.getElementsByClassName("wed");
	var thu = document.getElementsByClassName("thu");
	var fri = document.getElementsByClassName("fri");
	
	for(var i = 0; i < maxweek; i++) {
		if(mon[i].innerHTML != '') 
			mon[i].innerHTML += "<br><meal>" + enumcheck[cnt[0]] + "</meal>";
		if(tue[i].innerHTML != '')
			tue[i].innerHTML += "<br><meal>" + enumcheck[cnt[1]] +"</meal>";
		if(wed[i].innerHTML != '')
			wed[i].innerHTML += "<br><meal>" + enumcheck[cnt[2]] +"</meal>";
		if(thu[i].innerHTML != '')
			thu[i].innerHTML += "<br><meal>" + enumcheck[cnt[3]] +"</meal>";
		if(fri[i].innerHTML != '')
			fri[i].innerHTML += "<br><meal>" + enumcheck[cnt[4]] +"</meal>";
	}
	
</script>
</html>