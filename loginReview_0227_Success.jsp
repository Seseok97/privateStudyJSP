<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>loginReview_0277_Success.jsp</h1>

<hr>
<h1>WELCOME!</h1>
<hr>
<script type="text/javascript">
function logout(){
	location.href="loginReview_0227_logout.jsp";
}
</script>
<%
String loginInfoCheck=(String)session.getAttribute("loginSuccess");
if(loginInfoCheck.equals("false")){ // 로그아웃 이후 재접속 방지
	response.sendRedirect("loginReview_0227_main.jsp");
}
%>
<input type="button" value="LOGOUT" onclick="logout()">

</body>
</html>