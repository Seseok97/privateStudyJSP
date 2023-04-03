<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>boardDelete.jsp</h1>
<%
int bno = Integer.parseInt(request.getParameter("bno"));
String pageNum = request.getParameter("pageNum");
%>

<%=bno %>
<fieldset>
	<form action="boardDeletePro.jsp?pageNum=<%=pageNum %>" method="post">
	<input type="hidden" name="bno" value="<%=bno %>">
		PW: <input type="password" name="pass">
		<input type="submit" value="삭제">
	</form>
</fieldset>




</body>
</html>