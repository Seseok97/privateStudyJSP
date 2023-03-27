<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>writeForm.jsp (Create)</h1>
	<h2>게시판 글쓰기</h2>
	<fieldset>
	<legend>작성</legend>
		<form action="writePro.jsp" method="post">
			작성자: <input type="text" name=name><br>
			비밀번호: <input type="password" name="pass"><br>
			제목: <input type="text" name="subject"><br>
			내용: <textarea rows="5" cols="35" name="content"></textarea><br>
			<hr>
			<input type="submit" value="글쓰기">
		</form>
	</fieldset>

</body>
</html>