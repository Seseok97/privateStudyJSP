<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>review0224_proc.jsp</h1>
<%
String txt= request.getParameter("txt");
String wantEat = request.getParameter("wantEat");

out.println(txt);
%>
<br>
<%=wantEat %>
</body>
</html>