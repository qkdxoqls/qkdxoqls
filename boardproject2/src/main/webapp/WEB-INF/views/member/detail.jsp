<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 페이지</title>
<style type="text/css">
	
	#btn{
		background-color: white;
		color: black;
	}
	
	body {
		background-color: black;
		color : white;
	}
	
	table {
	table-layout:auto;
	text-align: center;
	background-color: blue;
	border: white;
	}
	#toptr {
		background-color: red;
	}
</style>
</head>
<body>
	detail.jsp<br><br>
	<h2>관리자만 볼수 있습니다.<br>
	<br><br><br>
	접근 가능 권한 : admin(관리자)님<br>
	현재 접속중 아이디 : ${sessionScope.loginId}(${sessionScope.loginName})<br><br><br><br>
	</h2>
	<a href="paging?page=${page}"><button id="btn">뒤로가기</button></a>
	<c:if test="${sessionScope.loginId eq 'admin' }">
	<table border="1" width="1240px" align="center">
		<tr id="toptr" style="color : white;">
			<td>회원번호</td>
			<td>회원아이디</td>
			<td width="150px">회원이름</td>
			<td>회원비밀번호</td>
			<td width="370px">회원이메일</td>
			<td width="370px">회원전화번호</td>
		</tr>
		<tr>
			<td>${member.m_number}</td>
			<td>${member.m_id}</td>
			<td>${member.m_name}</td>
			<td>${member.m_password}</td>
			<td>${member.m_email}</td>
			<td>${member.m_phone}</td>
		</tr>
	</table>
	</c:if>
</body>
</html>