<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<link href="C:\Users\master\Desktop\다운로드.ico" rel="shortcut icon" type="image/x-icon">
	<title>Home</title>
<script type="text/javascript">
function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = '오전'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = '오후';
    	currentHours = addZeros(currentHours - 12,2);
    }

    
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = ' ';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

</script>
<style type="text/css">

	@font-face {
    font-family: 'HSYuji-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSYuji-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<style type="text/css">

	
	#h1{
		text-align: center;
	}
	
	#clock{
		position: absolute;
		left: 50%;
	  	transform: translateX(-50%);
	}
	
	#btn{
		position: absolute;
		left: 50%;
	  	transform: translateX(-50%);
	}
	
</style>
</head>
<body>
<h1 id="h1" style="font-family: 'HSYuji-Regular';" font-size="79">
	Board  
</h1>
<div id="btn">
	<a href="member/save"><button>회원가입</button></a>
	<a href="member/login"><button>로그인</button></a>
</div><br><br><br><br><br>
	<body onload="printClock()">
	<div id="clock" style=" align:center; solid #000000; width:600px; height:250px; line-height:250px; color:#666;font-size:100px; text-align:center;" id="clock">
	</div>
</body>
</html>
