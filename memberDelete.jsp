<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>memberDelete.jsp</h1>
	<h2>회원 탈퇴!!</h2>
	<%
	String id = (String) session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURL());
	}
	%>
	
	<fieldset>
		<form action="memberDeletePro.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>">
			PW: <input type="password" name="pw"><br>
			<input type="submit" value="Quit">
		</form>
	</fieldset>
	

</body>
</html>