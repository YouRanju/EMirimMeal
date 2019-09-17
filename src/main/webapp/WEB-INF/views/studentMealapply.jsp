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
		<h1>급식신청</h1>
		<p>요일별로 조, 중, 석식을 선택해주세요</p>
		<form name="checkForm" method="post">
			<table border=1>
			<tr>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
			</tr>
			<tr>
				<td >
					<input type="checkbox" name="mon" class="mon" value="breakfast">조식<br>
					<input type="checkbox" name="mon" class="mon" value="lunch">중식<br>
					<input type="checkbox" name="mon" class="mon" value="dinner">석식<br>
				</td>
				<td >
					<input type="checkbox" name="tue" class="tue" value="breakfast">조식<br>
					<input type="checkbox" name="tue" class="tue" value="lunch">중식<br>
					<input type="checkbox" name="tue" class="tue" value="dinner">석식<br>
				</td>
				<td >
					<input type="checkbox" name="wed" class="wed" value="breakfast">조식<br>
					<input type="checkbox" name="wed" class="wed" value="lunch">중식<br>
					<input type="checkbox" name="wed" class="wed" value="dinner">석식<br>
				</td>
				<td >
					<input type="checkbox" name="thu" class="thu" value="breakfast">조식<br>
					<input type="checkbox" name="thu" class="thu" value="lunch">중식<br>
					<input type="checkbox" name="thu" class="thu" value="dinner">석식<br>
				</td>
				<td >
					<input type="checkbox" name="fri" class="fri" value="breakfast">조식<br>
					<input type="checkbox" name="fri" class="fri" value="lunch">중식<br>
					<input type="checkbox" name="fri" class="fri" value="dinner" disabled>석식<br>
				</td>
			</tr>
		</table>
	</form>
<button onclick = "checkTo()">저장하기</button>
<a href="${path }/emirimmeal/studentMeal">돌아가기</a>
</body>
<script>
	var checkMeal = '${state.checkmeal}';
	var isDorm = '${student.isdorm}';
	var daycheckmeal=[String(checkMeal.substr(0,3)),
		String(checkMeal.substr(3,3)),String(checkMeal.substr(6,3)),
		String(checkMeal.substr(9,3)),String(checkMeal.substr(12,3))];
	var enumnumber = ["000","001","010","100","011","101","110","111"];
	var enumcheck = [
		[false, false, false],
		[false, false, true],
		[false, true, false],
		[true, false, false],
		[false, true, true],
		[true, false, true],
		[true, true, false],
		[true, true, true]
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
	
	 if(isDorm != 'Y') {
		document.getElementsByClassName("mon")[0].disabled = true;
		document.getElementsByClassName("tue")[0].disabled = true;
		document.getElementsByClassName("wed")[0].disabled = true;
		document.getElementsByClassName("thu")[0].disabled = true;
		document.getElementsByClassName("fri")[0].disabled = true;
	} 
	 
	 if(checkMeal == '000000000000000') {
		 for(var i = 0; i < 3; i++) {
			 document.getElementsByClassName("mon")[i].disabled = true;
				document.getElementsByClassName("tue")[i].disabled = true;
				document.getElementsByClassName("wed")[i].disabled = true;
				document.getElementsByClassName("thu")[i].disabled = true;
				document.getElementsByClassName("fri")[i].disabled = true;
		}
	 }
	 
	for(var i = 0; i < 3; i++) {
		document.getElementsByClassName("mon")[i].checked=enumcheck[cnt[0]][i]; 
	}
	
	for(var i = 0; i < 3; i++) {
		document.getElementsByClassName("tue")[i].checked=enumcheck[cnt[1]][i]; 
	}
	
	for(var i = 0; i < 3; i++) {
		document.getElementsByClassName("wed")[i].checked=enumcheck[cnt[2]][i]; 
	}
	
	for(var i = 0; i < 3; i++) {
		document.getElementsByClassName("thu")[i].checked=enumcheck[cnt[3]][i]; 
	}
	
	for(var i = 0; i < 3; i++) {
		document.getElementsByClassName("fri")[i].checked=enumcheck[cnt[4]][i]; 
	}
	
	var redayMeal = [];
	
	function checkTo() {
		insertcheck("mon", 0);
		insertcheck("tue", 1);
		insertcheck("wed", 2);
		insertcheck("thu", 3);
		insertcheck("fri", 4);
		
		var submitMeal = '';
		for(var i = 0; i <5; i++) {
			submitMeal+=redayMeal[i];
		}
		
		document.checkForm.action = '${path}/emirimmeal/studentMealApply/${state.no}/' + submitMeal;
		console.log(document.checkForm.action);
		document.checkForm.submit();
	}
	
	function insertcheck(day, cnt) {
		var size = document.getElementsByName(day).length;
		var checkMealtoChar = '';
		
		for(var i = 0; i < size; i++){
	        if(document.getElementsByName(day)[i].checked == true){
	            checkMealtoChar += "1";
	        }
	        else {
	        	checkMealtoChar += "0";
	        }
	 	}
		
		redayMeal[cnt] = checkMealtoChar;
		checkMealtoChar = '';
	}
	
</script>
</html>