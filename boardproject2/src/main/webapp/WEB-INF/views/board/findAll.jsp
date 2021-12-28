<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판목록</title>
<style type="text/css">
	
	#page {
		margin: auto;
	}
	
	#title{
		width: 700px;
	}
	#date{
		width: 190px;
	}
	
	#item{
		width: 70px;
	}
	
	#find{
		margin :auto;
		width: 1240px;
		text-align: center;
	}
</style>
</head>
<body>
	<a href="/member/mainindex"><button>메인으로</button></a>
	<a href="insert"><button>글쓰기</button></a>
	
	
	<table id="find">
		<tr id="toptr">
			<td id="item">No#</td>
			<td id="title">제목</td>
			<td id="date">작성일자</td>
			<td id="writer">작성자</td>
			<td id="hits">조회수</td>
		</tr>
		
		<tr>
			<td colspan="5"><hr></td>
		</tr>
		<c:forEach items="${boardList}" var="board">
		<tr>
			<td>No.${board.b_number}</td>
			<td><a href="/board/detail?b_number=${board.b_number}&page=${paging.page}">${board.b_title}</a></td>
			<td>${board.b_date}</td>
			<td>${board.b_writer}</td>
			<td>${board.b_hits}</td>
		</tr>
		</c:forEach>
	</table>
	<div id="page">
		<c:choose>
			<c:when test="${paging.page<=1}">
				 [이전] &nbsp;
			</c:when>
			<c:otherwise>
			<!-- 현재 페이지에서 1감소한 페이지 요청하는 링크 -->
				<a href="findAllPage?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
			
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="findAllPage?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="findAllPage?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>