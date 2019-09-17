<%@page import="java.util.Calendar"%>
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
	
		<header>
			<h2> 
				급식신청기간 <br>
				${setting.starttime}부터 ~ ${setting.endtime}까지
			</h2>		
		</header>
		<leftmenu>
			<div id="loginInfo"></div>
			<a href="${path}/emirimmeal/index">로그아웃</a>
			<c:if test="${state.issave!='y'}">
				<a href="${path}/emirimmeal/studentMealApply"><button>급식신청하기</button></a>
			</c:if>
		</leftmenu>
		<main>
			<h1>${state.name}님의
			${setting.applydate}월 급식 신청 현황</h1>
			<table border=1 width="700">
				<tr>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
				</tr>
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
			        	  <tr>
			        	  	<td class="mon" height="32px"><%=daytoString[i][1] %></td>
			        	  	<td class="tue" height="32px"><%=daytoString[i][2] %></td>
			        	  	<td class="wed" height="32px"><%=daytoString[i][3] %></td>
			        	  	<td class="thu" height="32px"><%=daytoString[i][4] %></td>
			        	  	<td class="fri" height="32px"><%=daytoString[i][5] %></td>
			        	  <tr>
			        	  <%
			          }
			    %>
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
						<input type="submit" value="최종마감하기">
					</c:if>
				</form>
			
		</rightmenu>
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
	
	document.getElementById("checkPrice").innerHTML = "조식: " + dprice.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + "원 <br>"
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
			mon[i].innerHTML += "\t\t " + enumcheck[cnt[0]];
		if(tue[i].innerHTML != '')
			tue[i].innerHTML += "\t\t " + enumcheck[cnt[1]];
		if(wed[i].innerHTML != '')
			wed[i].innerHTML += "\t\t " + enumcheck[cnt[2]];
		if(thu[i].innerHTML != '')
			thu[i].innerHTML += "\t\t " + enumcheck[cnt[3]];
		if(fri[i].innerHTML != '')
			fri[i].innerHTML += "\t\t " + enumcheck[cnt[4]];
	}
	
</script>
</html>