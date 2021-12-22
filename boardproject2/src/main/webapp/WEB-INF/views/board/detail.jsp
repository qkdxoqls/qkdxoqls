<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세조회</title>
<style type="text/css">

	table {
		width: 1200px;
		table-layout:auto;
		text-align: center;
		background-color: black;
		border: white;
		color: white;
	}
	#id {
		background-color: red;
	}
</style>
</head>
<body>
	<table id="find" border="1" align="center">
		<tr>	
			<td id="id">제목</td>
			<td colspan="4">${board.b_title}</td>
		</tr>
		<tr>
			<td id="id">No #</td>
			<td colspan="5">No.${board.b_number}</td>
		</tr>
		<tr>
			<td id="id">작성자</td>
			<td id="id">작성일자</td>
			<td id="id">조회수</td>
		</tr>
		<tr>
			<td>${member.m_id}</td>
			<td>${board.b_date}</td>
			<td>${board.b_hits}</td>
		</tr>
		<tr>
			<td colspan="5"  id="id">내용</td>
		</tr>
		<tr>
			<td colspan="5">${board.b_contents}</td>
   		</tr>
   		<tr>
   			<td colspan="5"><img alt="" src="/resources/upload/${board.b_filename}"><br></td>
		</tr>
	
	</table>
	<div>
		<a href="/board/update?b_number=${board.b_number}&page=${page}"><button>수정</button></a>
		<a href="/board/delete?b_number=${board.b_number}&page=${page}"><button>삭제하기</button></a>
		<a href="/board/findAllPage?b_number=${board.b_number}&page=${paging.page}"><button>목록으로</button></a>
	</div>
</body>
</html>