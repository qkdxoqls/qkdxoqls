<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	form{
		margin: auto;
		text-align: center;
		padding: 12%;
	}
</style>
</head>
<body>
	insert.jsp
	<form action="insert" method="post" enctype="multipart/form-data">
		작성자 <input type="text" name="b_writer" placeholder="" value="${sessionScope.loginName}" readonly><br>
		제목 <input type="text" name="b_title"><br>
		내용 <textarea rows="50" cols="60" name="b_contents"></textarea><br>
		첨부 파일 <input type="file" name="b_file"><br>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>