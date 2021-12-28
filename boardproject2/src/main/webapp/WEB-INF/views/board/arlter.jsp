<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">
	.h4{
		text-align: center;
	}
</style>
</head>
<body>
	<h2>글이 저장되었습니다</h2><br><br>
	<a href="/board/insert"><button>더 쓰기</button></a>
	<a href="/member/mainindex"><button>메인화면</button></a>
	<a href="/board/findAllPage?page=${page}"><button>목록으로 가기</button></a>
</body>
</html>