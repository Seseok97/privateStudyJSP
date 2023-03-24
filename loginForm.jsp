<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>loginForm.jsp</h1>
	<fieldset>
		<legend>ITWILL Login</legend>
	
		<form action="loginPro.jsp" method="post">
			<input type="hidden" name="oldURL" value="<%=request.getParameter("oldURL")%>">
			ID: <input type="text" name="id"><br>
			PW: <input type="password" name="pw"><br>
			<hr>
			
			<input type="submit" value="Login">
			<input type="button" value="Sign in" onclick="location.href='insertForm.jsp';">
		</form>
		
	</fieldset>
	
	
</body>
</html>