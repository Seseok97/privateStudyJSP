<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>loginReview_0227_main.jsp</h1>
<%
//로그인의 전반적인 흐름
// 로그인 페이지 - 아이디 입력, 비밀번호 입력, 로그인 버튼
// 아이디입력 성공   1
// 아이디입력 실패   2
// 아이디입력란 공백 3

// 1 - 1, 비밀번호 입력
// 2 - 1, 아이디 재입력 요청, 끝
// 3 - 1, 아이디입력 안내, 끝

// 1 - 1 - 1 비밀번호 입력 성공
// 1 - 1 - 2 비밀번호 입력실패
// 1 - 1 - 3 비밀번호입력란 공백

// 1 - 1 - 1 - 1 로그인성공페이지 이동
// 1 - 1 - 2 - 1 비밀번호 재입력 요청, 끝
// 1 - 1 - 3 - 1 비밀번호 입력 안내, 끝
%>
<form action="loginReview_0227_proc.jsp" method="post">
	<fieldset>
		<legend>LOGIN</legend>
		ID: <input type="text" name="id"><br>
		PW: <input type="password" name="pw">
		<hr>
		<input type="submit" value="LOGIN">
	</fieldset>
</form>


</body>
</html>