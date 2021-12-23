<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
	
	body {
		background-image: url("../galaxy_4-wallpaper-1600x900.jpg");
		background-repeat : no-repeat;
        background-size : cover;
		
	}
	
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
			<td>${board.b_writer}</td>
			<td>${board.b_date}</td>
			<td>${board.b_hits}</td>
		</tr>
		<tr>
			<td colspan="6"  id="id">내용</td>
		</tr>
		<tr>
			<td colspan="6">${board.b_contents}<br><img alt="" src="/resources/upload/${board.b_filename}"></td>
   			
		</tr>
	
	</table>
	<div id="conmment-write">
   		<input type="text" name="c_writer" placeholder="" value="${sessionScope.loginName}" readonly>
   		<input type="text" id="c_contents" placeholder="댓글내용" style="height: 22px; width: 550px;">
   		<button id="comment-writer-btn">댓글 등록</button>
   	</div>
   	<div id="conmment-list">
   		<table id="comment-list">
   			<tr>
   				<td>댓글 번호</td>
   				<td>댓글 작성자</td>
   				<td>댓글 내용</td>
   				<td>댓글 작성시간</td>
   			</tr>
   			<c:forEach items="${commentList}" var="comment"></c:forEach>
	   			<tr>
	   				<td>${comment.c_number}</td>
	   				<td>${comment.c_writer}</td>
	   				<td>${comment.c_contents}</td>
	   				<td>${comment.c_date}</td>
	   			</tr>
   		</table>
   	</div>
	<div>
		<a href="/board/update?b_number=${board.b_number}&page=${page}"><button>수정</button></a>
		<a href="/board/delete?b_number=${board.b_number}&page=${page}"><button>삭제하기</button></a>
		<a href="/board/findAllPage?b_number=${board.b_number}&page=${paging.page}"><button>목록으로</button></a>
	</div>
</body>
<script>
	/* const commentBtn = document.getElementById("comment-writer-btn");
	commentBtn.addEventListener("click", function() {
		console.log("댓글등록버튼 클릭");
	});
	*/
	$("#comment-writer-btn").click(function() {
		console.log("댓글등록버튼 클릭");
		
		const commentWriter = $("#c_writer").val();
		const commentContents = $("#c_contents").val();
		const boardNumber = '${board.b_number}';
		console.log(commentWriter,commentContents,boardNumber);
		$.ajax({
			type:'post',
			url: '/comment/insert',
			data: {
				'c_writer': commentWriter,
				'c_contents': commentContents,
				'b_number' : boardNumber},
			dataType: 'json',
			success : function(result) {
				console.log(result);	
				console.log(result);
				let output = "<table class='table'>";
				output += "<tr><th>댓글번호</th>";
				output += "<th>작성자</th>";
				output += "<th>내용</th>";
				output += "<th>작성시간</th></tr>";
				for(let i in result){
					output += "<tr>";
					output += "<td>"+result[i].c_number+"</td>";
					output += "<td>"+result[i].c_writer+"</td>";
					output += "<td>"+result[i].c_contents+"</td>";
					output += "<td>"+result[i].c_date+"</td>";
					output += "</tr>";
				}
				output += "</table>";
				// id가 comment-list인 div에 출력
				document.getElementById('comment-list').innerHTML = output;
				// 댓글 입력창을 비움. 
				document.getElementById('c_writer').value='';
				document.getElementById('c_contents').value='';
				
			},
			error: function() {
				console.log(">>>?");
			}
			
		});
	});
</script>
</html>