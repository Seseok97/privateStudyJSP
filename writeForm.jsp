<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkData(){
	if(document.fr.name.value == ""){
		alert("INPUT ID!");
		document.fr.name.focus();
		return false;
	}
	if(document.fr.pass.value == ""){
			alert("INPUT PW!");
			document.fr.pass.focus();
			return false;
	}
	if(document.fr.subject.value == ""){
		alert("INPUT SUBJECT!");
		document.fr.subject.focus();
		return false;
	}
}// checkData() function end
</script>
</head>
<body>
<h1>writeForm.jsp(글 작성)</h1>

	<fieldset>
		<form action="writePro.jsp" method="post" name="fr" onsubmit="return checkData();">
			작성자:<input type="text" name="name"><br>
			비밀번호:<input type="password" name="pass"><br>
			제목:<input type="text" name="subject"><br>
			내용:<textarea rows="5" cols="35" name="content"></textarea><br>
		<hr>
			<input type="submit" value="write">
		
		</form>
	</fieldset>
</body>
</html>