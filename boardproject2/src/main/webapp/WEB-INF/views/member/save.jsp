<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function idDuplicate() {
		const id = document.getElementById('m_id').value;
		console.log(id);
		const checkResult = document.getElementById('id-dup-check');
		$.ajax({
			type: 'post',
			url : 'idDuplicate',
			data:{'m_id' : id},
			datatype: 'text',
			succese: function(result) {
				console.log('ajax성공');
				console.log(result);
				if(result=="ok"){
					checkResult.style.color ="green";
					checkResult.innerHTML = "good";
				} else {
					checkResult.style.color ="red";
					checkResult.innerHTML = "bad";
				}
			},
			error: function() {
				console.log('ajax실패');
			}
		});
	}
</script>
</head>
<body>
	<form action="save" method="post">
		아이디 <br><input type="text" name="m_id" onblur="idDuplicate()" id="m_id" style="width:240px;height:30px;font-size:16px;">
		<span id="id-dup-check"></span><br>
		비밀번호 <br><input type="password" name="m_password" style="width:240px;height:30px;font-size:40px;"><br>
		이름 <br><input type="text" name="m_name" style="width:240px;height:30px;font-size:16px;"><br>
		이메일 <br><input type="email" name="m_email" style="width:240px;height:30px;font-size:16px;"><br>
		전호번호 <br><input type="tel" name="m_phone" style="width:240px;height:30px;font-size:16px;"><br>
		<br><input type="submit" value="가입">
	</form>
</body>
</html>