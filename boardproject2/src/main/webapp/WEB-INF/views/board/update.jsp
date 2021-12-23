<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>

</head>
<body>
	<h2>update.jsp</h2>
	<form action="/board/update" method="post" name="update_form">
	<input type="hidden" name="page" value=${page}>
		글번호: <input type="text" name="b_number" value="${board.b_number}" readonly> <br>
		제목: <input type="text" name="b_title" value="${board.b_title}"> <br>
		내용: <textarea name="b_contents" rows="5">${board.b_contents}</textarea><br>
		<input type="submit" value="수정">
	</form>
	
	
</body>
</html>