<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>loginReview_0227_logout.jsp</h1>

<script type="text/javascript">
alert("Good bye!");
</script>
<%
session.invalidate();
response.sendRedirect("loginReview_0227_main.jsp");
%>

</body>
</html>