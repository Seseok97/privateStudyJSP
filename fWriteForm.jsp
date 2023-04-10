<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> fWriteForm.jsp</h1>
<h2> 첨부파일을 포함한 글 작성</h2>

<fieldset>
	<form action="fWritePro.jsp" method="post" enctype="multipart/form-data">
			글쓴이: <input type="text" name="name" ><br>
			비밀번호: <input type="password" name="pass"><br>
			제목: <input type="text" name="subject"><br>
			내용: <textarea rows="5" cols="35" name="content"></textarea><br>
			첨부파일: <input type="file" name="file"><br>
			<hr>
				<input type="submit" value="글쓰기(첨부파일)">
	</form>
</fieldset>

</body>
</html>