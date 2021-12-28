<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시mm분ss초");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style type="text/css">
	body {
		text-align: center;
	}
	table{
		padding : 10%;
		margin: auto;
	}
	
	#log {
		border: 1px solid;
	}
</style>
<script type="text/javascript">
function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '  ';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

</script>
</head>
<body>
	<table id="log">
		<tr>
			<td>
				<h4>${sessionScope.loginName}(${sessionScope.loginId})님</h4>
				접속시간 : <%= sf.format(nowTime) %><br>
				<br>
				<a href="logout"><button>로그아웃</button></a>
				<c:if test="${sessionScope.loginId eq 'admin' }">
					<a href="paging?page=${page}"><button>회원 목록 보기</button></a>
				</c:if>
				<a href="mypage"><button>마이페이지</button></a>
				<a href="/board/findAllPage?page=${page}"><button>글 목록 보기</button></a>
			</td>
		</tr>
		<tr>
			<td>
				<body onload="printClock()">
					<div id="clock" style=" align:center; solid #000000; width:600px; height:250px; line-height:250px; color:#666;font-size:100px; text-align:center;" id="clock">
				
				</div>	
			</td>
		</tr>
	</table>
</body>
</body>
</html>