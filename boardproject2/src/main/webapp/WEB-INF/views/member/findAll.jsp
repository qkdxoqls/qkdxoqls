<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<style type="text/css">
	
	body {
		background-color: black;
		color: white;
	}
	table {
		text-align: center;
		border-color: white;
	}
</style>
</head>
<body>

	findAll
	<a href="mainindex"><button>돌아가기</button></a>
	<table align="center" border="1">
		<tr>
			<td>회원번호</td>
			<td>회원아이디</td>
			<td>회원이름</td>
			<td>상세보기</td>
			<c:if test="${sessionScope.loginId eq 'admin' }">
			<td>관리</td>
			</c:if>
		</tr>
		<c:forEach items="${memberList}" var="member">
		<tr>
			<td>${member.m_number}</td>
			<td>${member.m_id}</td>
			<td>${member.m_name}</td>
			<td><a href="detail?m_number=${member.m_number}&page=${paging.page}"><button>더보기</button></a></td>
			<c:if test="${sessionScope.loginId eq 'admin' }">
			<td><a href="delete?m_number=${member.m_number}&page=${page}"><button>삭제</button></a></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	
	
	
	<div>
		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
			<!-- 현재 페이지에서 1감소한 페이지 요청하는 링크 -->
				<a href="paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
			
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="paging?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>