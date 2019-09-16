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
			<div id="checkPrice">
				조식: 원<br>
				중식: 원<br>
				석식: 원<br>
			</div>
			<c:if test="${state.issave!='y'}">
				<a href="${path}/emirimmeal/save"><button>최종마감하기</button></a>
			</c:if>
		</rightmenu>
</body>
</html>