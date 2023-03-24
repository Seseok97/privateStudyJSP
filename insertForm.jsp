<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 정보입력 페이지(insertForm.jsp)</title>
	<script type="text/javascript">
	function checkData(){
		if(document.fr.id.value == ""){
			alert("아이디를 입력하세요!");
			document.fr.id.focus();
			return false;
		}	
	}// function end
	</script>
</head>
<body>
<h1>회원가입 정보입력 페이지(insertForm.jsp)</h1>
	<fieldset>
		<legend>Itwill Sign in</legend>
			<form action="insertPro.jsp" method="post" name="fr" onsubmit="return checkData();">
				ID: <input type="text" name="id"><br>
				PW: <input type="password" name="pw"><br>
				Name: <input type="text" name="name"><br>
				Age: <input type="text" name="age"><br>
				E-mail: <input type="text" name="email"><br>
				Gender:<br> <input type="radio" name="gender" value="남">Male<br>
							<input type="radio" name="gender" value="여">Female<br>
						
				<input type="submit" value="Sign in">
			</form>
	</fieldset>



</body>
</html>